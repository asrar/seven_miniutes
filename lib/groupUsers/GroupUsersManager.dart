import 'dart:async';
import 'package:rxdart/rxdart.dart';
import 'GroupUsersService.dart';
import 'UsersGroupModel.dart';
class GroupUsersManager {
  final BehaviorSubject<List<UsersGroupModel>> _main =
      BehaviorSubject<List<UsersGroupModel>>();
  Stream<List<UsersGroupModel>> get mainList async* {
    yield await GroupUsersService.browse();
  }

  PItemManager() {
    print("-- getting data from stream");
    mainList.listen((value) => _main.addStream(mainList));
  }
}
