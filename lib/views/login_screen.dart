import 'package:flutter/material.dart';
import 'package:flutter_login/flutter_login.dart';
import 'package:firebase_auth/firebase_auth.dart';
//import 'dashboard_screen.dart';
import 'package:learn_with_ar/modals/app_user.dart';
import 'package:learn_with_ar/modals/avatar.dart';
import 'package:learn_with_ar/repository/app_user_repository.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginScreen extends StatelessWidget {
  final _auth = FirebaseAuth.instance;
  AppUserRepo userRepo = AppUserRepo();

  Future<String> _authUser(LoginData data) async {
    try {
      final user = (await _auth.signInWithEmailAndPassword(
              email: data.name, password: data.password))
          .user;
      SharedPreferences prefs = await SharedPreferences.getInstance();
      prefs.setString('id', user.uid);
      currentUser = await userRepo.getUser(user.uid);
      print(currentUser.email);
      print(currentUser.username);
      return null;
    } catch (e) {
      print(e.toString());
      return 'Invalid Email or Password';
    }
  }

  Future<String> _onSignUp(LoginData data) async {
    if(data.password.length <8){
      return 'Password Should be atleast 8 characters';
    }
    final user = (await _auth.createUserWithEmailAndPassword(
            email: data.name, password: data.password))
        .user;
    if (user != null) {
      print(user.email);
      String curr = "";
      for (int i = 0; i < user.email.length-3; i++) {
        if (user.email[i] == '@') {
          break;
        } else {
          curr += user.email[i];
        }
      }
      String username = "";
      if (curr.length <= 6){
        username = curr;
        print('if');
      }
      else {
        int x = curr.length;
        print('else');
        print(x);
        username = curr[0] +
            curr[1] +
            curr[2] +
            curr[x - 3] +
            curr[x - 2] +
            curr[x - 1];
      }
      print(username);
      currentUser = AppUser(id: user.uid,email: user.email,username: username,likedModels: [],createdModels: []);
      await userRepo.addAppUser(currentUser);

      SharedPreferences prefs = await SharedPreferences.getInstance();
      prefs.setString('id', user.uid);
      return null;
    } else {
      return 'Something went wrong';
    }
  }

  Future<String> _recoverPassword(String name) async {
    try {
      await _auth.sendPasswordResetEmail(email: name);
      return null;
    } catch (e) {
      return 'No account from this Email';
    }
  }

  @override
  Widget build(BuildContext context) {
    return FlutterLogin(
      title: 'Learn With AR',
      logo: 'assets/logo.png',
      passwordValidator: (String password) {
        if (password.length < 8) {
          return 'Password must be 8 characters long';
        }
        return null;
      },
      onLogin: _authUser,
      onSignup: _onSignUp,
      onSubmitAnimationCompleted: () {
        Navigator.pushNamedAndRemoveUntil(context, 'dash', (route) => false);
      },
      onRecoverPassword: _recoverPassword,
    );
  }
}
