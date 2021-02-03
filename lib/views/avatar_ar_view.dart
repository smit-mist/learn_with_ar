import 'package:flutter/material.dart';
import 'package:learn_with_ar/modals/avatar.dart';
import 'package:learn_with_ar/views/widgets/modal_viewer.dart';

class AvatarArView extends StatefulWidget {
  Avatar currentAvatar;
  AvatarArView({this.currentAvatar});
  @override
  _AvatarArViewState createState() => _AvatarArViewState();
}

class _AvatarArViewState extends State<AvatarArView> {
  bool loading = true;
  @override
  Widget build(BuildContext context) {
    print('===========> ${widget.currentAvatar.modelUrl}');
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: Text(
            widget.currentAvatar.name,
          ),
        ),
        body: Stack(
          children: [
            AnimatedOpacity(
              opacity: loading ? 1 : 0,
              child: Container(
                child: Center(
                  child: CircularProgressIndicator(),
                ),
              ),
              duration: Duration(milliseconds: 200),
            ),
            AnimatedOpacity(
              opacity: loading ? 0 : 1,
              duration: Duration(milliseconds: 200),
              child: ModelViewer(
                enableColorChange: true,
                backgroundColor: Colors.white,
                src: widget.currentAvatar.modelUrl,
                alt: widget.currentAvatar.description,
                ar: true,
                arScale: "auto",
                autoRotate: true,
                autoRotateDelay: 0,
                cameraControls: true,
                onModelIsVisisble: () {
                  setState(() {
                    loading = false;
                  });
                },
              ),
            ),
          ],
        ));
  }
}
