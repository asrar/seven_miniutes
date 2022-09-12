import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:seven_minutes/AppLayer/Overseer.dart';


import 'ActivityLog.dart';

class AcivityService {
  static Future<List<ActivityLogModel>> browse() async {
    http.Response response;
    response = await http.post(
      /// get the data
        Uri.parse('https://7minapp.s3bits.com/api/activityLog?user_id=${Overseer.userId}&topic_id=100'),
        headers: {
          'Access-Control-Allow-Origin': '*',
          'Accept': 'application/json',
          'Authorization':
          'Bearer dKz99vl2FrdIpccgb1GUbXcNgfzpqvLrEg6gs5EscioQzy2iwdezfWEuLUY3',
        });
    print("got the response");
    String content = response.body;
    //  Overseer.printWrapped(content);
    var jString = [content];
    if(response.statusCode == 200){
      // print("this is a activity status code insdie if ${response.statusCode}");
      print("activity true ");

      Overseer.addActivity = true;

      // print("bool statement ${Overseer.addActivity}");
    }
    else {
      // print("this is a activity status code out side if  ${response.statusCode}");
      Overseer.addActivity = false;
    }

    String arr = jString.toString();
    List collection = json.decode(arr);

    List<ActivityLogModel> _mainList =
    collection.map((json) => ActivityLogModel.fromJson(json)).toList();
    Overseer.activityLogMessage = _mainList[0].msg;
    // print("add message ${Overseer.activityLogMessage}");

    return _mainList;
  }
}


