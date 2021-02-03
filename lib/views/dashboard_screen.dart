import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:learn_with_ar/views/widgets/nav_bar.dart';
import 'package:learn_with_ar/views/widgets/dashboard_grid_container.dart';

class DashboardScreen extends StatefulWidget {
  @override
  _DashboardScreenState createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  @override
  String _image_add =
      'https://images.newscientist.com/wp-content/uploads/2019/05/03155847/gettyimages-932737574-2.jpg';
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;
    return Scaffold(
      floatingActionButton: FloatingActionButton(onPressed: () {
        Navigator.pushNamed(context, 'all_avatar');
      }),
      appBar: AppBar(),
      body: GridView.count(
        primary: false,
        padding: const EdgeInsets.all(20),
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
        crossAxisCount: 2,
        children: <Widget>[
          GridContainer(
              color: Colors.teal[400], text: 'Hello', imageUrl: _image_add),
          GridContainer(
              color: Colors.teal[400], text: 'Hello', imageUrl: _image_add),
          GridContainer(
              color: Colors.teal[400], text: 'Hello', imageUrl: _image_add),
          GridContainer(
              color: Colors.teal[400], text: 'Hello', imageUrl: _image_add),
          GridContainer(
              color: Colors.teal[400], text: 'Hello', imageUrl: _image_add),
          GridContainer(
              color: Colors.teal[400], text: 'Hello', imageUrl: _image_add),
          GridContainer(
              color: Colors.teal[400], text: 'Hello', imageUrl: _image_add),
          GridContainer(
              color: Colors.teal[400], text: 'Hello', imageUrl: _image_add),
        ],
      ),
      bottomNavigationBar: nav(0),
    );
  }
}
