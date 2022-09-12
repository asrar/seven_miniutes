import 'package:seven_minutes/AppLayer/Overseer.dart';
import 'package:seven_minutes/login/Myvalidation.dart';
import 'package:rxdart/rxdart.dart';
import 'dart:async';
import 'package:seven_minutes/login/UserService.dart';

class UserManager with Myvalidation {
  final _email = BehaviorSubject<String>();
  final _password = BehaviorSubject<String>();
  final _groupId = BehaviorSubject<String>();
  final _isMember = BehaviorSubject<bool>();
  final _isLeaderMember = BehaviorSubject<bool>();

  Stream<String> get email$ => _email.stream.transform(validateEmail);

  Sink<String> get inEmail => _email.sink;

  Stream<String> get password$ => _password.stream.transform(passwordLength);

  Sink<String> get inPassword => _password.sink;

  Stream<String> get groupid$ => _groupId.stream.transform(passwordLength);

  Sink<String> get inGroupId => _groupId.sink;

  Stream<bool> get isMember$ => _isMember.stream.transform(hasValue);

  Sink<bool> get inisMember => _isMember.sink;

  Stream<bool> get isLeaderMember$ =>
      _isLeaderMember.stream.transform(hasValue);

  Sink<bool> get inisLeaderMember => _isLeaderMember.sink;

  Stream<bool> get isFormSubmit$ async* {
    CombineLatestStream([email$, password$], (values) => true);
    print("inside isUserAUTH  1 ");
    String query =
        "email=${_email.value}&password=${_password.value}&role=${Overseer.roleName}"; //&group_unique_id=${_groupId.value}

    print('>>>>>>>> submit call <<<<<<<<<  ${query}');
    yield await UserService.browse(query);
  }
  /// Login called from button submit
  Stream<bool> get isFormValid$ =>
      CombineLatestStream([email$, password$], (values) => true);

  Stream<String> get login_status$ async* {

  }

  Stream<bool> get isValidCustomer$ async* {
    print("inside isUserAUTH  customer 2 ");
    String query = "email=${_email.value}&password=${_password.value}";
    print('on 2nd submit query ${query}');
    yield await UserService.browse(query);
  }

  Stream<bool> get isUserAuth$ async* {
    print("inside isUserAUTH  ");
    String query = "email=${_email.value}&password=${_password.value}";

    print('3rd query submit  ${query}');
  }
}
