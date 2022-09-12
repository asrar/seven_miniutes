import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:seven_minutes/App_Guide/Model/page_view_model.dart';
// import 'package:seven_minutes/App_Guide/Intro_Views_Flutter-2/Intro_Views_Flutter.dart';
import 'package:seven_minutes/login/Login.dart';

import 'App_Guide/Intro_Views_Flutter-2/4/0/intro_views_flutter.dart';

class Memory1 extends StatefulWidget {
  @override
  _MemoryState createState() => _MemoryState();
}

var _fontHeaderStyle = TextStyle(
    fontFamily: "Popins",
    fontSize: 21.0,
    fontWeight: FontWeight.w800,
    color: Colors.black87,
    letterSpacing: 1.5);

var _fontDescriptionStyle = TextStyle(
    fontFamily: "Sans",
    fontSize: 15.0,
    color: Colors.grey,
    fontWeight: FontWeight.w400);

///
/// Page View Model for on boarding
///
final pages = [
  new PageViewModel(
    iconImageAssetPath: "assets/images/005.jpg",
      bubble: Text("waleed"),
      textStyle: TextStyle(),
      pageColor: Colors.white,
      iconColor: Colors.black,
      bubbleBackgroundColor: Colors.black,
      title: Text(
        'Quran',
        style: _fontHeaderStyle,
      ),
      body: Container(

        height: 250.0,
        child: Text(
          'Daily Read 7 Ayaats',
            textAlign: TextAlign.left,
            style: _fontDescriptionStyle),
      ),
      mainImage: Image.asset(
        'assets/images/Quran.png',
        height: 200.0,
        width: 200.0,
        alignment: Alignment.center,
      )),
  new PageViewModel(
      iconImageAssetPath: "assets/images/005.jpg",
      bubble: Text("waleed"),
      textStyle: TextStyle(),
      pageColor: Colors.white,
      iconColor: Colors.black,
      bubbleBackgroundColor: Colors.black,
      title: Text(
        'Sunnah',
        style: _fontHeaderStyle,
      ),
      body: Container(
        height: 250.0,
        child: Text(
            'Sunnah',
            textAlign: TextAlign.left,
            style: _fontDescriptionStyle),
      ),
      mainImage: Image.asset(
        'assets/images/Sunnah.png',
        height: 200.0,
        width: 200.0,
        alignment: Alignment.center,
      )),
  new PageViewModel(
      iconImageAssetPath: "assets/images/005.jpg",
      bubble: Text("waleed"),
      textStyle: TextStyle(),
      pageColor: Colors.white,
      iconColor: Colors.black,
      bubbleBackgroundColor: Colors.black,
      title: Text(
        'Prayer',
        style: _fontHeaderStyle,
      ),
      body: Container(
        height: 250.0,
        child: Text(
          'Daily Understand 1 Hadith',
            textAlign: TextAlign.left,
            style: _fontDescriptionStyle),
      ),
      mainImage: Image.asset(
        'assets/images/Prayer.png',
        height: 200.0,
        width: 200.0,
        alignment: Alignment.center,
      )),
];

class _MemoryState extends State<Memory1> {
  @override
  Widget build(BuildContext context) {
    return IntroViewsFlutter(
      pages,
      onTapNextButton: (){},
      onTapSkipButton: (){},
      pageButtonFontFamily: "",
      pageButtonTextStyles: TextStyle(),
      showSkipButton: true,
      columnMainAxisAlignment: MainAxisAlignment.center,
      doneButtonPersist: true,
      fullTransition: 2.0,
      pageButtonTextSize: 16,
      pageButtonsColor: Colors.black45,
      skipText: Text(
        "SKIP",
        style: _fontDescriptionStyle.copyWith(
            color:Color(0xff4441e5),
            fontWeight: FontWeight.w800,
            letterSpacing: 1.0),
      ),

      doneText: Text(
        "DONE",
        style: _fontDescriptionStyle.copyWith(
            color: Color(0xff4441e5),
            fontWeight: FontWeight.w800,
            letterSpacing: 1.0),
      ),
      onTapDoneButton: () async {
        SharedPreferences prefs;
        prefs = await SharedPreferences.getInstance();
        prefs.setString("username", "Login");
        Navigator.of(context).pushReplacement(PageRouteBuilder(
          pageBuilder: (_, __, ___) => new Login(),
          transitionsBuilder:
              (_, Animation<double> animation, __, Widget widget) {
            return Opacity(
              opacity: animation.value,
              child: widget,
            );
          },
          transitionDuration: Duration(milliseconds: 1500),
        ));
      },
    );
  }
}
