import 'package:flutter/material.dart';
import 'package:seven_minutes/AppLayer/Overseer.dart';
import 'package:seven_minutes/DateFormatScreen.dart';
import 'package:seven_minutes/sitem/sunnah.dart';
import 'package:seven_minutes/sitem/sunnah_screen.dart';
import 'package:seven_minutes/tabbar_layout.dart';

class DuaLayout extends StatefulWidget {
  @override
  _DuaLayoutState createState() => _DuaLayoutState();
}



class _DuaLayoutState extends State<DuaLayout> {


  void initState() {
    super.initState();

    // take to 7Min App
  }

  int selectIndex = 19;
  bool light = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
        floatingActionButtonLocation:FloatingActionButtonLocation.startFloat,
      floatingActionButton:InkWell(
        splashColor: Colors.blue,
        onLongPress: () {

          setState((){
            light = true;
          });



          print("ON LONG PRESS CALLED");
          // handle your long press functionality here
        },

        child: FloatingActionButton(
          autofocus: true,
          hoverColor: Colors.orange,
          focusColor: Colors.red,

          onPressed: (){
            setState((){
              light = false;
            });
      print("on press");
          },
          backgroundColor: Colors.red,
        ),
      ),
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
                                  builder: (context) => SunnahHomeScreen()));
                        },
                        child: Container(
                          color: Color.fromRGBO(15, 117, 188, 1) ,
                          height: light ? 190 : day != index ? 30 : 190,
                          width: light ? 350 :day != index ? 350 :350,
                          child: Card(
                            color: light ? Colors.white : day != index ?Color.fromRGBO(15, 117, 188, 1) : Colors.white,
                            semanticContainer: false,
                            clipBehavior: Clip.antiAliasWithSaveLayer,
                            child:Column(
                                mainAxisSize: MainAxisSize.min,
                           children: [
                            light ? Image.asset(
                                'assets/images/indix-${index}.png') : day != index ? SizedBox(height: 2,) :
                             Image.asset(
                                 'assets/images/indix-${index}.png'),
                             light ?  Row(
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
                               ],) :  day != index ? Row(
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
                                         fontWeight: FontWeight.w400),
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



                             shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(4.0),
                            ),
                             elevation: 2,
                             margin: EdgeInsets.all(2),
                          ),
                        ),
                      ),
                      Divider()
                    ],
                  );
                }),
          )
        ],
      ),
    );
  }

  Widget sunnahLessonContainer(
      {required String txt, required String dateText}) {
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
