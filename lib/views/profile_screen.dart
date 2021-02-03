import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:learn_with_ar/views/widgets/nav_bar.dart';
import 'package:learn_with_ar/views/widgets/dashboard_grid_container.dart';
import 'package:firebase_auth/firebase_auth.dart';

class profileScreen extends StatefulWidget {
  @override
  _profileScreenState createState() => _profileScreenState();
}

class _profileScreenState extends State<profileScreen> {
  @override
  final _auth = FirebaseAuth.instance;
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile Screen'),
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
      bottomNavigationBar: nav(2),
    );
  }
}
