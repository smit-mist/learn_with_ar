import 'package:learn_with_ar/routes.dart';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'dart:convert';
import 'package:learn_with_ar/views/widgets/nav_bar.dart';

class RedirectScreen extends StatefulWidget {
  @override
  _RedirectScreenState createState() => _RedirectScreenState();
}

class _RedirectScreenState extends State<RedirectScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Upload Model'),
      ),
      body: WebView(
        initialUrl: 'https://learn-with-ar.firebaseapp.com/',
        javascriptMode: JavascriptMode.unrestricted,
      ),
      bottomNavigationBar: nav(2),
    );
  }
}
