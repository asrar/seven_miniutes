import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:seven_minutes/AppLayer/Overseer.dart';


import 'UsersGroupModel.dart';

class GroupUsersService {
  static Future<List<UsersGroupModel>> browse() async {
    http.Response response;
    print("-- calling group URL >> http://7minapp.s3bits.com/api/groupUsers?user_id=${Overseer.userId} ");
    response = await http.post(

        /// get the data
        Uri.parse("http://7minapp.s3bits.com/api/groupUsers?user_id=${Overseer.userId}"),
        headers: {
          'Access-Control-Allow-Origin': '*',
          'Accept': 'application/json',
          'Authorization':
              'Bearer dKz99vl2FrdIpccgb1GUbXcNgfzpqvLrEg6gs5EscioQzy2iwdezfWEuLUY3',
        });
    print("got the response");
    String content = response.body;
     Overseer.printWrapped("this is the body of group user ${content}");
    var jString = [content];

    String arr = jString.toString();
    List collection = json.decode(arr);

    List<UsersGroupModel> _mainList =
        collection.map((json) => UsersGroupModel.fromJson(json)).toList();

    return _mainList;
  }
}
