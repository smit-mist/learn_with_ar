import 'package:flutter/material.dart';

typedef ChangeColorTypeDef = Future<String> Function(String, int);

class ModelViewerColorController {
  ChangeColorTypeDef changeColor;
  // ToDo: Add a function to get possibble color areas
  // ToDo: set colors for detected areas

  void dispose() {
    changeColor = null;
  }
}