import 'package:flutter/material.dart';
import 'package:learn_with_ar/views/widgets/avatar_grid.dart';

class AllAvatarScreen extends StatefulWidget {
  @override
  _AllAvatarScreenState createState() => _AllAvatarScreenState();
}

class _AllAvatarScreenState extends State<AllAvatarScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'All Avatar',
        ),
      ),
      body: AvatarGrid(),
    );
  }
}
