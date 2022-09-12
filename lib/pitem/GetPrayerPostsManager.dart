import 'dart:async';
// import 'package:apipractice/appointments/GetSunnahPosts.dart';
// import 'package:apipractice/pitem/GetSunnahPostsService.dart';
import 'package:rxdart/rxdart.dart';
import 'package:flutter/material.dart';
// import 'package:seven_minutes/groupUsers/GetSunnahPosts.dart';
// import 'package:seven_minutes/groupUsers/GetSunnahPosts.dart';
// import 'package:seven_minutes/groupUsers/GetSunnahPosts.dart';
// import 'package:seven_minutes/groupUsers/GetSunnahPosts.dart';
// import 'package:seven_minutes/groupUsers/GetSunnahPosts.dart';
// import 'package:seven_minutes/groupUsers/GetSunnahPosts.dart';
// import 'package:seven_minutes/groupUsers/GetSunnahPosts.dart';
// import 'package:seven_minutes/groupUsers/GetSunnahPosts.dart';

import 'GetPrayerPosts.dart';
import 'GetPrayerPostsService.dart';


class GetPrayerPostsManager {

  final BehaviorSubject<List<GetPrayerPosts>> _product = BehaviorSubject<List<GetPrayerPosts>>();

  Stream<List<GetPrayerPosts>> get productList async* {

    yield await GetPrayerPostsService.browse();
  }

  GetPrayerPostsManager() {
    print("-- printing from product manager");
    // productList.listen((value) => _product.addStream(productList));

  }

}