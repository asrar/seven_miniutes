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

import 'GetPrayerPosts.dart';
// import 'package:apipractice/pitem/GetSunnahPosts.dart';

class GetPrayerPostsService {
  static String _url = 'https://jsonplaceholder.typicode.com/todos';

  // URL

  static Future<List<GetPrayerPosts>> browse() async {
    print("printig from browse testing Nitem >>>???");

    print("Query URL -->  https://7minapp.s3bits.com/api/getposts?item_category_id=1&user_id=3&post_date=2022-09-01");
    http.Response   response = await http.post(Uri.parse("https://7minapp.s3bits.com/api/getposts?item_category_id=1&user_id=3&post_date=2022-09-01"),headers: {

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

    List<GetPrayerPosts> _getPostsList =
    collection.map((json) => GetPrayerPosts.fromJson(json)).toList();

    print("-- after printing error");

    print("the count is ${_getPostsList.length}");
    return _getPostsList;
  }
}

void main() {
  GetPrayerPostsService.browse();
}
