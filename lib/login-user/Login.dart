import 'dart:async';


import 'package:seven_minutes/AppLayer/Provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:rxdart/rxdart.dart';
import 'package:seven_minutes/bottom_tabbed.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:seven_minutes/BottomNavigationBar/bottom_tabbed-old.dart';
//import '../userhome/UserHomeScreen.dart';

import 'package:flutter/material.dart';

import 'package:seven_minutes/AppLayer/Overseer.dart';

import 'UserManager.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  String login_status = "";
  String form_submit_status = "";

  @override
  Widget build(BuildContext context) {
    UserManager manager = Provider.of(context).fetch(UserManager);
    checkUser();
    return Scaffold(
        body: Form(
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
                  'Please Login to View Your Cattle',

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
              ),
              Container(
                  width: 30,
                  height: 40,
                  child: Text(
                    form_submit_status,

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
                height: 1,
              ),
              // SizedBox(
              //   height: 10,
              // ),
              // Container(
              //     padding: EdgeInsets.only(right: 35),
              //     child: InkWell(
              //       onTap: () {
              //         Navigator.push(context,
              //             MaterialPageRoute(builder: (context) => Signup()));
              //       },
              //       child: Align(
              //         alignment: Alignment.centerRight,
              //         child: RichText(
              //           text: TextSpan(
              //               text: 'Don\'t have an account?',
              //               style: TextStyle(
              //                 fontFamily: 'sans',
              //                 color: Colors.black,
              //               ),
              //               children: <TextSpan>[
              //                 TextSpan(
              //                   text: ' Sign up',
              //                   style: TextStyle(
              //                       fontFamily: 'sans',
              //                       fontWeight: FontWeight.bold,
              //                       color: Color(0xffD23C3D)),
              //                 )
              //               ]),
              //         ),
              //       ),
              //     )),
              SizedBox(
                height: 30,
              ),
              ListTile(
                title: StreamBuilder<Object>(
                    stream: manager.isFormValid$,
                    builder: (context, snapshot) {
                      print("-- data ? ${snapshot.hasData}");
                      print("-- error ? ${snapshot.hasError}");


                      return InkWell(
                        onTap: () {

                          Overseer.login_status = "user-not-exist";
                          setState(() {
                     //      form_submit_status = "Data:${snapshot.hasData}  Error:Data:${snapshot.hasError} "
                       //        " Status: ${Overseer.login_status}";
                          });

                          if (snapshot.hasData) {
                            // Scaffold.of(context).showSnackBar(new SnackBar(
                            //     content: new Text("Submitting ...")
                            // ));
                            print("yes has data ");

                            manager.isFormSubmit$.listen((event) {
                              setState(() {
                                form_submit_status = "Thanks for your details";
                              });

                            //  FocusScope.of(context).unfocus();
                              //  Overseer.login_status = "submitting";
                              // print("printing before focus with status " +
                              //     Overseer.login_status);
                              //
                              // print("printing after focus");
                              // Center(child: CircularProgressIndicator());
                              // onData(event) {
                              //   print("On data called from event");
                              //   return Center(child: CircularProgressIndicator());
                              // }
                              setState(() {
                                form_submit_status = "Status: ${Overseer.login_status}";
                              });
                              print("end of listen with status " +
                                  Overseer.login_status);

                              if (Overseer.login_status
                                  .contains("verified-user")) {
                                print("final ststus before move to next " +
                                    Overseer.login_status);


                                Get.offAll(BottomTabbed());
                              } else if (Overseer.login_status
                                  .contains("user-not-exist")) {
                                setState(() {
                                  form_submit_status = "Username or password are not correct";
                                });
                                print("printing before reload");
                                setState(() {
                                  login_status = Overseer.login_status;
                                });
                             //   (context as Element).reassemble();
                              }
                            });
                          } else {
                            setState(() {
                              form_submit_status = "Please Check form values";
                            });

                            print("form values are not proper");
                          }
                        },
                        child: Padding(
                          padding: EdgeInsets.only(
                              top: 30.0, left: 30, right: 30, bottom: 10),
                          child: Container(
                            height: 55.0,
                            width: 600.0,
                            child: Text(
                              "Login",
                              style: TextStyle(
                                  color: Colors.white,
                                  letterSpacing: 0.2,
                                  fontFamily: "Sans",
                                  fontSize: 18.0,
                                  fontWeight: FontWeight.w800),
                            ),
                            alignment: FractionalOffset.center,
                            decoration: BoxDecoration(
                                boxShadow: [
                                  BoxShadow(
                                      color: Colors.black38, blurRadius: 15.0)
                                ],
                                borderRadius: BorderRadius.circular(30.0),
                                color: Color(0xff95b319)
                                // gradient: LinearGradient(
                                //     colors: <Color>[Color(0xFF121940), Color(0xFF6E48AA)])
                                ),
                          ),
                        ),
                      );
                    }),
              ),

              // ListTile(
              //   title: StreamBuilder<Object>(
              //       stream: manager.isFormValid$,
              //       builder: (context, snapshot) {
              //         print("-- data ? ${snapshot.hasData}");
              //         print("-- error ? ${snapshot.hasError}");
              //         return TextButton(
              //           child: Text(
              //             'Login -> go',
              //             style: TextStyle(color: Colors.black),
              //           ),
              //           onPressed: () {
              //             if (snapshot.hasData) {
              //               print("yes has data ");
              //               manager.isFormSubmit$.listen((event) {
              //                 //  Overseer.login_status = "submitting";
              //                 print("printing before focus with status " +
              //                     Overseer.login_status);
              //
              //                 print("printing after focus");
              //                 Center(child: CircularProgressIndicator());
              //                 onData(event) {
              //                   print("On data called from event");
              //                   return Center(child: CircularProgressIndicator());
              //                 }
              //
              //                 print("end of listen with status " +
              //                     Overseer.login_status);
              //                 // FocusScope.of(context).unfocus();
              //                 if (Overseer.login_status
              //                     .contains("verified-user")) {
              //                   print("final ststus before move to next " +
              //                       Overseer.login_status);
              //                   Navigator.pushReplacement(
              //                       context,
              //                       MaterialPageRoute(
              //                           builder: (context) => UserHomeScreen()));
              //                 } else if (Overseer.login_status
              //                     .contains("user-not-exist")) {
              //                   print("printing before reload");
              //                   setState(() {
              //                     login_status = Overseer.login_status;
              //                   });
              //                   (context as Element).reassemble();
              //                 }
              //               });
              //             } else {
              //               print("form values are not proper");
              //             }
              //           },
              //         );
              //       }),
              // ),

              //   buttonBlackBottom()

              // buttonBlackDr()
              SizedBox(height: 30,),
              InkWell(
                onTap: (){
                  Navigator.of(context).pushReplacement(PageRouteBuilder(
                      pageBuilder: (_, __, ___) => new BottomTabbed()));
                },
                child: Container(
                    width: 30,
                    height: 20,
                    child: Text(
                      'Project Info',

                      maxLines: 3,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontFamily: 'Comfortaa',
                        // fontWeight: FontWeight.w900,
                        fontSize: 12.0,
                        letterSpacing: 0.4,
                        color: Colors.blue,
                      ),
                    )),
              ),
            ],
          ),
        ),
      );

  }

  Future<bool> checkUser() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
   //  prefs.setString('userid',"not-an-id");
     Overseer.logged_in_user_st = "not-an-id";
     return false;
  }
}

