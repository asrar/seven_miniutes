import 'package:rxdart/rxdart.dart';
import 'package:seven_minutes/AppLayer/Overseer.dart';
import 'dart:async';
import 'JoinGroupService.dart';
import 'Myvalidation.dart';

class JoinGroupManager with Myvalidation {

  final _grouId = BehaviorSubject<String>();
  final _grouName = BehaviorSubject<String>();

// Todo

  Sink<String> get inGroupId => _grouId.sink;

  Sink<String> get inGroupName => _grouName.sink;


  Stream<String> get groupId$ => _grouId.stream.transform(groupId);

  Stream<String> get groupName$ => _grouName.stream.transform(groupName);

// Todo
  Stream<bool> get isFormSubmit$ async* {
    CombineLatestStream(
        [groupId$], (values) => true);
    print("inside isUserAUTH  1 >> ${_grouId.hasValue}");
    if(_grouId.hasValue) {
    if (_grouId.value != null) {
      //UserProfileManager manager_user = new UserProfileManager();
      String query = "";
      yield await JoinGroupService.browse(_grouId.value);
    }
    }else{
      print("JOINING request from register form");
      if(Overseer.joinGroupRequest) {
        Overseer.joinGroupRequest = false;
        yield await JoinGroupService.browse(Overseer.joinGroupRequestId);
      }
    }

  }

  Stream<bool> get isFormValid$ => CombineLatestStream(
      [groupId$], (values) => true);




}
