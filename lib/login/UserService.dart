import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:seven_minutes/AppLayer/Overseer.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'LogInModel.dart';

class UserService {
  static Future<bool> browse(String query) async {
    //  Overseer over = new Overseer();
    print("-- AUTH SERVICE BROWSE METHOD 1.2");
    http.Response response;
    String _url = "";
    if (query != null && query.isNotEmpty) {
      _url = "https://7minapp.s3bits.com/api/login?${query}&group_unique_id=test";
      print("// final USER URL    >>>" + _url);
      response = await http.post(Uri.parse(_url), headers: {
        'Access-Control-Allow-Origin': '*',
        'Accept': 'application/json',
        'Authorization':
            'Bearer dKz99vl2FrdIpccgb1GUbXcNgfzpqvLrEg6gs5EscioQzy2iwdezfWEuLUY3',
      },);
    } else {
      response = await http.post(Uri.parse(_url), headers: {
        'Access-Control-Allow-Origin': '*',
        'Accept': 'application/json',
      });
    }
    print("getting for url " + _url);
    print("User LogIn Request status code  ${response.statusCode}");

    //  response = await http.get(_url,headers: {'Access-Control-Allow-Origin': '*'});
    String content = response.body;
    Overseer.printWrapped("user details print" + content);
    if (response.statusCode != 200) {
      print("########### Error ############");

      print(
          "------------------------------------------------------------------------");
      Overseer.login_status = "user-not-exist";
      Overseer.is_user_valid = false;

      return false;
    } else {
      print(
          "########################## not error  but else #####################################");
      var jString = [content];

      String arr = jString.toString();
      try {

        print("//printing from service >>> ");
        if (response.statusCode != 200) {
          Overseer.login_status = "user-not-exist";
          Overseer.is_user_valid = false;

          print("login status from service " + Overseer.login_status);
        } else {
          Overseer.login_status = "verified-user";
          Overseer.is_user_valid = true;
          List collection = json.decode(arr);
          print("user login parsing start");
        //  Overseer.printWrapped("this is content data ${content}");

          List<LogInModel> _userList =
              collection.map((json) => LogInModel.fromJson(json)).toList();
          print("user login parsing end");
          Overseer.userId = _userList[0].loginUser.id;
          print("-------- user id ${Overseer.userId}");
          SharedPreferences  prefs = await SharedPreferences.getInstance();
          prefs.setInt('User_Id',Overseer.userId);
          Overseer.groupUniqueId = _userList[0].loginUser.groupUniqueId;

          Overseer.user_rule = _userList[0].loginUser.roles[0].name;
          Overseer.userName = _userList[0].loginUser.firstName + " "+  _userList[0].loginUser.lastName;


          print("login status from service else " + Overseer.login_status);
        }

      } catch (NoSuchMethodError) {
        // print("NoSuchMethodError caught  ${NoSuchMethodError}");
      }
      return true;
    }
  }
}
