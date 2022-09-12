import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;


import 'Logout.dart';

class LogOutService {
  static Future<List<Logout>> browse() async {
    http.Response response;
    response = await http.post(
      /// get the data
        Uri.parse("http://7minapp.s3bits.com/api/activityLog?user_id=3&topic_id=1"),
        headers: {
          'Access-Control-Allow-Origin': '*',
          'Accept': 'application/json',
          'Authorization':
          'Bearer dKz99vl2FrdIpccgb1GUbXcNgfzpqvLrEg6gs5EscioQzy2iwdezfWEuLUY3',
        });
    //,headers: {
    //       'Access-Control-Allow-Origin': '*',
    //       'Accept' : 'application/json',
    //       'Authorization':'Bearer ${Overseer.token}',
    //
    //     }
    print("got the response");
    String content = response.body;
    //  Overseer.printWrapped(content);
    var jString = [content];

    String arr = jString.toString();
    List collection = json.decode(arr);

    List<Logout> _mainList =
    collection.map((json) => Logout.fromJson(json)).toList();
    // print(_mainList[0].msg);

    return _mainList;
  }
}


