import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:learn_with_ar/views/widgets/dashboard_grid_container.dart';

class DashboardScreen extends StatefulWidget {
  @override
  _DashboardScreenState createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  final _auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;
    return Scaffold(
      /*floatingActionButton: FloatingActionButton(onPressed: () {
        Navigator.pushNamed(context, 'object');
      }),*/
      appBar: AppBar(
        actions: [
          GestureDetector(
            child: Icon(
              Icons.logout,
            ),
            onTap: () async {
              await _auth.signOut();
              Navigator.pushNamedAndRemoveUntil(
                  context, 'login', (route) => false);
            },
          ),
        ],
      ),
      body: GridView.count(
        primary: false,
        padding: const EdgeInsets.all(20),
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
        crossAxisCount: 2,
        children: <Widget>[
          GridContainer(
            color: Colors.teal[400],
            text: 'Hello',
          ),
          GridContainer(
            color: Colors.teal[400],
            text: 'Hello',
          ),
          GridContainer(
            color: Colors.teal[400],
            text: 'Hello',
          ),
          GridContainer(
            color: Colors.teal[400],
            text: 'Hello',
          ),
          GridContainer(
            color: Colors.teal[400],
            text: 'Hello',
          ),
          GridContainer(
            color: Colors.teal[400],
            text: 'Hello',
          ),
          GridContainer(
            color: Colors.teal[400],
            text: 'Hello',
          ),
          GridContainer(
            color: Colors.teal[400],
            text: 'Hello',
          ),
        ],
      ),
      bottomNavigationBar: nav(0),
    );
  }
}
