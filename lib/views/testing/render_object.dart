import 'package:flutter/material.dart';
import 'package:model_viewer/model_viewer.dart';

class RenderTest extends StatefulWidget {
  @override
  _RenderTestState createState() => _RenderTestState();
}

class _RenderTestState extends State<RenderTest> {
  //https://modelviewer.dev/shared-assets/models/Astronaut.glb - astro
  //https://firebasestorage.googleapis.com/v0/b/learn-with-ar.appspot.com/o/apollo.glb?alt=media&token=6ca3250f-9e91-4b7c-9bb2-4c0228585a2a
  String url =
      'https://firebasestorage.googleapis.com/v0/b/learn-with-ar.appspot.com/o/apollo.glb';
  bool flag = false;
  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Model Object",
        ),
      ),
      body: Container(
        height: h*0.8,
        width: w,
        child: ModelViewer(
          src: 'assets/pump.glb',
          alt: "A 3D model of an astronaut",
          ar: true,
          arScale: "auto",

          autoRotate: flag,
          autoRotateDelay: 0,
          cameraControls: true,
          //autoPlay: true,
          //   cameraControls: true,
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.blue,
        onPressed: (){
          setState(() {
            flag = !flag;
          });
        },
      ),
    );
  }
}
