import 'package:flutter/material.dart';
import 'package:seven_minutes/sitem/Sunnah_Layout.dart';
import 'package:seven_minutes/qitem/Quran.dart';
import 'package:seven_minutes/sitem/sunnah_screen.dart';

class Sunnah extends StatefulWidget {
  @override
  _SunnahState createState() => _SunnahState();
}

class _SunnahState extends State<Sunnah> {
  @override
  Widget build(BuildContext context) {
    return
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('7 Minutes'),
            SizedBox(
              height: 20
            ),

            FlatButton(
              shape: RoundedRectangleBorder(
                  side: BorderSide(color: Colors.green),
                  borderRadius: new BorderRadius.circular(10.0)),
              color: Colors.transparent,
                onPressed: (){
                Navigator.push(context, MaterialPageRoute(builder: (context) => SunnahLayout()));
                }, child: Text(
              '7 Minutes',
              style: TextStyle(color: Colors.black),
            ),)
          ],
        );
  }
}
