import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:seven_minutes/login/Login.dart';
import 'package:seven_minutes/AppLayer/Provider.dart';
import 'package:seven_minutes/AppLayer/Overseer.dart';
import 'package:seven_minutes/SettingScreen/settings.dart';
import 'package:seven_minutes/SplashScreen/splach_screen.dart';
import 'package:firebase_messaging/firebase_messaging.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  String messageTitle = "Empty";
  String notificationAlert = "alert";

 // FirebaseMessaging _firebaseMessaging = FirebaseMessaging.instance;

  @override
  Widget build(BuildContext context) {
    return Provider(
      data: Overseer(),
      child: GetMaterialApp(
        title: '7 minutes',theme: ThemeData(
        primarySwatch: Colors.green,
      ),
   home: SplashScreen(),
        debugShowCheckedModeBanner: false,
        routes: {
          'splash_screen': (_) => SplashScreen(),
        //  'search': (_) => SunnahLayOut(),
          'setting': (_) => Settings(),
          'login': (_) => Login(),
        },
      ),
    );
  }
  //ok
}
