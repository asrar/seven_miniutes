import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:seven_minutes/ConfirmGroupRequest/ConfirmGroupRequestModel.dart';



class ConfirmGroupService {
  static Future<List<ConfirmRequestModel>> browse() async {
    http.Response response;
    response = await http.post(

        /// get the data
        Uri.parse("http://7minapp.s3bits.com/api/groupUsers?user_id=18"),
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

    String arr = jString.toString();
    List collection = json.decode(arr);

    List<ConfirmRequestModel> _mainList =
        collection.map((json) => ConfirmRequestModel.fromJson(json)).toList();
    // print(_mainList[0].msg);

    return _mainList;
  }
}
