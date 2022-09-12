import 'package:flutter/material.dart';
import 'package:seven_minutes/AppLayer/Overseer.dart';
import 'package:seven_minutes/DateFormatScreen.dart';
import 'package:seven_minutes/login/Login.dart';
import 'package:seven_minutes/sitem/sunnah.dart';
import 'package:seven_minutes/qitem/Quran.dart';
import 'package:seven_minutes/tabbar_layout.dart';
import 'package:get/get.dart';

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
        title:    Text(
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
      ],),
      drawer: Drawer(
        child: ListView(
          children: <Widget>[

            UserAccountsDrawerHeader(
              accountName: Text("Asrar"),
              accountEmail: Text("aks@7minutes.com"),
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
              title: Text("Ttem 1"),
              trailing: Icon(Icons.arrow_forward),
            ),
            ListTile(
              title: Text("Item 2"),
              trailing: Icon(Icons.arrow_forward),
            ),
            SizedBox(height: context.height *.42,),
            InkWell(
              onTap: (){
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
                  if (index == selectIndex) {
                    return Column(
                      children: [
                        InkWell(
                          onTap: () {
                            Overseer.playtime = 0;
                            Overseer.isLoadingDone = true;

                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Quran()));
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
                        child: quranLessonContainer(
                            txt: 'Quran', dateText: '$date  June  2021'));
                  }
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
