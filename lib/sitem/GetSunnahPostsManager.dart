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

import 'GetSunnahPosts.dart';
import 'GetSunnahPostsService.dart';


class GetSunnahPostsManager {

  final BehaviorSubject<List<GetSunnahPosts>> _product = BehaviorSubject<List<GetSunnahPosts>>();

  Stream<List<GetSunnahPosts>> get productList async* {

    yield await GetSunnahPostsService.browse();
  }

  GetSunnahPostsManager() {
    print("-- printing from product manager");
    // productList.listen((value) => _product.addStream(productList));

  }

}