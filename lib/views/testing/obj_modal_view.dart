import 'package:flutter/material.dart';
import 'package:flutter_cube/flutter_cube.dart';

class ObjModalViewer extends StatefulWidget {
  @override
  _ObjModalViewerState createState() => _ObjModalViewerState();
}

class _ObjModalViewerState extends State<ObjModalViewer> {
  @override
  Widget build(BuildContext context) {

    print('Aventador is coming');
    return Scaffold(
      body: Center(
        child: Cube(
          onSceneCreated: (Scene scene) {
            scene.world.add(
              Object(
                fileName: 'assets/DNA.obj',
              ),
            );
          },
        ),
      ),
    );
  }
}
