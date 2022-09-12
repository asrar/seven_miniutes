import 'dart:async';
import 'package:email_validator/email_validator.dart';

mixin Myvalidation {
  static bool isEmail(String email) =>
      EmailValidator.validate(email); //email.contains('@');

  static bool isPasswordValidLength(String password) => password.length >= 4;

  static bool hasVlaue(bool password) => true;

  final validateEmail =
      StreamTransformer<String, String>.fromHandlers(handleData: (value, sink) {
    if (isEmail(value)) {
      print("getting text");
      sink.add(value);
    } else {
      print("getting text");

      sink.addError("email id is not valid");
    }
  });

  final passwordLength =
      StreamTransformer<String, String>.fromHandlers(handleData: (value, sink) {
    if (isPasswordValidLength(value)) {
      sink.add(value);
    } else {
      print("password length > $value");

      sink.addError("Password must be of 10 characters or higher");
    }
  });

  final hasValue =
      StreamTransformer<bool, bool>.fromHandlers(handleData: (value, sink) {
    if (hasVlaue(value)) {
      sink.add(value);
    } else {
      sink.addError("Please select a role");
    }
  });
}
