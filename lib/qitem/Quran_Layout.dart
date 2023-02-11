import 'package:flutter/material.dart';
import 'package:seven_minutes/AppLayer/Overseer.dart';
import 'package:seven_minutes/DateFormatScreen.dart';
import 'package:seven_minutes/login/Login.dart';
import 'package:seven_minutes/sitem/sunnah.dart';
import 'package:seven_minutes/qitem/Quran.dart';
import 'package:seven_minutes/tabbar_layout.dart';
import 'package:get/get.dart';

import '../7valuemin/SevenValueMin.dart';

class QuranLayout extends StatefulWidget {
  @override
  _QuranLayoutState createState() => _QuranLayoutState();
}

class _QuranLayoutState extends State<QuranLayout> {
  int selectIndex = 5;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Quran',
          style: TextStyle(
              color: Colors.white,
              letterSpacing: 1,
              fontSize: 20,
              fontFamily: 'Comfortaa',
              fontWeight: FontWeight.w900),
        ),
        actions: [
          InkWell(
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => TabbarLayout()));
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
      drawer: Drawer(
        child: ListView(
          children: <Widget>[
            UserAccountsDrawerHeader(
              accountName: Text(Overseer.userName),
              accountEmail: Text(Overseer.userEmail),
              currentAccountPicture: CircleAvatar(
                backgroundColor:
                    Theme.of(context).platform == TargetPlatform.iOS
                        ? Colors.blue
                        : Colors.white,
                child: Text(
                  "A",
                  style: TextStyle(fontSize: 40.0),
                ),
              ),
            ),
            ListTile(
              title: InkWell(child: Text("Dua Remember"),
              onTap: (){

              },),
              trailing: Icon(Icons.arrow_forward),
            ),
            ListTile(
              onTap: (){
                Get.to(()=> TimerScreen());
              },
              title: Text("7 Value Minutes"),
              trailing: Icon(Icons.arrow_forward),
            ),
            ListTile(
              title: InkWell(child: Text("40 Hadith"),
                onTap: (){

                },
              ),
              trailing: Icon(Icons.arrow_forward),
            ),
            ListTile(
              title: InkWell(child: Text("7Min Mode"),
              onTap: (){

              },),
              trailing: Icon(Icons.arrow_forward),
            ),
            SizedBox(
              height: context.height * .16,
            ),

            InkWell(
              onTap: () {
                Get.offAll(Login());
              },
              child: ListTile(
                title: Text("Sign Out"),
              ),
            ),
          ],
        ),
      ),
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
                itemCount: 30,
                itemBuilder: (context, index) {
                  int date = index + 1;
                  int day = DateTime.now().day;
                  return Column(
                    children: [
                      InkWell(
                        onTap: () {
                          Overseer.playtime = 0;
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Quran()));
                        },
                        child: Container(
                          color: Color.fromRGBO(15, 117, 188, 1),
                          height: day != index ? 30 : 180,
                          width: day != index ? 350 : 350,
                          child: Card(
                            color: day != index
                                ? Color.fromRGBO(15, 117, 188, 1)
                                : Colors.white,
                            semanticContainer: false,
                            clipBehavior: Clip.antiAliasWithSaveLayer,
                            child: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  day != index
                                      ? SizedBox(
                                          height: 2,
                                        )
                                      : Image.asset(
                                          'assets/images/q-index-${index}.png',
                                    height: 150,
                                    width: 250,
                                    fit: BoxFit.fill,

                                  ),
                                  day != index
                                      ? Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.end,
                                          children: [
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  right: 8.0),
                                              child: Text(
                                                "${index}",
                                                style: TextStyle(
                                                    color: Colors.white,
                                                    letterSpacing: 1,
                                                    fontSize: 15,
                                                    fontFamily: 'Comfortaa',
                                                    fontWeight:
                                                        FontWeight.w900),
                                              ),
                                            ),
                                          ],
                                        )
                                      : Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.end,
                                          children: [
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  right: 8.0),
                                              child: Text(
                                                "${index}",
                                                style: TextStyle(
                                                    color: Color.fromRGBO(
                                                        15, 117, 188, 1),
                                                    letterSpacing: 1,
                                                    fontSize: 15,
                                                    fontFamily: 'Comfortaa',
                                                    fontWeight:
                                                        FontWeight.w400),
                                              ),
                                            ),
                                          ],
                                        ),
                                ]),

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
                }),
          )
        ],
      ),
    );
  }

  Widget quranLessonContainer({required String txt, required String dateText}) {
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
