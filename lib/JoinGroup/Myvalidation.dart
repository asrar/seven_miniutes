import 'dart:async';

import 'package:email_validator/email_validator.dart';

mixin Myvalidation {

  static bool isEmail(String email) => EmailValidator.validate(email);

  static bool isFirstName(String firstname) => firstname.isNotEmpty;

  static bool isGender(String gender) => gender.isNotEmpty;

  static bool isLastName(String lastname) => lastname.isNotEmpty;

  static bool isPasswordValidLength(String password) => password.length >= 4;

  static bool isConfirmPasswordValidLength(String confirmPassword) =>
      confirmPassword.length >= 4;

  static bool isPhoneNumberLength(String phoneNumber) => phoneNumber.length >= 9;

  static bool isGroupIdLength(String groupId) => groupId.length >= 4;

  static bool isGroupNameLength(String groupName) => groupName.length >= 4;

  final validateEmail =
      StreamTransformer<String, String>.fromHandlers(handleData: (value, sink) {
    if (isEmail(value)) {
      print("getting text $value 1");
      sink.add(value);
    } else {
      print("getting error text $value 2");
      // sink.add("");
      sink.addError("Invalid email address");
    }
  });

  final passwordLength =
      StreamTransformer<String, String>.fromHandlers(handleData: (value, sink) {
    if (isPasswordValidLength(value)) {
      sink.add(value);
    } else {
      sink.addError("Password must be of 4 characters");
    }
  });
  final confirmpassword =
      StreamTransformer<String, String>.fromHandlers(handleData: (value, sink) {
    if (isConfirmPasswordValidLength(value)) {
      sink.add(value);
    } else {
      sink.addError("C_Password must be of 4 characters");
    }
  });
  final phoneNumber =
      StreamTransformer<String, String>.fromHandlers(handleData: (value, sink) {
    if (isPhoneNumberLength(value)) {
      sink.add(value);
    } else {
      sink.addError("Phone number must be > 4 characters");
    }
  });
  final groupId =
      StreamTransformer<String, String>.fromHandlers(handleData: (value, sink) {
    if (isGroupIdLength(value)) {
      sink.add(value);
    } else {
      sink.addError("Group ID must be > 4 characters");
    }
  });
  final groupName =
      StreamTransformer<String, String>.fromHandlers(handleData: (value, sink) {
    if (isGroupNameLength(value)) {
      sink.add(value);
    } else {
      sink.addError("Group Name must be > 5 word");
    }
  });

  final firstnameValidation =
      StreamTransformer<String, String>.fromHandlers(handleData: (value, sink) {
    if (isFirstName(value)) {
      sink.add(value);
    } else {
      sink.addError("First Name Should not Empty");
    }
  });
  final genderValidation =
      StreamTransformer<String, String>.fromHandlers(handleData: (value, sink) {
    if (isGender(value)) {
      sink.add(value);
    } else {
      sink.addError("First Name Should not Empty");
    }
  });

  final lastNameValidation =
      StreamTransformer<String, String>.fromHandlers(handleData: (value, sink) {
    if (isLastName(value)) {
      sink.add(value);
    } else {
      sink.addError("Last Name Should not Empty");
    }
  });
}
