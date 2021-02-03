import 'dart:async' show Completer;
import 'dart:convert' show utf8;
import 'dart:io'
    show File, HttpRequest, HttpServer, HttpStatus, InternetAddress, Platform;
import 'dart:typed_data' show Uint8List;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:flutter_android/android_content.dart' as android_content;
import 'package:webview_flutter/platform_interface.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'html_builder.dart';

class ModelViewer extends StatefulWidget {
  ModelViewer(
      {Key key,
      this.backgroundColor = Colors.white,
      @required this.src,
      this.alt,
      this.ar,
      this.arModes,
      this.arScale,
      this.autoRotate,
      this.autoRotateDelay,
      this.autoPlay,
      this.cameraControls,
      this.iosSrc})
      : super(key: key);

  final Color backgroundColor;
  final String src;
  final String alt;
  final bool ar;
  final List<String> arModes;
  final String arScale;
  final bool autoRotate;
  final int autoRotateDelay;
  final bool autoPlay;
  final bool cameraControls;
  final String iosSrc;

  @override
  State<ModelViewer> createState() => _ModelViewerState();
}

class _ModelViewerState extends State<ModelViewer> {
  final Completer<WebViewController> _controller =
      Completer<WebViewController>();
  int curr;
  HttpServer _proxy;

  @override
  void initState() {
    print('==============> ${widget.src}');
    super.initState();
    _initProxy().whenComplete(() {
      setState(() {
        curr = 1;
      });
    });
  }

  @override
  void dispose() {
    super.dispose();
    if (_proxy != null) {
      _proxy.close(force: true);
      _proxy = null;
    }
  }

  @override
  void didUpdateWidget(final ModelViewer oldWidget) {
    super.didUpdateWidget(oldWidget);
    // TODO
  }

  @override
  Widget build(final BuildContext context) {
    return curr == null
        ? Container(
            height: 50,
            child: Center(
              child: CircularProgressIndicator(),
            ),
          )
        : WebView(
            initialUrl: null,
            javascriptMode: JavascriptMode.unrestricted,
            initialMediaPlaybackPolicy: AutoMediaPlaybackPolicy.always_allow,
            onWebViewCreated:
                (final WebViewController webViewController) async {
              _controller.complete(webViewController);
              final host = _proxy.address.address;
              final port = _proxy.port;
              final url = "http://$host:$port/";
              print('>>>> ModelViewer initializing... <$url>'); // DEBUG
              await webViewController.loadUrl(url);
            },
            navigationDelegate: (final NavigationRequest navigation) async {
              //print('>>>> ModelViewer wants to load: <${navigation.url}>'); // DEBUG
              if (!Platform.isAndroid) {
                return NavigationDecision.navigate;
              }
              if (!navigation.url.startsWith("intent://")) {
                return NavigationDecision.navigate;
              }
              try {
                // See: https://developers.google.com/ar/develop/java/scene-viewer
                final intent = android_content.Intent(
                  action: "android.intent.action.VIEW", // Intent.ACTION_VIEW
                  data: Uri.parse("https://arvr.google.com/scene-viewer/1.0")
                      .replace(
                    queryParameters: <String, dynamic>{
                      'file': widget.src,
                      'mode': 'ar_only',
                    },
                  ),
                  package: "com.google.ar.core",
                  flags: 0x10000000, // Intent.FLAG_ACTIVITY_NEW_TASK,
                );
                await intent.startActivity();
              } catch (error) {
                print('>>>> ModelViewer failed to launch AR: $error'); // DEBUG
              }
              return NavigationDecision.prevent;
            },
            onPageStarted: (final String url) {
              //print('>>>> ModelViewer began loading: <$url>'); // DEBUG
            },
            onPageFinished: (final String url) {
              //print('>>>> ModelViewer finished loading: <$url>'); // DEBUG
            },
            onWebResourceError: (final WebResourceError error) {
              print(
                  '>>>> ModelViewer failed to load: ${error.description} (${error.errorType} ${error.errorCode})'); // DEBUG
            },
          );
  }

  String _buildHTML(final String htmlTemplate) {
    return HTMLBuilder.build(
      htmlTemplate: htmlTemplate,
      backgroundColor: Colors.white,
      src: '/model',
      alt: widget.alt,
      ar: widget.ar,
      arModes: widget.arModes,
      arScale: widget.arScale,
      autoRotate: widget.autoRotate,
      autoRotateDelay: widget.autoRotateDelay,
      autoPlay: widget.autoPlay,
      cameraControls: widget.cameraControls,
      iosSrc: widget.iosSrc,
    );
  }

  Future<int> _initProxy() async {
    final url = Uri.parse(widget.src);
    _proxy = await HttpServer.bind(InternetAddress.loopbackIPv4, 0);
    _proxy.listen((final HttpRequest request) async {
      //print("${request.method} ${request.uri}"); // DEBUG
      //print(request.headers); // DEBUG
      final response = request.response;

      switch (request.uri.path) {
        case '/':
        case '/index.html':
          final htmlTemplate = await rootBundle
              .loadString('packages/model_viewer/etc/assets/template.html');
          final html = utf8.encode(_buildHTML(htmlTemplate));
          response
            ..statusCode = HttpStatus.ok
            ..headers.add("Content-Type", "text/html;charset=UTF-8")
            ..headers.add("Content-Length", html.length.toString())
            ..add(html);
          await response.close();
          break;

        case '/model-viewer.js':
          final code = await _readAsset(
              'packages/model_viewer/etc/assets/model-viewer.js');
          response
            ..statusCode = HttpStatus.ok
            ..headers
                .add("Content-Type", "application/javascript;charset=UTF-8")
            ..headers.add("Content-Length", code.lengthInBytes.toString())
            ..add(code);
          await response.close();
          break;

        case '/model':
          if (url.isAbsolute && !url.isScheme("file")) {
            await response.redirect(url); // TODO: proxy the resource
          } else {
            final data = await (url.isScheme("file")
                ? _readFile(url.path)
                : _readAsset(url.path));
            response
              ..statusCode = HttpStatus.ok
              ..headers.add("Content-Type", "application/octet-stream")
              ..headers.add("Content-Length", data.lengthInBytes.toString())
              ..headers.add("Access-Control-Allow-Origin", "*")
              ..add(data);
            await response.close();
          }
          break;

        case '/favicon.ico':
        default:
          final text = utf8.encode("Resource '${request.uri}' not found");
          response
            ..statusCode = HttpStatus.notFound
            ..headers.add("Content-Type", "text/plain;charset=UTF-8")
            ..headers.add("Content-Length", text.length.toString())
            ..add(text);
          await response.close();
          break;
      }
    });
    return 1;
  }

  Future<Uint8List> _readAsset(final String key) async {
    final data = await rootBundle.load(key);
    return data.buffer.asUint8List(data.offsetInBytes, data.lengthInBytes);
  }

  Future<Uint8List> _readFile(final String path) async {
    return await File(path).readAsBytes();
  }
}
