import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';

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
        floatingActionButton: FloatingActionButton(onPressed: () {
          Navigator.pushNamed(context, 'object');
        }),
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
            )
          ],
        ),
        body: GridView.count(
          primary: false,
          padding: const EdgeInsets.all(20),
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
          crossAxisCount: 2,
          children: <Widget>[
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(20)),
                color: Colors.teal[100],
              ),
              padding: const EdgeInsets.all(8),
              child: const Text('Smit'),
            ),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(20)),
                color: Colors.teal[200],
              ),
              padding: const EdgeInsets.all(8),
              child: const Text('Smit'),
            ),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(20)),
                color: Colors.teal[300],
              ),
              padding: const EdgeInsets.all(8),
              child: const Text('Smit'),
            ),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(20)),
                color: Colors.teal[400],
              ),
              padding: const EdgeInsets.all(8),
              child: const Text('Smit'),
            ),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(20)),
                color: Colors.teal[500],
              ),
              padding: const EdgeInsets.all(8),
              child: const Text('Smit'),
            ),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(20)),
                color: Colors.teal[600],
              ),
              padding: const EdgeInsets.all(8),
              child: const Text('Smit'),
            ),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(20)),
                color: Colors.teal[600],
              ),
              padding: const EdgeInsets.all(8),
              child: const Text('Smit'),
            ),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(20)),
                color: Colors.teal[600],
              ),
              padding: const EdgeInsets.all(8),
              child: const Text('Smit'),
            ),
          ],
        ));
  }
}
