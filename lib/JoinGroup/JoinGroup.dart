import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:seven_minutes/AppLayer/Overseer.dart';
import 'package:seven_minutes/AppLayer/Provider.dart';
import 'package:seven_minutes/JoinGroup/JoinGroupManager.dart';
import 'package:seven_minutes/bottom_tabbed.dart';
import 'package:seven_minutes/login/UserManager.dart';
import 'package:seven_minutes/register/Register.dart';
import 'package:seven_minutes/Widgets/CustomButton.dart';
import 'package:seven_minutes/Widgets/TextFieldWidget.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../oneDayOneRaku/admin_home_screen.dart';

class JoinGroup extends StatefulWidget {
  @override
  _joinGroupState createState() => _joinGroupState();
}

class _joinGroupState extends State<JoinGroup> {
  var formKey = GlobalKey<FormState>();
  bool isGroupPerson = false;
  bool isGroupLeader = false;
  bool leaderCheck = false;


  @override
  Widget build(BuildContext context) {
    JoinGroupManager manager = Provider.of(context).fetch(JoinGroupManager);

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Color(0xFF3E6EA4),
          title: Text("Join Group"),

          centerTitle: true,
          leading: IconButton(
            icon: Icon(Icons.arrow_back, color: Colors.white),
            onPressed: () => Navigator.of(context).pop(),
          ),

        ),
        body:
          Form(
            child: ListView(
              children: [
                SizedBox(
                  height: 30,
                ),
                // Container(
                //    width: 200,
                //    height: 260,
                //   margin: EdgeInsets.only(top: 20),
                //   child:  Image(
                //     height: 240,
                //     width: 200,
                //     fit: BoxFit.cover,
                //     image: AssetImage("assets/img/cattle-login.png"),
                //   ),
                // ),
                // SizedBox(
                //   height: 30,
                // ),
                Container(
                    width: 30,
                    height: 40,
                    child: Text(
                      'Enter Group ID to Join',

                      maxLines: 3,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontFamily: 'Comfortaa',
                        // fontWeight: FontWeight.w900,
                        fontSize: 17.0,
                        letterSpacing: 0.4,
                        color: Color(0xff95b319),
                      ),
                    )),
                SizedBox(
                  height: 1,
                ),

                SizedBox(
                  height: 3,
                ),
                // group name
                StreamBuilder<String>(
                  stream: manager.groupId$,
                  builder: (context, snapshot) {
                    return ListTile(
                      contentPadding:
                      EdgeInsets.symmetric(horizontal: 5, vertical: 1),
                      title: TextField(
                        onChanged: (value) {
                          manager.inGroupId.add(value);
                        },
                        textInputAction: TextInputAction.next,
                        obscureText: false,
                        style: TextStyle(color: Colors.green),
                        cursorColor: Colors.green,
                        keyboardType: TextInputType.emailAddress,
                        decoration: InputDecoration(
                          labelText: 'Group Unique ID',
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(width: 3, color: Colors.blue),
                            borderRadius: BorderRadius.circular(15),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(width: 40, color: Colors.red),
                            borderRadius: BorderRadius.circular(15),
                          ),errorText: snapshot.error == null
                            ? ""
                            : snapshot.error.toString(),)
                        ,
                      ),
                      // decoration: InputDecoration(
                      //   labelText: 'Password ',
                      //   hintStyle: TextStyle(color: Colors.brown),
                      //   contentPadding:
                      //       EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                      //   errorText: snapshot.error == null
                      //       ? ""
                      //       : snapshot.error.toString(), //snapshot.error
                      // ),
                    );
                    //);
                  },
                ), SizedBox(height: 1,),// confirm password
                // gender
                StreamBuilder<Object>(
                    stream: manager.isFormValid$,
                    builder: (context, snapshot) {
                      return InkWell(
                        onTap: () {
                          Get.snackbar(
                            "Submitting",
                            "Verifying User Details",
                            dismissDirection:
                            DismissDirection.horizontal,
                            isDismissible: true,
                            backgroundColor:
                            Colors.orangeAccent,
                            duration: Duration(seconds: 1),
                          );
                          if (snapshot.hasData) {
                            manager.isFormSubmit$
                                .listen((event) async {
                              if (Overseer
                                  .is_GroupLeader_Registered) {
                                SharedPreferences prefs;
                                prefs =
                                await SharedPreferences
                                    .getInstance();
                                // prefs.setInt("User_Id", Overseer.logged_in_user_id!);
                                // Overseer.logged_in_user_id = prefs.getInt("User_Id");
                                Get.snackbar(
                                  "Congratulation",
                                  "Successfully LogIn with fitness app",
                                  dismissDirection:
                                  DismissDirection
                                      .horizontal,
                                  isDismissible: true,
                                  backgroundColor:
                                  Colors.orangeAccent,
                                  duration:
                                  Duration(seconds: 1),
                                );
                                // final SharedPreferences _sharedPreferences = await SharedPreferences.getInstance();
                                // _sharedPreferences.setInt('userId', Overseer.userId);
                           //     Get.offAll(Login());
                              } else if (snapshot
                                  .hasError) {
                                Get.snackbar(
                                  "Error",
                                  "Get some Error.2.",
                                  dismissDirection:
                                  DismissDirection
                                      .horizontal,
                                  isDismissible: true,
                                  backgroundColor:
                                  Colors.orangeAccent,
                                  duration:
                                  Duration(seconds: 2),
                                );
                              }
                            });
                          } else {
                            Get.snackbar(
                              "Error",
                              "Get some Error.1.",
                              dismissDirection:
                              DismissDirection
                                  .horizontal,
                              isDismissible: true,
                              backgroundColor:
                              Colors.orangeAccent,
                              duration:
                              Duration(seconds: 2),
                            );
                          }
                          print("3- some error");
                          // Get.to(BottomTabbed());
                        },
                        child: CustomButton(
                          buttonName: 'Join Request',
                        ),
                      );
                    }), // submit button
                SizedBox(
                  height: 20,
                ),

                      ],
                    ),
                  )


    ));
  }
}
