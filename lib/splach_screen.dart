import 'dart:async';

import 'package:flutter/material.dart';
import 'package:seven_minutes/Memory.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:seven_minutes/login/Login.dart';
import 'register/Register.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  bool _checkUser = true;

  late SharedPreferences prefs;

  Future<Null> _function() async {
    SharedPreferences prefs;
    prefs = await SharedPreferences.getInstance();
    this.setState(() {
      if (prefs.getString("username") != null) {
        print('false');
        _checkUser = false;
      } else {
        print('true');
        _checkUser = true;
      }
    });
  }
  startTime() async {
    return new Timer(Duration(milliseconds: 4500), NavigatorPage);
  }

  void NavigatorPage() {

    // improving splash screen
    // added time in splash screen
    if (_checkUser) {
      /// if userhas never been login
      Navigator.of(context).pushReplacement(
          PageRouteBuilder(pageBuilder: (_, __, ___) => Login()));
    } else {
      /// if userhas ever been login
      Navigator.of(context).pushReplacement(
          PageRouteBuilder(pageBuilder: (_, __, ___) => Register()));
    }
  }

  void initState() {
    super.initState();
    startTime();
    _function();
  }
  // @override
  // void initState() {
  //   super.initState();
  //   Future.delayed(Duration(seconds: 2), () {
  //     Navigator.push(
  //         context,
  //         MaterialPageRoute(
  //           builder: (context) => Login(),
  //         ));
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Image.asset(
        'assets/images/splash.png',
        fit: BoxFit.fitHeight,
      ),
    );
  }
}
