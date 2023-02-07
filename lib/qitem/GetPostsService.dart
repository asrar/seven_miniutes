import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:seven_minutes/AppLayer/Overseer.dart';
// import 'package:seven_minutes/groupUsers/GetSunnahPosts.dart';
// import 'package:seven_minutes/groupUsers/GetSunnahPosts.dart';
// import 'package:seven_minutes/groupUsers/GetSunnahPosts.dart';
// import 'package:seven_minutes/groupUsers/GetSunnahPosts.dart';
// import 'package:seven_minutes/groupUsers/GetSunnahPosts.dart';
// import 'package:seven_minutes/groupUsers/GetSunnahPosts.dart';

import 'GetPosts.dart';
// import 'package:apipractice/pitem/GetSunnahPosts.dart';

class GetPostsService {
  static String _url = 'https://jsonplaceholder.typicode.com/todos';

  // URL

  static Future<bool> saveActivity() async {
    print("SAVE ACTIVITY DONE URL");
    print(  "https://7minapp.s3bits.com/api/activityLog?user_id=${Overseer.userId}&topic_id="
        "${Overseer.topicId}")  ;
    http.Response   response = await http.post(Uri.parse(
        "https://7minapp.s3bits.com/api/activityLog?user_id=${Overseer.userId}&topic_id=${Overseer.topicId}")
        ,headers: {

      'Access-Control-Allow-Origin': '*',
      'Accept': 'application/json',
      'Authorization' : 'Bearer dKz99vl2FrdIpccgb1GUbXcNgfzpqvLrEg6gs5EscioQzy2iwdezfWEuLUY3',
    });

    print("got the response");
    String content = response.body;
    Overseer.printWrapped(content);



    print("printig from service >>>1 ${content}");

    if(content.contains("Post Viewed")) {

    }

    return true;
  }
  static Future<List<GetPosts>> browse() async {
    print("printig from browse testing Nitem >>>???");
    int year = Overseer.iS_oneRakuScreen ?2035:DateTime.now().year;
    int month = DateTime.now().month;
    int day = DateTime.now().day;
    print("Query URL -->  https://7minapp.s3bits.com/api/getposts?item_category_id=2&user_id=3&post_date=${year}-${month}-${day}");
    http.Response   response = await http.post(Uri.parse("https://7minapp.s3bits.com/api/getposts?item_category_id=2&user_id=3&post_date=${year}-${month}-${day}"),headers: {

      'Access-Control-Allow-Origin': '*',
      'Accept': 'application/json',
      'Authorization' : 'Bearer dKz99vl2FrdIpccgb1GUbXcNgfzpqvLrEg6gs5EscioQzy2iwdezfWEuLUY3',
    });

    print("got the response");
    String content = response.body;
    Overseer.printWrapped(content);



    print("printig from service >>>1 ${content}");
   // var cont = [content];
    List collection = json.decode(content);

    List<GetPosts> _getPostsList =
        collection.map((json) => GetPosts.fromJson(json)).toList();




    print("the count is ${_getPostsList.length}");
    return _getPostsList;
  }
}

void main() {
  GetPostsService.browse();
}
