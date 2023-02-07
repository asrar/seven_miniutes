import 'package:flutter/material.dart';
import 'package:seven_minutes/AppLayer/Overseer.dart';
import 'package:seven_minutes/DateFormatScreen.dart';
import 'package:seven_minutes/bottom_tabbed.dart';
import 'package:seven_minutes/pitem/homeprayer.dart';
//import 'package:seven_minutes/pitem/prayerScreen.dart';
import 'package:seven_minutes/sitem/sunnah.dart';
import 'package:seven_minutes/sitem/sunnah_screen.dart';
import 'package:seven_minutes/tabbar_layout.dart';
import 'package:get/get.dart';

import '../BottomNavigationBar/bottom_tabbed-old.dart';


class PrayerLayout extends StatefulWidget {
  @override
  _PrayerLayoutState createState() => _PrayerLayoutState();
}

class _PrayerLayoutState extends State<PrayerLayout> {
  int selectIndex = 10;
  List<String> listIndex = List<String>.empty();




  @override
  Widget build(BuildContext context) {
    for(int ind=1; ind<=30;ind++){

    }
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Container(
              height: 100,
              padding: EdgeInsets.only(left: 15, top: 45, right: 15),
              color: Color(0xFF3E6EA4),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      InkWell(
                        onTap: () {
                          Get.offAll(BottomTabbed());
                          // Navigator.pop(
                          //     context,
                          //     MaterialPageRoute(
                          //         builder: (context) => Sunnah()));
                        },
                        child: Container(
                          child:
                          Icon(Icons.person_rounded, color: Colors.white),
                        ),
                      ),

                    ],
                  ),
                  Column(
                    children: [
                      Text(
                        'Prayer',
                        style: TextStyle(
                            color: Colors.white,
                            letterSpacing: 1,
                            fontSize: 20,
                            fontFamily: 'Comfortaa',
                            fontWeight: FontWeight.w900),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      // Container(
                      //   child: Text(
                      //     '01 June 2021',
                      //     style: TextStyle(
                      //         fontFamily: 'Comfortaa', color: Colors.white),
                      //   ),
                      // ),
                      DateFormatScreen()
                    ],
                  ),
                  Column(
                    children: [
                      InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => TabbarLayout()));
                        },
                        child: Container(
                          child: Icon(
                            Icons.notification_important,
                            color: Colors.white,
                            size: 30,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              )),
          Expanded(
            child: ListView.builder(
                itemCount: 30,
                itemBuilder: (context, ind) {
                  int index = ind + 1;


                  int day = DateTime.now().day;

                  //   if (index == selectIndex) {
                  return Column(
                    children: [
                      InkWell(
                        onTap: () {
                          Overseer.playtime = 0;
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => HomePrayer()));
                        },
                        child: Container(
                          color: Color.fromRGBO(15, 117, 188, 1) ,
                          height: day != index ? 30 : 160,
                          width: day != index ? 350 :350,
                          child: Card(
                            color: day != index ?Color.fromRGBO(15, 117, 188, 1) : Colors.white,
                            semanticContainer: false,
                            clipBehavior: Clip.antiAliasWithSaveLayer,
                            child:Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  day != index ? SizedBox(height: 2,) :
                                  Image.asset(
                                      'assets/images/n-indix-${index}.png'),
                                  day != index ? Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.only(right: 8.0),
                                        child: Text("${index}"
                                          ,style: TextStyle(
                                              color: Colors.white,
                                              letterSpacing: 1,
                                              fontSize: 15,
                                              fontFamily: 'Comfortaa',
                                              fontWeight: FontWeight.w900),
                                        ),
                                      ),
                                    ],)
                                      :
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.only(right: 8.0),
                                        child: Text("${index}"
                                          ,style: TextStyle(
                                              color: Color.fromRGBO(15, 117, 188, 1),
                                              letterSpacing: 1,
                                              fontSize: 15,
                                              fontFamily: 'Comfortaa',
                                              fontWeight: FontWeight.w400),
                                        ),
                                      ),
                                    ],),

                                ]
                            ) ,



                            // shape: RoundedRectangleBorder(
                            //   borderRadius: BorderRadius.circular(2.0),
                            // ),
                            elevation: 2,
                            // margin: EdgeInsets.all(2),
                          ),
                        ),
                      ),
                      Divider()
                      ],
                    );
                  // cell with date  } else {
                  //   return Padding(
                  //       padding: EdgeInsets.only(left: 10, top: 10, right: 10),
                  //       child: sunnahLessonContainer(
                  //           txt: 'Prayer', dateText: '$date  June  2021'));
                  // }
                }),
          )
        ],
      ),
    );
  }

  Widget sunnahLessonContainer({required String txt, required String dateText}) {
    return Column(
      children: [
        Container(
          padding: EdgeInsets.symmetric(vertical: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                txt,
                style: TextStyle(
                    fontSize: 20,
                    fontFamily: 'Comfortaa',
                    fontWeight: FontWeight.w900),
              ),
              Text(
                dateText,
                style: TextStyle(
                    color: Colors.grey,
                    fontFamily: 'Comfortaa',
                    fontWeight: FontWeight.w900),
              ),
            ],
          ),
        ),
        Divider()
      ],
    );
  }
}
