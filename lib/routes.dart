import 'package:flutter/material.dart';
import 'package:learn_with_ar/views/all_avatar_screen.dart';
import 'views/testing/3d_model_viewer_screen.dart';
import 'package:learn_with_ar/views/dashboard_screen.dart';
import 'package:learn_with_ar/views/login_screen.dart';
import 'views/testing/obj_modal_view.dart';
import 'views/testing/render_object.dart';
import 'package:learn_with_ar/views/uploadScreen.dart';
import 'package:learn_with_ar/views/profileScreen.dart';

Map<String, Widget Function(BuildContext)> route_generator = {
  'login': (context) => LoginScreen(),
  'modal': (context) => ModalViewer(),
  'object': (context) => RenderTest(),
  'obj': (context) => ObjModalViewer(),
  'dash': (context) => DashboardScreen(),
  'upload': (context) => uploadScreen(),
  'profile': (context) => profileScreen(),
  'all_avatar':(context)=>AllAvatarScreen(),
};
