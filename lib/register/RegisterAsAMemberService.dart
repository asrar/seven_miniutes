// import 'dart:async';
// import 'dart:convert';
// import 'package:http/http.dart' as http;
// import 'package:seven_minutes/AppLayer/Overseer.dart';
// import 'package:seven_minutes/register/RegisteredAsAMemberModel.dart';
//
// class RegisterAsAMemberService {
//   static Future<bool> browse(query) async {
//     http.Response response;
//     print("Date query  member ${query}");
//     response = await http.post(
//
//         /// get the data
//         Uri.parse(
//             "http://7minapp.s3bits.com/api/registerUser?${query}"),
//         headers: {
//           'Access-Control-Allow-Origin': '*',
//           'Accept': 'application/json',
//           'Authorization':
//               'Bearer dKz99vl2FrdIpccgb1GUbXcNgfzpqvLrEg6gs5EscioQzy2iwdezfWEuLUY3',
//         });
//     print("got the response member");
//     String content = response.body;
//     Overseer.printWrapped("this is content member ${content}");
//     var jString = [content];
//
//     String arr = jString.toString();
//     List collection = json.decode(arr);
//     print("line no 29  member");
//     List<RegisteredAsAMemberModel> _userList = collection
//         .map((json) => RegisteredAsAMemberModel.fromJson(json))
//         .toList();
//     print("//printig from service member >>> ${response.statusCode} ");
//     print("//printig from service member >>> ${response} ");
//     if (response.statusCode != 200) {
//       Overseer.register_status = "user-not-exist02330 member";
//       Overseer.is_user_Registered = false;
//       Overseer.message = _userList[0].message;
//       print("login status from service  member" + Overseer.register_status);
//     } else {
//       Overseer.register_status = "verified-user member";
//       Overseer.is_user_Registered = true;
//       Overseer.message = _userList[0].message;
//       print("login status from service else " + Overseer.register_status);
//     }
//
//
//     return Overseer.is_user_Registered;
//   } // end of main top if ( does not contain error )
// }


import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:seven_minutes/AppLayer/Overseer.dart';
//import 'package:seven_minutes/register/RegisteredAsAMemberModel.dart';
import 'package:seven_minutes/register/RegisterModel.dart';

class RegisterAsAMemberService {
  static Future<bool> browse(query) async {
    http.Response response;
    print("Date query  ${query}");
    if(query.contains("&group_name=")) {
      print("SAVING GROUP LEADER OR MEMBER ");
      response = await http.post(

        /// get the data
          Uri.parse("https://7minapp.s3bits.com/api/registerLeaderwithGroup?${query}"),
          headers: {
            'Access-Control-Allow-Origin': '*',
            'Accept': 'application/json',
            'Authorization':
            'Bearer dKz99vl2FrdIpccgb1GUbXcNgfzpqvLrEg6gs5EscioQzy2iwdezfWEuLUY3',
          });
    }else{
      print("SAVING USER");
      response = await http.post(

        /// get the data
          Uri.parse("https://7minapp.s3bits.com/api/registerUser?${query}"),
          headers: {
            'Access-Control-Allow-Origin': '*',
            'Accept': 'application/json',
            'Authorization':
            'Bearer dKz99vl2FrdIpccgb1GUbXcNgfzpqvLrEg6gs5EscioQzy2iwdezfWEuLUY3',
          });

    }
    print("got the response this is user reg");
    String content = response.body;
    Overseer.printWrapped(content);
    var jString = [content];

    String arr = jString.toString();
    // TODO:We will do this in mroning before election
    List collection = json.decode(arr);
    List<RegisterModel> _userList =
        collection.map((json) => RegisterModel.fromJson(json)).toList();


    print("//printig from service >>> ");
    if (response.statusCode != 200) {
      Overseer.register_status = "user-not-exist";
      Overseer.is_user_Registered = false;
      String errorMsg = _userList[0].error;
      Overseer.errorMsg = errorMsg;
      print("login status from service " + Overseer.register_status);
      print("Error msg on Register " + Overseer.errorMsg);

    } else {

      int userId = _userList[0].user[0].id;
      Overseer.userId = userId;
      if(!query.contains("&group_name=") && query.contains("&group_unique_id=")) {
        Overseer.joinGroupRequest = true;

      }else {
        Overseer.joinGroupRequest = false;
      }

      Overseer.register_status = "verified-user";
      Overseer.is_user_Registered = true;
      print("login status from service else " + Overseer.register_status);
    }

    print("end of listen with status " + Overseer.register_status);

    return Overseer.is_user_Registered;
  } // end of main top if ( does not contain error )
}
