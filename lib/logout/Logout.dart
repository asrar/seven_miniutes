// To parse this JSON data, do
//
//     final logout = logoutFromJson(jsonString);

import 'dart:convert';

List<Logout> logoutFromJson(String str) => List<Logout>.from(json.decode(str).map((x) => Logout.fromJson(x)));

String logoutToJson(List<Logout> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Logout {
  Logout({
    required this.message,
    required this.successfull,
  });

  String message;
  int successfull;

  factory Logout.fromJson(Map<String, dynamic> json) => Logout(
    message: json["message"],
    successfull: json["successfull"],
  );

  Map<String, dynamic> toJson() => {
    "message": message,
    "successfull": successfull,
  };
}
