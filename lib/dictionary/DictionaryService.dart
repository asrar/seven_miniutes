import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;

class DictionaryService {
  static Future<bool> browse() async {
    print("dictionary loading");
    http.Response response;

    response = await http.post(

        /// get the data
        Uri.parse("http://7minapp.s3bits.com/api/dictionry"),
        headers: {
          'Access-Control-Allow-Origin': '*',
          'Accept': 'application/json',
          'Authorization':
              'Bearer dKz99vl2FrdIpccgb1GUbXcNgfzpqvLrEg6gs5EscioQzy2iwdezfWEuLUY3',
        });

    print("got the response");
    String content = response.body;
    var jString = [content];
    if (response.statusCode == 200) {
      String arr = jString.toString();
      List collection = json.decode(arr);
      print("start the dictionary json sevice");
      // List<DictionaryModel> dictionaryValues =
      // collection.map((json) => DictionaryModel.fromJson(json)).toList();
      print("end the dictionary json sevice");
      //Todo: Free trial
      return true;
    } else {
      return false;
    }
  }
}
