import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:seven_minutes/AppLayer/Overseer.dart';

import 'RegisteredGroupLeaderModel.dart';

class RegisterGroupLeaderService {
  static Future<bool> browse(query) async {
    http.Response response;
    print("Date query  ${query}");
    response = await http.post(

        /// get the data
        Uri.parse(
            "https://7minapp.s3bits.com/api/registerLeaderwithGroup?first_name=${Overseer.firstName}&last_name=${Overseer.lastName}&email=${Overseer.email}&password=${Overseer.password}&gender=${Overseer.gender}&phone=${Overseer.phoneNumber}&group_name=${Overseer.groupName}&group_unique_id=${Overseer.groupId}"),
        headers: {
          'Access-Control-Allow-Origin': '*',
          'Accept': 'application/json',
          'Authorization':
              'Bearer dKz99vl2FrdIpccgb1GUbXcNgfzpqvLrEg6gs5EscioQzy2iwdezfWEuLUY3',
        });
    print("got the response leader status code ${response.statusCode}");
    String content = response.body;
    Overseer.printWrapped("this is content leader ${content}");
    var jString = [content];

    String arr = jString.toString();
    List collection = json.decode(arr);
    print("line no 29 error leader");
    List<RegisteredGroupLeaderModel> _userList = collection
        .map((json) => RegisteredGroupLeaderModel.fromJson(json))
        .toList();
    print("printing from service leader >>> ${response.statusCode} ");
    print("printing from service  leader >>> ${response} ");
    if (response.statusCode != 200) {
      Overseer.register_status = "user-not-exist leader";
      Overseer.is_GroupLeader_Registered = false;
      Overseer.message = _userList[0].message;
    } else {
      Overseer.register_status = "verified-user leader";
      Overseer.is_GroupLeader_Registered = true;
      print(
          "login status from service else leader " + Overseer.register_status);
    }
    return Overseer.is_GroupLeader_Registered;
  } // end of main top if ( does not contain error )
}
