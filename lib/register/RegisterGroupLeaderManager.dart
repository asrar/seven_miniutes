import 'package:rxdart/rxdart.dart';
import 'package:seven_minutes/AppLayer/Overseer.dart';
import 'dart:async';
import 'RegisterGroudLeaderService.dart';
import 'Myvalidation.dart';

class RegisterGroupLeaderManager with Myvalidation {
  final _password = BehaviorSubject<String>();
  final _confirmpassword = BehaviorSubject<String>();
  final _auth = BehaviorSubject<String>();
  final _firstName = BehaviorSubject<String>();
  final _email = BehaviorSubject<String>();
  final _lastName = BehaviorSubject<String>();
  final _gender = BehaviorSubject<String>();
  final _phoneNumber = BehaviorSubject<String>();
  final _grouId = BehaviorSubject<String>();
  final _grouName = BehaviorSubject<String>();

// Todo
  Sink<String> get inEmail => _email.sink;

  Sink<String> get infirstName => _firstName.sink;

  Sink<String> get inlastName => _lastName.sink;

  Sink<String> get inPassword => _password.sink;

  Sink<String> get inConfirmPassword => _confirmpassword.sink;

  Sink<String> get inPhoneNumber => _phoneNumber.sink;

  Sink<String> get inGender => _gender.sink;

  Sink<String> get inGroupId => _grouId.sink;

  Sink<String> get inGroupName => _grouName.sink;

// Todo
  Stream<String> get firstName$ => _firstName.stream.transform(firstnameValidation);

  Stream<String> get email$ => _email.stream.transform(validateEmail);

  Stream<String> get lastName$ => _lastName.stream.transform(lastNameValidation);

  Stream<String> get gender$ => _gender.stream.transform(lastNameValidation);

  Stream<String> get password$ => _password.stream.transform(passwordLength);

  Stream<String> get confirmPassword$ => _confirmpassword.stream.transform(confirmpassword);

  Stream<String> get phoneNumber$ => _phoneNumber.stream.transform(phoneNumber);

  Stream<String> get groupId$ => _grouId.stream.transform(groupId);

  Stream<String> get groupName$ => _grouName.stream.transform(groupName);

// Todo
  Stream<bool> get isFormSubmit$ async* {
    print("inside combine latest stream");
    CombineLatestStream([
      email$,
      password$,
      firstName$,
      lastName$,
      groupId$,
      groupName$,
      phoneNumber$,
      // gender$,
    ], (values) => true);
    print("inside isUserAUTH  1 leader");
    // if (_email.value != null && _password.value != null) {
    print("user is real");
    //UserProfileManager manager_user = new UserProfileManager();
    String query =
        "first_name=${Overseer.firstName}&last_name=${Overseer.lastName}&email=${Overseer.email}&password=${Overseer.password}&phone=${Overseer.phoneNumber}&group_name=${Overseer.groupName}&group_unique_id=${Overseer.groupId}&gender=${Overseer.gender}";
    print('query is this from new stream leader ${query}');

    yield await RegisterGroupLeaderService.browse(query);
    // }
  }

  Stream<bool> get isFormValid$ => CombineLatestStream([
        email$,
        password$,
        firstName$,
        lastName$,
        phoneNumber$,
        groupName$,
        groupId$,
        // gender$
      ], (values) => true);

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
