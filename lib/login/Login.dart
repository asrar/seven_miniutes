import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:seven_minutes/AppLayer/Overseer.dart';
import 'package:seven_minutes/AppLayer/Provider.dart';
import 'package:seven_minutes/bottom_tabbed.dart';
import 'package:seven_minutes/login/UserManager.dart';
import 'package:seven_minutes/register/Register.dart';
import 'package:seven_minutes/Widgets/CustomButton.dart';
import 'package:seven_minutes/Widgets/TextFieldWidget.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../oneDayOneRaku/admin_home_screen.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  var formKey = GlobalKey<FormState>();
  bool isGroupPerson = false;
  bool isGroupLeader = false;
  bool leaderCheck = false;


  @override
  Widget build(BuildContext context) {
    UserManager manager = Provider.of(context).fetch(UserManager);

    return SafeArea(
      child: Scaffold(
        // appBar: AppBar(
        //   elevation: 0,
        //   automaticallyImplyLeading: false,
        //   backgroundColor: Colors.transparent,
        // ),
        body:
          Form(
            child: ListView(
              children: [
                SizedBox(
                  height: 60,
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
                      'Please Login to 7 Min world',

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

                StreamBuilder<String>(
                  stream: manager.email$,
                  builder: (context, snapshot) {
                    return ListTile(
                      contentPadding:
                      EdgeInsets.symmetric(horizontal: 40, vertical: 5),
                      title: TextField(
                        onChanged: (value) {
                          print("form value is $value");
                          manager.inEmail.add(value);
                        },
                        textInputAction: TextInputAction.next,
                        style: TextStyle(color: Colors.black),
                        cursorColor: Colors.black,
                        keyboardType: TextInputType.emailAddress,
                        decoration: InputDecoration(
                          labelText: 'Enter User ID',
                          hintStyle: TextStyle(color: Colors.yellow),
                          contentPadding:
                          EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                          errorText: snapshot.error == null
                              ? ""
                              : snapshot.error.toString(), //snapshot.error!
                        ),
                      ),
                    );
                  },
                ),
                StreamBuilder<String>(
                  stream: manager.password$,
                  builder: (context, snapshot) {
                    return ListTile(
                      contentPadding:
                      EdgeInsets.symmetric(horizontal: 40, vertical: 5),
                      title: TextField(
                        onChanged: (value) {
                          manager.inPassword.add(value);
                        },
                        textInputAction: TextInputAction.next,
                        obscureText: true,
                        style: TextStyle(color: Colors.green),
                        cursorColor: Colors.green,
                        keyboardType: TextInputType.emailAddress,
                        decoration: InputDecoration(
                          labelText: 'Password',
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
                ),
                // StreamBuilder<String>(
                //   stream: manager.groupid$,
                //   builder: (context, snapshot) {
                //     return ListTile(
                //       contentPadding:
                //       EdgeInsets.symmetric(horizontal: 40, vertical: 5),
                //       title: TextField(
                //         onChanged: (value) {
                //           manager.inGroupId.add(value);
                //         },
                //         textInputAction: TextInputAction.next,
                //         obscureText: true,
                //         style: TextStyle(color: Colors.green),
                //         cursorColor: Colors.green,
                //         keyboardType: TextInputType.emailAddress,
                //         decoration: InputDecoration(
                //           labelText: 'Group Id',
                //           enabledBorder: OutlineInputBorder(
                //             borderSide: BorderSide(width: 3, color: Colors.blue),
                //             borderRadius: BorderRadius.circular(15),
                //           ),
                //           focusedBorder: OutlineInputBorder(
                //             borderSide: BorderSide(width: 40, color: Colors.red),
                //             borderRadius: BorderRadius.circular(15),
                //           ),errorText: snapshot.error == null
                //             ? ""
                //             : snapshot.error.toString(),)
                //         ,
                //       ),
                //       // decoration: InputDecoration(
                //       //   labelText: 'Password ',
                //       //   hintStyle: TextStyle(color: Colors.brown),
                //       //   contentPadding:
                //       //       EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                //       //   errorText: snapshot.error == null
                //       //       ? ""
                //       //       : snapshot.error.toString(), //snapshot.error
                //       // ),
                //     );
                //     //);
                //   },
                // ),
                Container(
                    width: 30,
                    height: 40,
                    child: Text(
                      "",

                      maxLines: 3,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontFamily: 'Comfortaa',
                        // fontWeight: FontWeight.w900,
                        fontSize: 13.0,
                        letterSpacing: 0.4,
                        color: Colors.red,
                      ),
                    )),
                SizedBox(
                  height: 2,
                ),
                Padding(
                  padding: const EdgeInsets.only(left:40.0),
                  child: Row(
                    children: [
                      Text(
                        'Are you a Group Member?',
                        maxLines: 3,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontFamily: 'Comfortaa',
                          // fontWeight: FontWeight.w900,
                          fontSize: 17.0,
                          letterSpacing: 0.4,
                          color: Color(0xff95b319),
                        ),
                      ),
                      SizedBox(width: 10,),
                      Checkbox(
                        checkColor: Colors.white,
                        activeColor: Colors.green,
                        value: isGroupPerson,
                        onChanged: (bool? value) {
                          setState(() {
                            print("--- the real check value is ${value}");
                            this.isGroupPerson = value!;
                            if(this.isGroupPerson){
                              leaderCheck = true;
                            }else{
                              leaderCheck = false;
                            }
                          });
                        },
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 2,
                ),
                leaderCheck ?
                Padding(
                  padding: const EdgeInsets.only(left: 38.0),
                  child: Row(

                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        'Group Leader',
                        maxLines: 3,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontFamily: 'Comfortaa',
                          // fontWeight: FontWeight.w900,
                          fontSize: 17.0,
                          letterSpacing: 0.4,
                          color: Color(0xff95b319),
                        ),
                      ),
                      SizedBox(width: 10,),
                      Switch(
                        value: isGroupLeader,
                        onChanged: (value) {
                          setState(() {
                            this.isGroupLeader = value;
                            print(" is leader ${this.isGroupLeader}");
                          });
                        },
                        activeTrackColor: Colors.lightGreenAccent,
                        activeColor: Colors.green,
                      ),

                    ],
                  ),
                ) : SizedBox(height: 1,),

                        SizedBox(
                          height: 30,
                        ),
                        StreamBuilder<Object>(
                            stream: manager.isFormValid$,
                            builder: (context, snapshot) {
                              return InkWell(
                                onTap: () {
                              //    Get.offAll(BottomTabbed());
                                  Overseer.isGroupLeader = this.isGroupLeader;
                                  Overseer.isGroupMember =  this.isGroupPerson;
                                  if(this.isGroupPerson ==  false) {
                                    Overseer.roleName = "user";
                                  }else if(Overseer.isGroupLeader){
                                    Overseer.roleName = "leader";
                                  }else{
                                    Overseer.roleName = "member";
                                  }

                                  Get.snackbar(
                                    "Submitting",
                                    "Verifying User Details",
                                    dismissDirection:
                                        DismissDirection.horizontal,
                                    isDismissible: true,
                                    backgroundColor: Colors.orangeAccent,
                                    duration: Duration(seconds: 1),
                                  );
                                  if (snapshot.hasData) {
                                    manager.isFormSubmit$.listen((event) async {

                                      SharedPreferences prefs;
                                      prefs = await SharedPreferences.getInstance();
                                      if (Overseer.is_user_valid) {
                                        prefs.setString("User_Rule", Overseer.user_rule);
                                       // prefs.setInt("User_Id", Overseer.logged_in_user_id!);
                                        print("log in email ${Overseer.userId.toString()}");
                                        print("log in user status ${Overseer.login_status}");
                                        print("log in user rule ${Overseer.user_rule}");
                                        // Overseer.logged_in_user_id = prefs.getInt("User_Id");
                                        Get.snackbar(
                                          "Congratulation",
                                          "Successfully LogIn with 7_minute_app",
                                          dismissDirection:
                                              DismissDirection.horizontal,
                                          isDismissible: true,
                                          backgroundColor: Colors.orangeAccent,
                                          duration: Duration(seconds: 1),
                                        );
                                        Get.offAll(BottomTabbed());

                                      } else if (snapshot.hasError) {
                                        Get.snackbar(
                                          "Error",
                                          "Get some Error..",
                                          dismissDirection:
                                              DismissDirection.horizontal,
                                          isDismissible: true,
                                          backgroundColor: Colors.orangeAccent,
                                          duration: Duration(seconds: 2),
                                        );
                                      }
                                    });
                                  } else {
                                    Get.snackbar(
                                      "Error",
                                      "Error is getting data..",
                                      dismissDirection:
                                          DismissDirection.horizontal,
                                      isDismissible: true,
                                      backgroundColor: Colors.orangeAccent,
                                      duration: Duration(seconds: 2),
                                    );
                                  }
                                  print("some error");
                                  // Get.to(BottomTabbed());
                                },
                                child: CustomButton(
                                  buttonName: 'Login',
                                ),
                              );
                            }),
                        SizedBox(
                          height: 15,
                        ),
                     InkWell(
                       child: CustomButton(
                       buttonName: 'OneDayOneRaku',

                       ),
                       onTap: (){
                         Get.offAll(AdminHomeScreen());
                       },
                     ),
                         SizedBox(
                         height: 15,
                          ),

                        InkWell(
                          onTap: () {
                            Get.to(Register());
                          },
                          child: Padding(
                            padding: const EdgeInsets.only(right: 8.0),
                            child: Align(
                              alignment: Alignment.topRight,
                              child: RichText(
                                text: TextSpan(
                                    text: 'Don\'t have an account? ',
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontFamily: 'Comfortaa'),
                                    children: <TextSpan>[
                                      TextSpan(
                                          text: 'Register',
                                          style: TextStyle(
                                              color: Color(0xFF3E6EA4),
                                              fontFamily: 'Comfortaa',
                                              fontWeight: FontWeight.w900))
                                    ]),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  )


    ));
  }
}
