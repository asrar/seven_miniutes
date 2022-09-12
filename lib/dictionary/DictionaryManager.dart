import 'dart:async';
import 'package:rxdart/rxdart.dart';

import 'DictionaryService.dart';

class DictionaryManager {
  final BehaviorSubject<bool> _main =
  BehaviorSubject<bool>();

  Stream<bool> get dictionaryValues async* {
    yield await DictionaryService.browse();
  }

  DictionaryManager() {
    print("-- getting data from stream");
    dictionaryValues.listen((value) => _main.addStream(dictionaryValues));
  }
}
