import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:seven_minutes/AppLayer/Overseer.dart';
import 'package:seven_minutes/AppLayer/Provider.dart';
import 'package:seven_minutes/login/Login.dart';
import 'package:seven_minutes/login/LogInModel.dart';
//import 'package:seven_minutes/register/RegisterAsAmanager.dart';
import 'package:seven_minutes/register/RegisteredAsAMemberModel.dart';
import 'package:seven_minutes/register/RegisteredGroupLeaderModel.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../Widgets/CustomButton.dart';
import '../Widgets/TextFieldWidget.dart';
import 'RegisterAsAmemberManager.dart';
import 'RegisterGroupLeaderManager.dart';

class Register extends StatefulWidget {
  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  var email;
  var phone;
  var gruId;
  var password;
  var confirmPassword;
  var firstName;
  var lastName;
  var radio = 1;
  int _index = 0;

  bool isGroupPerson = false;
  bool isGroupLeader = false;
  bool leaderCheck = false;


  bool isSwitched = false;
  var formKey = GlobalKey<FormState>();
  List<String> nameList = ["Group User", "Group Leader"];

  @override
  Widget build(BuildContext context) {
    RegisterAsAMemberManager manager =
        Provider.of(context).fetch(RegisterAsAMemberManager);

    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: ListView(
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              children: [
                Column(
                  children: [
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      'Register',
                      style: TextStyle(
                          color: Color(0xFF3E6EA4),
                          fontFamily: 'Comfortaa',
                          fontWeight: FontWeight.w900,
                          letterSpacing: 1,
                          fontSize: 30),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    // Container(
                    //   margin: EdgeInsets.only(left: 23),
                    //   width: Get.width * 0.9,
                    //   height: 30,
                    //   child: ListView.builder(
                    //       itemCount: 2,
                    //       scrollDirection: Axis.horizontal,
                    //       itemBuilder: (contex, index) {
                    //         return GestureDetector(
                    //           onTap: () {
                    //             setState(() {
                    //               _index = index;
                    //             });
                    //           },
                    //           child: Container(
                    //             height: 30,
                    //             width: Get.width * 0.4,
                    //             margin: EdgeInsets.symmetric(horizontal: 5),
                    //             decoration: BoxDecoration(
                    //                 borderRadius: BorderRadius.circular(10),
                    //                 border: Border.all(
                    //                     color: index == _index
                    //                         ? Colors.black
                    //                         : Colors.grey),
                    //                 color: index == _index
                    //                     ? Colors.grey
                    //                     : Colors.white),
                    //             child: Row(
                    //               mainAxisAlignment: MainAxisAlignment.center,
                    //               children: [
                    //                 Container(
                    //                   child: Center(
                    //                       child: Text(
                    //                     "${nameList[index]}",
                    //                     overflow: TextOverflow.ellipsis,
                    //                     style: TextStyle(
                    //                         fontWeight: FontWeight.bold),
                    //                   )),
                    //                 )
                    //               ],
                    //             ),
                    //           ),
                    //         );
                    //       }),
                    // ),
                    SizedBox(
                      height: 15,
                    ),
                    Form(
                        key: formKey,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 30),
                          child:  Column(
                                  children: [
                                     //first name
                                    StreamBuilder<String>(
                                      stream: manager.firstName$,
                                      builder: (context, snapshot) {
                                        return ListTile(
                                          contentPadding:
                                          EdgeInsets.symmetric(horizontal: 5, vertical: 1),
                                          title: TextField(
                                            onChanged: (value) {
                                              manager.infirstName.add(value);
                                            },
                                            textInputAction: TextInputAction.next,
                                            obscureText: false,
                                            style: TextStyle(color: Colors.green),
                                            cursorColor: Colors.green,
                                            keyboardType: TextInputType.emailAddress,
                                            decoration: InputDecoration(
                                              labelText: 'First Name',
                                              enabledBorder: OutlineInputBorder(
                                                borderSide: BorderSide(width: 3, color: Colors.blue),
                                                borderRadius: BorderRadius.circular(15),
                                              ),
                                              focusedBorder: OutlineInputBorder(
                                                borderSide: BorderSide(width: 40, color: Colors.blue),
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
                                    ), // last name
                                    StreamBuilder<String>(
                                      stream: manager.lastName$,
                                      builder: (context, snapshot) {
                                        return ListTile(
                                          contentPadding:
                                          EdgeInsets.symmetric(horizontal: 5, vertical: 1),
                                          title: TextField(
                                            onChanged: (value) {
                                              manager.inlastName.add(value);
                                            },
                                            textInputAction: TextInputAction.next,
                                            obscureText: false,
                                            style: TextStyle(color: Colors.green),
                                            cursorColor: Colors.green,
                                            keyboardType: TextInputType.emailAddress,
                                            decoration: InputDecoration(
                                              labelText: 'Last Name',
                                              enabledBorder: OutlineInputBorder(
                                                borderSide: BorderSide(width: 3, color: Colors.blue),
                                                borderRadius: BorderRadius.circular(15),
                                              ),
                                              focusedBorder: OutlineInputBorder(
                                                borderSide: BorderSide(width: 40, color: Colors.blue),
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
                                    ), // email
                                    StreamBuilder<String>(
                                      stream: manager.email$,
                                      builder: (context, snapshot) {
                                        return ListTile(
                                          contentPadding:
                                          EdgeInsets.symmetric(horizontal: 5, vertical: 1),
                                          title: TextField(
                                            onChanged: (value) {
                                              manager.inEmail.add(value);
                                            },
                                            textInputAction: TextInputAction.next,
                                            obscureText: false,
                                            style: TextStyle(color: Colors.green),
                                            cursorColor: Colors.green,
                                            keyboardType: TextInputType.emailAddress,
                                            decoration: InputDecoration(
                                              labelText: 'Email',
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

                                    StreamBuilder<String>(
                                      stream: manager.phoneNumber$,
                                      builder: (context, snapshot) {
                                        return ListTile(
                                          contentPadding:
                                          EdgeInsets.symmetric(horizontal: 5, vertical: 1),
                                          title: TextField(
                                            onChanged: (value) {
                                              manager.inPhoneNumber.add(value);
                                            },
                                            textInputAction: TextInputAction.next,
                                            obscureText: false,
                                            style: TextStyle(color: Colors.green),
                                            cursorColor: Colors.green,
                                            keyboardType: TextInputType.emailAddress,
                                            decoration: InputDecoration(
                                              labelText: 'Phone',
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
                                    Container(
                                      // height: 50,
                                      child: Row(
                                        mainAxisAlignment:
                                        MainAxisAlignment.start,
                                        children: [
                                          Text("Gender"),
                                          Radio(
                                              value: 2,
                                              groupValue: radio,
                                              onChanged: (val) {
                                                radio = val as int;
                                                setState(() {
                                                  manager.inGender.add("Male");
                                                  Overseer.gender = "Male";
                                                });
                                              }),
                                          Text("Male"),
                                          Radio(
                                              value: 3,
                                              groupValue: radio,
                                              onChanged: (val) {
                                                radio = val as int;
                                                setState(() {
                                                  manager.inGender.add("Female");
                                                  Overseer.gender = "Female";
                                                });
                                              }),
                                          Text("Female"),
                                        ],
                                      ),
                                    ),//  phone
                                  // group id
                                    StreamBuilder<String>(
                                      stream: manager.password$,
                                      builder: (context, snapshot) {
                                        return ListTile(
                                          contentPadding:
                                          EdgeInsets.symmetric(horizontal: 5, vertical: 1),
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
                                    ), // password
                                    StreamBuilder<String>(
                                      stream: manager.confirmPassword$,
                                      builder: (context, snapshot) {
                                        return ListTile(
                                          contentPadding:
                                          EdgeInsets.symmetric(horizontal: 5, vertical: 1),
                                          title: TextField(
                                            onChanged: (value) {
                                              manager.inConfirmPassword.add(value);
                                            },
                                            textInputAction: TextInputAction.next,
                                            obscureText: true,
                                            style: TextStyle(color: Colors.green),
                                            cursorColor: Colors.green,
                                            keyboardType: TextInputType.emailAddress,
                                            decoration: InputDecoration(
                                              labelText: 'Confirm Password',
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
                                    SizedBox(
                                      height: 2,
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(left:5.0),
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
                                      padding: const EdgeInsets.only(left: 5.0),
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
                                    leaderCheck ?
                                    this.isGroupLeader ?
                                    StreamBuilder<String>(
                                      stream: manager.groupName$,
                                      builder: (context, snapshot) {
                                        return ListTile(
                                          contentPadding:
                                          EdgeInsets.symmetric(horizontal: 5, vertical: 1),
                                          title: TextField(
                                            onChanged: (value) {
                                              manager.inGroupName.add(value);
                                            },
                                            textInputAction: TextInputAction.next,
                                            obscureText: false,
                                            style: TextStyle(color: Colors.green),
                                            cursorColor: Colors.green,
                                            keyboardType: TextInputType.emailAddress,
                                            decoration: InputDecoration(
                                              labelText: 'New Group Name',
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
                                    ):SizedBox(height: 1,) : SizedBox(height: 1,),
                                    leaderCheck ?// group name
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
                                              labelText: 'New Group ID',
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
                                    ): SizedBox(height: 1,),// confirm password
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
                                                    Get.offAll(Login());
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
                                              buttonName: 'SignUp',
                                            ),
                                          );
                                        }), // submit button
                                    SizedBox(
                                      height: 20,
                                    ),
                                    InkWell(
                                      onTap: () {
                                        Get.to(Login());
                                      },
                                      child: Align(
                                        alignment: Alignment.center,
                                        child: RichText(
                                          text: TextSpan(
                                              text:
                                                  'Already registered? Please  ',
                                              style: TextStyle(
                                                  color: Colors.black,
                                                  fontFamily: 'Comfortaa'),
                                              children: <TextSpan>[
                                                TextSpan(
                                                    text: 'Login',
                                                    style: TextStyle(
                                                        color:
                                                            Color(0xFF3E6EA4),
                                                        fontFamily: 'Comfortaa',
                                                        fontWeight:
                                                            FontWeight.w900))
                                              ]),
                                        ),
                                      ),
                                    ),
                                    SizedBox(height:30)
                                  ],
                                ),
                        ))
                  ],
                ),
              ]),
        ),
      ),
    );
  }

  snackBar({String? title, String? details}) {
    Get.snackbar(
      "${title}",
      "${details}",
      dismissDirection: DismissDirection.horizontal,
      isDismissible: true,
      backgroundColor: Colors.orangeAccent,
      duration: Duration(seconds: 1),
    );
  }
}
