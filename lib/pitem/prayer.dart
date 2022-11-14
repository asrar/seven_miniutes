import 'package:flutter/material.dart';
// import 'package:firebase_messaging/firebase_messaging.dart';
//import 'package:seven_minutes/pitem/prayerScreen.dart';

import 'Prayer_Layout.dart';

class Prayer extends StatefulWidget {
  @override
  _PrayerState createState() => _PrayerState();
}

class _PrayerState extends State<Prayer> {
  String messageTitle = "Empty";
  String notificationAlert = "alert";

  // @override
  // void initState() {
  //   // TODO: implement initState
  //   super.initState();
  //
  //   // _firebaseMessaging.configure(
  //   //   onMessage: (message) async {
  //   //     setState(() {
  //   //       messageTitle = message["notification"]["title"];
  //   //       notificationAlert = "New Notification Alert";
  //   //     });
  //   //   },
  //   //   onResume: (message) async {
  //   //     setState(() {
  //   //       messageTitle = message["data"]["title"];
  //   //       notificationAlert = "Application opened from Notification";
  //   //     });
  //   //   },
  //   // );
  // }



  @override
  Widget build(BuildContext context) {
    return
        Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text('Prayer'),
        SizedBox(height: 20),
        TextButton(

          // shape: RoundedRectangleBorder(
          //     side: BorderSide(color: Colors.green),
          //     borderRadius: new BorderRadius.circular(10.0)),
          //
          // color: Colors.transparent,
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) => PrayerLayout()));
          },
          child: Text(
            'Prayer',
            style: TextStyle(color: Colors.black),
          ),
        )
      ],
    );
  }
}
