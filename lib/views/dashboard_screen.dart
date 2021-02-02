import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';

class DashboardScreen extends StatefulWidget {
  @override
  _DashboardScreenState createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;
    return Scaffold(
        appBar: AppBar(),
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