/// textfromfield custom class
class textFromField extends StatelessWidget {
  bool password;
  String email;
  IconData icon;
  TextInputType inputType;

  textFromField({required this.email, required this.icon, required this.inputType, required this.password});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 30.0),
      child: Container(
        height: 45.0,
        alignment: AlignmentDirectional.center,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30.0),
            border: Border.all(color: Color(0xff22AE4B))
            // boxShadow: [BoxShadow(blurRadius: 10.0, color: Colors.black12)]
            ),
        padding:
            EdgeInsets.only(left: 20.0, right: 30.0, top: 0.0, bottom: 0.0),
        child: Theme(
          data: ThemeData(
            hintColor: Colors.transparent,
          ),
          child: TextFormField(
            cursorColor: Color(0xff22AE4B),
            obscureText: password,
            decoration: InputDecoration(
                border: InputBorder.none,
                hintText: email,
                icon: Icon(
                  icon,
                  color: Color(0xff22AE4B),
                ),
                hintStyle: TextStyle(
                    fontSize: 15.0,
                    fontFamily: 'Sans',
                    letterSpacing: 0.3,
                    color: Color(0xff22AE4B),
                    fontWeight: FontWeight.w600)),
            keyboardType: inputType,
          ),
        ),
      ),
    );
  }
}

///ButtonBlack class
class buttonBlackBottom extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        // Overseer.userRole = 'Patient';
        Get.offAll(BottomTabbed());
      },
      child: Padding(
        padding: EdgeInsets.only(top: 30.0, left: 30, right: 30, bottom: 10),
        child: Container(
          height: 55.0,
          width: 600.0,
          child: Text(
            'Login',
            style: TextStyle(
                color: Colors.white,
                letterSpacing: 0.2,
                fontFamily: "Sans",
                fontSize: 18.0,
                fontWeight: FontWeight.w800),
          ),
          alignment: FractionalOffset.center,
          decoration: BoxDecoration(
              boxShadow: [BoxShadow(color: Colors.black38, blurRadius: 15.0)],
              borderRadius: BorderRadius.circular(30.0),
              color: Color(0xff95b319)
              // gradient: LinearGradient(
              //     colors: <Color>[Color(0xFF121940), Color(0xFF6E48AA)])
              ),
        ),
      ),
    );
  }
}

// class buttonBlackDr extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return InkWell(
//       onTap: () {
//         // Overseer.userRole = 'Doctor';
//         Navigator.push(
//             context, MaterialPageRoute(builder: (context) => BottomTabbed()));
//       },
//       child: Padding(
//         padding: EdgeInsets.all(30.0),
//         child: Container(
//           height: 55.0,
//           width: 600.0,
//           child: Text(
//             'Login as Guset',
//             style: TextStyle(
//                 color: Colors.white,
//                 letterSpacing: 0.2,
//                 fontFamily: "Sans",
//                 fontSize: 18.0,
//                 fontWeight: FontWeight.w800),
//           ),
//           alignment: FractionalOffset.center,
//           decoration: BoxDecoration(
//               boxShadow: [BoxShadow(color: Colors.black38, blurRadius: 15.0)],
//               borderRadius: BorderRadius.circular(30.0),
//               color: Color(0xff22AE4B)),
//         ),
//       ),
//     );
//   }
// }
