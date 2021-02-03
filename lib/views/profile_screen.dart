import 'package:flutter/material.dart';
import 'package:learn_with_ar/views/widgets/nav_bar.dart';

class profileScreen extends StatefulWidget {
  @override
  _profileScreenState createState() => _profileScreenState();
}

class _profileScreenState extends State<profileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile Screen'),
      ),
      bottomNavigationBar: nav(2),
    );
  }
}
