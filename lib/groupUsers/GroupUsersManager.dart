import 'dart:async';
import 'package:rxdart/rxdart.dart';
import 'GroupUsersService.dart';
import 'UsersGroupModel.dart';
class GroupUsersManager {
  final BehaviorSubject<List<UsersGroupModel>> _requestId =
      BehaviorSubject<List<UsersGroupModel>>();


  final _reqId = BehaviorSubject<int>();

  Stream<List<UsersGroupModel>> get mainList async* {
    yield await GroupUsersService.browse();
  }

  Sink<int> get inReqId => _reqId.sink;

  Stream<bool> get requestAccepted$ async* {
    print("---- Sink value ${_reqId.value}");
    yield await GroupUsersService.acceptRequest(_reqId.value);
  }

  PItemManager() {
    print("-- getting data from stream");
    //mainList.listen((value) => _main.addStream(mainList));
  }
}
