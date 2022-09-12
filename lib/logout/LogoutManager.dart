import 'dart:async';
// import 'package:apipractice/appointments/Logout.dart';
// import 'package:apipractice/pitem/LogoutService.dart';
import 'package:rxdart/rxdart.dart';
import 'package:flutter/material.dart';



import 'Logout.dart';
import 'LogoutService.dart';


class LogoutManager {

  // final BehaviorSubject<List<Logout>> _product = BehaviorSubject<List<Logout>>();

  final BehaviorSubject<List<Logout>> _main =
  BehaviorSubject<List<Logout>>();

  Stream<List<Logout>> get mainList async* {
    yield await LogOutService.browse();
  }

  ActivityManager() {
    print("-- getting data from stream");
    mainList.listen((value) => _main.addStream(mainList));
  }

}