import 'package:flutter/material.dart';

class ModalViewer extends StatefulWidget {
  @override
  _ModalViewerState createState() => _ModalViewerState();
}

class _ModalViewerState extends State<ModalViewer> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Modal Viewer'),
      ),
    );
  }
}
