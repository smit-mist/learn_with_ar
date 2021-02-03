import 'package:flutter/material.dart';
import 'package:learn_with_ar/views/widgets/nav_bar.dart';

class uploadScreen extends StatefulWidget {
  @override
  _uploadScreenState createState() => _uploadScreenState();
}

class _uploadScreenState extends State<uploadScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Upload Screen'),
      ),
      bottomNavigationBar: nav(1),
    );
  }
}
