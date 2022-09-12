import 'package:flutter/material.dart';
import 'package:seven_minutes/pitem/Prayer_Layout.dart';
import 'package:seven_minutes/qitem/Quran_Layout.dart';
import 'package:seven_minutes/sitem/Sunnah_Layout.dart';
import 'package:seven_minutes/assets/TabbarIcons.dart';
//import 'package:seven_minutes/pitem/prayerScreen.dart';
import 'package:seven_minutes/remind.dart';
import 'package:seven_minutes/sitem/sunnah.dart';
import 'package:seven_minutes/settings.dart';
import 'package:seven_minutes/sitem/sunnah_screen.dart';
import 'package:seven_minutes/tabbar_layout.dart';
//import 'package:flutter_svg/flutter_svg.dart';

import 'package:seven_minutes/qitem/Quran.dart';
import 'pitem/prayer.dart';

class BottomTabbed extends StatefulWidget {
  @override
  _BottomTabbedState createState() => _BottomTabbedState();
}

class _BottomTabbedState extends State<BottomTabbed>
    with SingleTickerProviderStateMixin {
  late TabController controller;
  int selectedItemIndex = 0;

  @override
  void initState() {
    super.initState();
    ///// DONE
    controller = new TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    print(" now tab bar index is ${controller.index}");
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        backgroundColor: Colors.white,

        bottomNavigationBar: Material(
            color: Color.fromARGB(255, 27, 170, 88)  ,

            ///// DONE
            child: TabBar(

                labelColor: Colors.white,
                labelStyle: TextStyle(color: Color(0xFF3E6EA4)),
                unselectedLabelColor: Colors.yellow,


                indicator: UnderlineTabIndicator(

                    borderSide: BorderSide(width: 5.0 ,
                      color: Colors.white  ,
                    ),
                  //  insets: EdgeInsets.symmetric(horizontal:16.0)
                ),
                //indicatorSize: TabBarIndicatorSis,
                ///// DONE
                controller: controller,
                ///// DONE
                tabs: <Tab>[
             Tab(
               height: 70,

            icon: Padding(
              padding: const EdgeInsets.only(bottom:3.0),
              child: Container(
                  height: 70,
                  decoration:
                  BoxDecoration(

                      image: DecorationImage(
                          image:  AssetImage('assets/images/quran-icon.png')))),
            )

               ,//new Icon(Icons.bookmark),


      ),
        Tab(

          height: 70,
          icon:  Padding(
            padding: const EdgeInsets.only(bottom:3.0),
            child: Container(
                height: 70,
                decoration:
                BoxDecoration(
                    image: DecorationImage(
                        image:  AssetImage('assets/images/sunnah-icon.png')))),
          )
        ),
        Tab(
            height: 70,
          icon:  Padding(
            padding: const EdgeInsets.only(bottom:3.0),
            child: Container(
                height: 70,
                decoration:
                BoxDecoration(
                    image: DecorationImage(
                        image:  AssetImage('assets/images/namaz-icon.png')))),
          )
        ),
                ])),
        ///// DONE
        body: TabBarView(
          controller: controller,
          children: <Widget>[
            QuranLayout(),
            SunnahLayout(),
            PrayerLayout(),
          ],
        ),
        ///// DONE
      ),
    );
  }
}
