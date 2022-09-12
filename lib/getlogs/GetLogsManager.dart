
import 'package:seven_minutes/getlogs/GetLogsModel.dart';
import 'package:rxdart/rxdart.dart';
import 'package:flutter/material.dart';
import 'package:seven_minutes/AppLayer/Overseer.dart';
import 'dart:async';
import 'package:seven_minutes/getlogs/GetLogsService.dart';

class GetLogsManager  {

  Stream<List<GetLogsModel>> get logsList async* {

    yield await GetLogsService.log();
  }


}

