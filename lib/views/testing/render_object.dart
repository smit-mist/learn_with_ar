import 'package:flutter/material.dart';
import 'package:model_viewer/model_viewer.dart';

class RenderTest extends StatefulWidget {
  @override
  _RenderTestState createState() => _RenderTestState();
}

class _RenderTestState extends State<RenderTest> {
  //https://modelviewer.dev/shared-assets/models/Astronaut.glb - astro
  //
  String url =
      'https://firebasestorage.googleapis.com/v0/b/learn-with-ar.appspot.com/o/Mammoth.glb?alt=media&token=963e1f91-c3a2-4d8c-898c-7d9e58c76592';
  bool flag = false;
  @override
  Widget build(BuildContext context) {
    print('===========> $url');
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
          src: url,
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
