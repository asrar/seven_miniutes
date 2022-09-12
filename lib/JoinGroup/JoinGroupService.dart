// import 'dart:async';
// import 'dart:convert';
// import 'package:http/http.dart' as http;
// import 'package:seven_minutes/AppLayer/Overseer.dart';
// import 'package:seven_minutes/register/RegisteredAsAMemberModel.dart';
//
// class JoinGroupService {
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
import 'package:seven_minutes/register/RegisteredAsAMemberModel.dart';

class JoinGroupService {
  static Future<bool> browse(query) async {
    http.Response response;
    print("Date query  ${query}");

      print("Joining request from User ${Overseer.userName}");
      response = await http.post(

        /// get the data
          Uri.parse("https://7minapp.s3bits.com/api/sendRequestforJoinGroup?user_id=${Overseer.userId}&group_unique_id=${query}}"),
          headers: {
            'Access-Control-Allow-Origin': '*',
            'Accept': 'application/json',
            'Authorization':
            'Bearer dKz99vl2FrdIpccgb1GUbXcNgfzpqvLrEg6gs5EscioQzy2iwdezfWEuLUY3',
          });

    print("got the response from join group request");
    String content = response.body;
    Overseer.printWrapped(content);
    var jString = [content];

    String arr = jString.toString();
    // TODO:We will do this in mroning before election
    List collection = json.decode(arr);
    List<RegisteredAsAMemberModel> _userList =
        collection.map((json) => RegisteredAsAMemberModel.fromJson(json)).toList();
    print("//printig from service >>> ");
    if (response.statusCode != 200) {
      Overseer.register_status = "user-not-exist";
      Overseer.is_user_Registered = false;

      print("login status from service " + Overseer.register_status);
    } else {
      Overseer.register_status = "verified-user";
      Overseer.is_user_Registered = true;
      print("login status from service else " + Overseer.register_status);
    }

    print("end of listen with status " + Overseer.register_status);

    return Overseer.is_user_Registered;
  } // end of main top if ( does not contain error )
}
