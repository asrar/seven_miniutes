import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:seven_minutes/AppLayer/Overseer.dart';
import 'package:seven_minutes/login/Login.dart';

import 'package:seven_minutes/oneDayOneRaku/admin_project_screen.dart';
import 'package:seven_minutes/oneDayOneRaku/logsview.dart';
import 'package:seven_minutes/oneDayOneRaku/tools_stock.dart';
import 'package:seven_minutes/oneDayOneRaku/material_stock.dart';
import 'package:seven_minutes/qitem/Quran.dart';
import 'package:seven_minutes/qitem/QuranRaku.dart';
//import 'package:flutter/tool';


class AdminHomeScreen extends StatefulWidget {
  const AdminHomeScreen({Key? key}) : super(key: key);

  @override
  _AdminHomeScreenState createState() => _AdminHomeScreenState();
}

class _AdminHomeScreenState extends State<AdminHomeScreen> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: SafeArea(
        child: Scaffold(
          appBar: AppBar(
            elevation: 0,
            centerTitle: true,
            backgroundColor: Colors.black,
            iconTheme: IconThemeData(color: Colors.white),
            leading: Column(
              children: [

               Padding(padding: EdgeInsets.only(top: 10),
               child: Text(
                     "User",
                     style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold ,color: Colors.deepOrange),
                   )) ,
              ],
            ),
            actions: [
              IconButton(
                onPressed: () {
                  Get.to(() => Login());

                },
                icon: const Icon(Icons.exit_to_app_outlined,color: Colors.deepOrange,),
              ),
            ],
            title: const Text("Seven Minutes" ,style: TextStyle(fontSize: 18,
                fontWeight: FontWeight.bold ,color: Colors.deepOrange),),
            // bottom: PreferredSize(
            //     child: Text("Select Project",
            //         style: TextStyle(color: Colors.yellow)),
            //     preferredSize: Size.zero),
          ),



          body: Container(
            height: Get.height * .90 ,
            color: Colors.white,

            child: Column(
              children: [

                Container(

                  padding: EdgeInsets.only(top: 15),
                  decoration: BoxDecoration(color: Colors.black),
                  height: Get.height * 0.15,
                  width: double.infinity,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                        height: Get.height * 0.050,
                        width: Get.width * 0.45,
                        decoration: BoxDecoration(
                            color: Colors.green,
                            borderRadius: BorderRadius.circular(15)),
                        child: Center(
                          child: TextButton(
                            onPressed: () {
                              Get.to(AdminProjectScreen());
                            },
                            child: Text(
                              "Today's Raku",
                              style: TextStyle(color: Colors.black),
                            ),
                          ),
                        ),
                      ),
                    SizedBox(height: 5,),
                      Container(
                        padding: EdgeInsets.all(5),
                        child: LinearProgressIndicator(

                          backgroundColor: Colors.white,
                          value: 0.33,
                          valueColor: AlwaysStoppedAnimation(Colors.green)),)
                      ,
                      Text("Project Progress",
                        style: TextStyle(color: Colors.yellow),

                      ),
                      
                      
                    ],
                  ),
                ),
                const TabBar(

                  tabs: [
                    Tab(
                      child: Text(
                        "Topic",
                        style: TextStyle(color: Colors.black),
                      ),
                    ),
                    Tab(
                      child:
                      Text("TODO", style: TextStyle(color: Colors.black)),
                    ),
                    Tab(
                      child:
                          Text("SELF", style: TextStyle(color: Colors.black)),
                    ),
                  ],
                  // isScrollable: true,
                  indicatorColor: Colors.deepOrange,
                  indicatorWeight: 5,
                ),
                Container(
                  // color: Colors.green,
                  height: Get.height * 0.58,
                  color: Colors.white,

                  child: TabBarView(children: [
                    // 1st Tabbar View
                    QuranRaku()
                    ,
                    // 2nd tabbar view view
                    QuranRaku(),

                    //3rd Tabbar View
                    QuranRaku(),
                  ]),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget tabContainer({required String title, required Function() ontap}) {
    return GestureDetector(
        onTap: ontap,
        child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Card(
              elevation: 5,
              child: Container(
                decoration: BoxDecoration(
                  color: Color(0xffeb5f30),
                  
                  // boxShadow: [
                  //   BoxShadow(
                  //     color: Colors.black.withOpacity(0.5),
                  //     spreadRadius: 2,
                  //     blurRadius: 3,
                  //     offset: Offset(3, 3), // changes position of shadow
                  //   ),
                  // ],
                ),
                height: 50,
                width: double.infinity,
                child: Center(
                    child: Text(
                  title,
                  textAlign: TextAlign.start,
                  style: TextStyle(
                      color: Colors.white,
                      fontFamily: 'poppins',
                      fontWeight: FontWeight.bold,
                      fontSize: 20),
                )),
              ),
            )));
  }

  Widget projectContainer(
      {required String titleTxt, required String sbTitleTxt}) {
    return ListTile(
      title: Text(titleTxt,
          style: TextStyle(
              fontFamily: 'Poppins',
              fontWeight: FontWeight.w900,
              letterSpacing: 1)),
      subtitle: Text(
        sbTitleTxt,
        style: TextStyle(fontFamily: 'Poppins'),
      ),
    );
  }
}
