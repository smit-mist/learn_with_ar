import 'package:flutter/material.dart';
import 'package:arcore_flutter_plugin/arcore_flutter_plugin.dart';
import 'package:vector_math/vector_math_64.dart' as vector;

class ModalViewer extends StatefulWidget {
  @override
  _ModalViewerState createState() => _ModalViewerState();
}

class _ModalViewerState extends State<ModalViewer> {
  ArCoreController _controller;
  _onArCoreView(ArCoreController controller) {
    _controller = controller;
    _addSphere(_controller);
  }

  _addSphere(ArCoreController _ar) {
    final material = ArCoreMaterial(color: Colors.purple);
    final sphere = ArCoreSphere(materials: [material], radius: 0.2);
    final node = ArCoreNode(
      shape: sphere,
      position: vector.Vector3(
        0,0,-1
      ),
    );
    _controller.addArCoreNode(node);
  }
@override
  void dispose() {
    _controller.dispose();
    // TODO: implement dispose
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Modal Viewer'),
      ),
      body: ArCoreView(
        onArCoreViewCreated: _onArCoreView,
      ),
    );
  }
}
