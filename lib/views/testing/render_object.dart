import 'package:flutter/material.dart';
import 'package:model_viewer/model_viewer.dart';

class RenderTest extends StatefulWidget {
  @override
  _RenderTestState createState() => _RenderTestState();
}

class _RenderTestState extends State<RenderTest> {
  //https://modelviewer.dev/shared-assets/models/Astronaut.glb - astro
  String url = 'https://modelviewer.dev/shared-assets/models/Astronaut.glb';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Model Object",
        ),
      ),
      body: ModelViewer(
        src: url,
        alt: "A 3D model of an astronaut",
        ar: true,
        arScale: "auto",
        autoRotate: true,
        autoRotateDelay: 0,
        //   cameraControls: true,
      ),
    );
  }
}
