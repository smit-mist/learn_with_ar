import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:mun/logic/auth.dart';
import 'package:mun/views/home/select_city_screen.dart';
import 'package:mun/logic/database.dart';
import 'package:mun/models/user.dart';
import 'package:mun/views/elements/constants.dart';
import 'package:mun/views/elements/textstyles.dart';
import 'package:mun/views/elements/widgets.dart';
import 'package:mun/views/elements/widgets/loading.dart';

class SignUpScreen extends StatefulWidget {
  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  Database _database = Database();
  GlobalKey<FormState> _key = GlobalKey<FormState>();
  bool isLoading = false, isVisible = false, isAccepted = false;
  AuthService _auth = AuthService();
  String name, email, password1, password2;

  @override
  Widget build(BuildContext context) {
    final currUser = Provider.of<MUNUser>(context);
    void signMeUp() async {
      if (_key.currentState.validate()) {
        setState(() {
          isLoading = true;
        });
        final User user = await _auth.signUp(email, password1);
        if (user != null) {
          await _database.addUser(email, name, currUser.uid);
          // currUser.name = name;
          print('===========');
          Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(builder: (context) => SelectCityScreen()),
              (route) => false);
        } else {
          setState(() {
            isLoading = false;
          });
        }
      }
    }

    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;
    return isLoading
        ? Loading()
        : Scaffold(
            body: Center(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Center(
                      child: Text(
                        'BookMyMun',
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Helvetica',
                          fontSize: 35,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: h * 0.05,
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: w * 0.075),
                      child: Text(
                        'Create account',
                        style: simple(28),
                      ),
                    ),
                    SizedBox(
                      height: h * 0.02,
                    ),
                    Center(
                      child: SingleChildScrollView(
                        child: Container(
                          width: w * 0.85,
                          height: h * 0.4,
                          child: Center(
                            child: Form(
                              key: _key,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Container(
                                    child: TextFormField(
                                      validator: (value) {
                                        return value.isEmpty
                                            ? 'Enter a proper username'
                                            : null;
                                      },
                                      onChanged: (change) {
                                        setState(() {
                                          name = change;
                                        });
                                      },
                                      decoration: textFieldDecoration('Name'),
                                      cursorColor: Colors.black,
                                    ),
                                  ),
                                  Container(
                                    child: TextFormField(
                                      validator: (value) {
                                        return (value.isEmpty ||
                                                !RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                                                    .hasMatch(value))
                                            ? 'Enter a valid email'
                                            : null;
                                      },
                                      cursorColor: Colors.black,
                                      onChanged: (change) {
                                        setState(() {
                                          email = change;
                                        });
                                      },
                                      decoration: textFieldDecoration(
                                          'Your email address'),
                                    ),
                                  ),
                                  Container(
                                    //height: 70,
                                    child: TextFormField(
                                      validator: (value) {
                                        return (value.isEmpty ||
                                                value.length < 8)
                                            ? 'Minimum length of password is 8'
                                            : null;
                                      },
                                      cursorColor: Colors.black,
                                      onChanged: (change) {
                                        setState(() {
                                          password1 = change;
                                        });
                                      },
                                      obscureText: isVisible ? false : true,
                                      decoration: textFieldDecoration(
                                          'Create Password'),
                                    ),
                                  ),
                                  Container(
                                    child: TextFormField(
                                      cursorColor: Colors.black,
                                      onChanged: (change) {
                                        setState(() {
                                          password2 = change;
                                        });
                                      },
                                      obscureText: isVisible ? false : true,
                                      decoration: textFieldDecoration(
                                          'Confirm Password'),
                                      validator: (value) {
                                        return (password2 != password1)
                                            ? 'Passwords don\'t match'
                                            : null;
                                      },
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    // SizedBox(
                    //   height: h * 0.01,
                    // ),
                    Padding(
                      padding: EdgeInsets.only(
                        left: (w * 0.075 - 12) < 0 ? 0 : (w * 0.075 - 12),
                      ),
                      child: Row(
                        children: [
                          Checkbox(
                            value: isVisible,
                            activeColor: Colors.blue,
                            onChanged: (bool newValue) {
                              setState(() {
                                isVisible = newValue;
                              });
                            },
                          ),
                          Text(
                            'Show Password',
                            style: simple(14),
                          ),
                        ],
                      ),
                    ),
                    Center(
                      child: NormalButton(
                        function: signMeUp,
                        width: w * 0.85,
                        height: h * 0.055,
                        text: 'Sign Up',
                      ),
                    ),
                    SizedBox(
                      height: h * 0.01,
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                        left: (w * 0.075 - 12) < 0 ? 0 : (w * 0.075 - 12),
                      ),
                      child: FormField(
                        validator: (value) {
                          return (!isAccepted)
                              ? 'Please accept the terms and conditions'
                              : null;
                        },
                        builder: (state) {
                          return Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Checkbox(
                                value: isAccepted,
                                activeColor: kBlueShade,
                                onChanged: (bool newValue) {
                                  setState(() {
                                    isAccepted = newValue;
                                  });
                                },
                              ),
                              Container(
                                width: w * 0.8,
                                child: Wrap(
                                  children: [
                                    Text(
                                      "By creating account or logging in, you agree to BookMyMUN's ",
                                      style: simple(12),
                                    ),
                                    GestureDetector(
                                      onTap: () {},
                                      child: Text(
                                        'Conditions of Use ',
                                        style: simple(12).copyWith(
                                          color: kBlueShade,
                                        ),
                                      ),
                                    ),
                                    Text(
                                      'and',
                                      style: simple(12),
                                    ),
                                    GestureDetector(
                                      onTap: () {},
                                      child: Text(
                                        ' Privacy Policy',
                                        style: simple(12).copyWith(
                                          color: kBlueShade,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          );
                        },
                      ),
                    ),
                    SizedBox(
                      height: h * 0.05,
                    ),
                    Center(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Already have an account?",
                            style: TextStyle(
                              fontFamily: 'Helvetica',
                              fontSize: 18,
                            ),
                          ),
                          GestureDetector(
                            child: Text(
                              ' Log In',
                              style: TextStyle(
                                fontFamily: 'Helvetica',
                                fontSize: 18,
                                color: kBlueShade,
                              ),
                            ),
                            onTap: () {
                              Navigator.of(context)
                                  .pushReplacementNamed('login');
                            },
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          );
  }
}
// Container(
// width: w,
// height: h * 0.3,
// child: Column(
// mainAxisAlignment: MainAxisAlignment.spaceBetween,
// children: [
//
//
// ],
// ),
// ),
