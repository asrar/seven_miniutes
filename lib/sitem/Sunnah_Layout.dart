import 'package:flutter/material.dart';
import 'package:seven_minutes/AppLayer/Overseer.dart';
import 'package:seven_minutes/DateFormatScreen.dart';
import 'package:seven_minutes/sitem/sunnah.dart';
import 'package:seven_minutes/sitem/sunnah_screen.dart';
import 'package:seven_minutes/tabbar_layout.dart';

class SunnahLayout extends StatefulWidget {
  @override
  _SunnahLayoutState createState() => _SunnahLayoutState();
}

class _SunnahLayoutState extends State<SunnahLayout> {
  int selectIndex = 19;


  @override
  Widget build(BuildContext context) {

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
                        // onTap: () {
                        //   Navigator.pop(
                        //       context,
                        //       MaterialPageRoute(
                        //           builder: (context) => Sunnah()));
                        // },
                        child: Container(
                          child:
                          Icon(Icons.person_outline, color: Colors.white),
                        ),
                      )
                    ],
                  ),
                  Column(
                    children: [
                      Text(
                        'Sunnah',
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
                itemBuilder: (context, index) {
                  int date =index+1;
                  if (index == selectIndex) {
                    return Column(
                      children: [
                        InkWell(
                          onTap: () {
                            Overseer.playtime = 0;
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => SunnahHomeScreen()));
                          },
                          child: Container(
                            color: Colors.blue.shade200,
                            height: 200,
                            width: 350,


                            child: Card(

                              semanticContainer: false,
                              clipBehavior: Clip.antiAliasWithSaveLayer,
                              child: Image.asset('assets/images/today.jpeg'),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              elevation: 5,
                              margin: EdgeInsets.all(10),
                            ),
                          ),
                        ),
                        Divider()
                      ],
                    );
                  } else {
                    return Padding(
                        padding: EdgeInsets.only(left: 10, top: 10, right: 10),
                        child: sunnahLessonContainer(
                            txt: 'Prayer', dateText: '$date  June  2021'));
                  }
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
