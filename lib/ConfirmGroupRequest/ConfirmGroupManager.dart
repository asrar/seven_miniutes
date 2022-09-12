import 'dart:async';
import 'package:rxdart/rxdart.dart';
import 'ConfirmGroupRequestModel.dart';
import 'ConfirmGroupService.dart';


class ConfirmGroupRequestManager {

  final BehaviorSubject<List<ConfirmRequestModel>> _main =
  BehaviorSubject<List<ConfirmRequestModel>>();

  Stream<List<ConfirmRequestModel>> get mainList async* {
    yield await ConfirmGroupService.browse();
  }
  PItemManager() {
    print("-- getting data from stream");
    mainList.listen((value) => _main.addStream(mainList));
  }


}