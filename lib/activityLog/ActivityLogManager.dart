import 'dart:async';
import 'package:rxdart/rxdart.dart';
import 'ActivityLog.dart';
import 'ActivityLogService.dart';

class ActivityManager {
  final BehaviorSubject<List<ActivityLogModel>> _main =
      BehaviorSubject<List<ActivityLogModel>>();

  Stream<List<ActivityLogModel>> get mainList async* {
    yield await AcivityService.browse();
  }

  ActivityManager() {
    print("-- getting data from stream");
    mainList.listen((value) => _main.addStream(mainList));
  }
}
