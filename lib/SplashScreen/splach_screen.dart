import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:seven_minutes/AppLayer/Overseer.dart';
import 'package:seven_minutes/BottomNavigationBar/bottom_tabbed-old.dart';
import 'package:seven_minutes/Memory.dart';
import 'package:seven_minutes/login/Login.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../bottom_tabbed.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(Duration(milliseconds: 4500), () async {
      SharedPreferences prefs;
      prefs = await SharedPreferences.getInstance();
      if (prefs.getInt('User_Id') != null) {
        print("user saved id is >> ${prefs.getInt('User_Id')}");

        Overseer.userId = prefs.getInt('User_Id')!;
        //   Get.to(Login());
        Get.to(Login());
     //   Get.to(BottomTabbed());
      } else {
        Get.to(Login());
      }
    });
  }

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
