import 'package:flutter/material.dart';
import 'package:learn_with_ar/routes.dart';
import 'package:learn_with_ar/views/widgets/avatar_grid.dart';

class CategoryScreen extends StatefulWidget {
  String categoryName;
  CategoryScreen({this.categoryName});
  @override
  _CategoryScreenState createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.categoryName),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: AvatarGrid(
          filterOption: widget.categoryName,
        ),
      ),
    );
  }
}
