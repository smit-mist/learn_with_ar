import 'package:flutter/material.dart';
import 'package:learn_with_ar/views/3d_model_viewer_screen.dart';
import 'package:learn_with_ar/views/login_screen.dart';

Map<String, Widget Function(BuildContext)> route_generator = {
  'login': (context) => LoginScreen(),
  'modal':(context)=>ModalViewer(),

};
