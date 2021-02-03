import 'package:flutter/material.dart';
import 'views/testing/3d_model_viewer_screen.dart';
import 'package:learn_with_ar/views/DashboardScreen.dart';
import 'package:learn_with_ar/views/LoginScreen.dart';
import 'views/testing/obj_modal_view.dart';
import 'views/testing/render_object.dart';
import 'package:learn_with_ar/views/UploadScreen.dart';
import 'package:learn_with_ar/views/ProfileScreen.dart';

Map<String, Widget Function(BuildContext)> route_generator = {
  'login': (context) => LoginScreen(),
  'modal': (context) => ModalViewer(),
  'object': (context) => RenderTest(),
  'obj': (context) => ObjModalViewer(),
  'dash': (context) => DashboardScreen(),
  'upload': (context) => uploadScreen(),
  'profile': (context) => profileScreen(),
};
