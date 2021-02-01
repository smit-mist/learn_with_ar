import 'package:flutter/material.dart';
import 'package:learn_with_ar/views/login_screen.dart';

Map<String, Widget Function(BuildContext)> route_generator = {
  'login': (context) => LoginScreen(),

};
