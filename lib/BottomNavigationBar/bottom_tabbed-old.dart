import 'package:flutter/material.dart';
import 'package:seven_minutes/pitem/Prayer_Layout.dart';
import 'package:seven_minutes/sitem/Sunnah_Layout.dart';
import 'package:seven_minutes/qitem/Quran.dart';

import '../qitem/Quran_Layout.dart';


class BottomTabbedOld extends StatefulWidget {
  @override
  _BottomTabbedOldState createState() => _BottomTabbedOldState();
}

class _BottomTabbedOldState extends State<BottomTabbedOld>
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
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        backgroundColor: Colors.white,

        bottomNavigationBar: Material(
            color: Color(0xFF3E6EA4),
            ///// DONE
            child: TabBar(
                labelColor: Colors.white,
                labelStyle: TextStyle(color: Color(0xFF3E6EA4)),
                unselectedLabelColor: Colors.blue[200],
                indicatorColor: Color(0xFF3E6EA4),
                ///// DONE
                controller: controller,
                ///// DONE
                tabs: <Tab>[
                  Tab(

                    icon: ImageIcon(
                        AssetImage('assets/images/quran-icon.png')
                    ),//new Icon(Icons.bookmark),


                  ),
                  Tab(
                    icon: ImageIcon(
                        AssetImage('assets/images/sunnah-icon.png')
                    ),
                  ),
                  Tab(
                    icon: ImageIcon(
                        AssetImage('assets/images/namaz-icon.png')
                    ),
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
