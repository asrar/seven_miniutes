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

import '../AppLayer/Overseer.dart';
import 'GetPosts.dart';
import 'GetPostsService.dart';


class GetPostsManager {

  final BehaviorSubject<List<GetPosts>> _product = BehaviorSubject<List<GetPosts>>();

  Stream<List<GetPosts>> get productList async* {

    if(Overseer.isLoadingDone) {
      print("-- get data in browse");
      yield await GetPostsService.browse();
    }else{
      print("-- get data in active quran post");
      yield await Overseer.quranAactivePostList;
    }
  }

  Stream<bool> get saveActivity async* {
    yield await GetPostsService.saveActivity();
  }

  GetPostsManager() {
    print("-- printing from product manager");
    // productList.listen((value) => _product.addStream(productList));

  }

}