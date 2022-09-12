import 'package:rxdart/rxdart.dart';
import 'package:seven_minutes/AppLayer/Overseer.dart';
import 'dart:async';
import 'RegisterAsAMemberService.dart';
import 'Myvalidation.dart';

class RegisterAsAMemberManager with Myvalidation {
  final _password = BehaviorSubject<String>();
  final _confirmpassword = BehaviorSubject<String>();
  final _auth = BehaviorSubject<String>();
  final _firstName = BehaviorSubject<String>();
  final _email = BehaviorSubject<String>();
  final _lastName = BehaviorSubject<String>();
  final _gender = BehaviorSubject<String>();
  final _phoneNumber = BehaviorSubject<String>();
  final _groupId = BehaviorSubject<String>();
  final _grouName = BehaviorSubject<String>();

// Todo
  Sink<String> get inEmail => _email.sink;

  Sink<String> get infirstName => _firstName.sink;

  Sink<String> get inlastName => _lastName.sink;

  Sink<String> get inPassword => _password.sink;

  Sink<String> get inConfirmPassword => _confirmpassword.sink;

  Sink<String> get inPhoneNumber => _phoneNumber.sink;

  Sink<String> get inGender => _gender.sink;

  Sink<String> get inGroupId => _groupId.sink;

  Sink<String> get inGroupName => _grouName.sink;

// Todo
  Stream<String> get firstName$ =>
      _firstName.stream.transform(firstnameValidation);

  Stream<String> get email$ => _email.stream.transform(validateEmail);

  Stream<String> get lastName$ =>
      _lastName.stream.transform(lastNameValidation);

  Stream<String> get gender$ => _gender.stream.transform(lastNameValidation);

  Stream<String> get password$ => _password.stream.transform(passwordLength);

  Stream<String> get confirmPassword$ =>
      _confirmpassword.stream.transform(confirmpassword);

  Stream<String> get phoneNumber$ => _phoneNumber.stream.transform(phoneNumber);

  Stream<String> get groupId$ => _groupId.stream.transform(groupId);

  Stream<String> get groupName$ => _grouName.stream.transform(groupName);

// Todo
  Stream<bool> get isFormSubmit$ async* {

    print("inside isUserAUTH  group Id is ${_groupId.value}");
    if (_email.value != null && _password.value != null  && _phoneNumber.value != null && _firstName.value != null && _lastName.value != null) {
      //UserProfileManager manager_user = new UserProfileManager();
      String query = "";
      if(_grouName.hasValue || _groupId.hasValue) {
        print("--- query as member");
        query =
        "email=${_email.value}&password=${_password
            .value}&first_name=${_firstName.value}&last_name=${_lastName.value}"
            "&gender=${Overseer.gender}&phone=${_phoneNumber
            .value}&group_name=test&group_unique_id=${_groupId
            .value}&gender=${_gender.value}";
      }else {
        print("--- query as user");
         query =
            "email=${_email.value}&password=${_password
            .value}&first_name=${_firstName.value}&last_name=${_lastName.value}"
            "&gender=${Overseer.gender}&phone=${_phoneNumber
            .value}";
      }
      // && Overseer.gender != null

      print('query to register  >>> ${query}');

      yield await RegisterAsAMemberService.browse(query);
    }
  }

  Stream<bool> get isFormValid$ => CombineLatestStream(
      [email$, password$, firstName$, lastName$,phoneNumber$], (values) => true);

  Stream<String> get login_status$ async* {
    yield await Overseer.login_status;
  }

  Stream<bool> get isUserAuth$ async* {
    print("inside isUserAUTH  ");
    //UserProfileManager manager_user = new UserProfileManager();
    String query = "email=${_email.value}&password=${_password.value}";

    print('query is this ${query}');
  }
}
