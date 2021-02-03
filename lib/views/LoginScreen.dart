import 'package:flutter/material.dart';
import 'package:flutter_login/flutter_login.dart';
import 'package:firebase_auth/firebase_auth.dart';
//import 'DashboardScreen.dart';

class LoginScreen extends StatelessWidget {
  final _auth = FirebaseAuth.instance;

  Future<String> _authUser(LoginData data) async {
    try {
      final user = (await _auth.signInWithEmailAndPassword(
              email: data.name, password: data.password))
          .user;
      return null;
    } catch (e) {
      print(e.toString());
      return 'Invalid Email or Password';
    }
  }

  Future<String> _onSignUp(LoginData data) async {
    final user = (await _auth.createUserWithEmailAndPassword(
            email: data.name, password: data.password))
        .user;
    if (user != null) {
      print(user.email);

      return null;
    } else {
      return 'Something went wrong';
    }
  }

  Future<String> _recoverPassword(String name) {}

  @override
  Widget build(BuildContext context) {
    return FlutterLogin(
      title: 'Learn With AR',
      logo: 'assets/logo.png',
      onLogin: _authUser,
      onSignup: _onSignUp,
      onSubmitAnimationCompleted: () {
        Navigator.pushReplacementNamed(context, 'dash');
      },
      onRecoverPassword: _recoverPassword,
    );
  }
}
