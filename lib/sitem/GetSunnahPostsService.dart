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

import 'GetSunnahPosts.dart';
// import 'package:apipractice/pitem/GetSunnahPosts.dart';

class GetSunnahPostsService {
  static String _url = 'https://jsonplaceholder.typicode.com/todos';

  // URL

  static Future<List<GetSunnahPosts>> browse() async {
    print("printig from browse >>>???");

    print("Query URL -->  https://7minapp.s3bits.com/api/getposts?item_category_id=3&user_id=3&post_date=2022-04-19");
    http.Response   response = await http.post(Uri.parse("https://7minapp.s3bits.com/api/getposts?item_category_id=3&user_id=3&post_date=2022-04-19"),headers: {

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
  print("before parsing");
    List<GetSunnahPosts> _getPostsList =
        collection.map((json) => GetSunnahPosts.fromJson(json)).toList();
    print("after parsing");


    print("the count is ${_getPostsList.length}");
    return _getPostsList;
  }
}

void main() {
  GetSunnahPostsService.browse();
}
