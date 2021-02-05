import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:learn_with_ar/routes.dart';
import 'package:flutter/services.dart';
import 'package:learn_with_ar/views/login_screen.dart';
import 'package:learn_with_ar/views/transition_route_observer.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:learn_with_ar/repository/avatar_repository.dart';
import 'package:provider/provider.dart';

import 'modals/avatar.dart';
import 'repository/app_user_repository.dart';
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  SystemChrome.setSystemUIOverlayStyle(
    SystemUiOverlayStyle(
      systemNavigationBarColor:
          SystemUiOverlayStyle.dark.systemNavigationBarColor,
    ),
  );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final _auth = FirebaseAuth.instance;
  AppUserRepo userRepo = AppUserRepo();
  @override
  Widget build(BuildContext context) {
    if(_auth.currentUser !=null){
     userRepo.getUser(_auth.currentUser.uid);
    }
    return StreamProvider<List<Avatar>>.value(
      value: AvatarRepo().avatars,
      child: MaterialApp(
        title: 'Learn with AR',
        routes: routeGenerator,
        initialRoute: _auth.currentUser != null ? 'dash' : 'login',
        theme: ThemeData(
          // brightness: Brightness.dark,
          primarySwatch: Colors.deepPurple,
          accentColor: Colors.orange,
          cursorColor: Colors.orange,
          textTheme: TextTheme(
            button: TextStyle(
              fontFamily: 'OpenSans',
            ),
            caption: TextStyle(
              fontFamily: 'NotoSans',
              fontSize: 12.0,
              fontWeight: FontWeight.normal,
              color: Colors.deepPurple[300],
            ),
            overline: TextStyle(fontFamily: 'NotoSans'),
          ),
        ),
        navigatorObservers: [TransitionRouteObserver()],
        home: LoginScreen(),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
