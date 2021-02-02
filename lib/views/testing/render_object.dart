import 'package:flutter/material.dart';
import 'package:model_viewer/model_viewer.dart';

class RenderTest extends StatefulWidget {
  @override
  _RenderTestState createState() => _RenderTestState();
}

class _RenderTestState extends State<RenderTest> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Model Object",
        ),
      ),
      body: ModelViewer(
        src: 'https://modelviewer.dev/shared-assets/models/Astronaut.glb',
        alt: "A 3D model of an astronaut",
        ar: true,
        arScale: "auto",
        autoRotate: true,
        autoRotateDelay: 0,
        cameraControls: true,

      ),
    );
  }
}
