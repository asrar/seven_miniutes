import 'package:seven_minutes/oneDayOneRaku/logsview.dart';
import 'package:seven_minutes/oneDayOneRaku/GetMTStockModel.dart';
import 'package:rxdart/rxdart.dart';
import 'package:flutter/material.dart';
import 'package:seven_minutes/AppLayer/Overseer.dart';
import 'dart:async';
import 'package:seven_minutes/oneDayOneRaku/GetMTStockService.dart';

class GetMTStockManager  {

  Stream<bool> get myList async* {
   print("CALLING MANAGER FOR ADMIN");
    yield await GetMTStockService.getData();
  }
  Stream<List<AdminMaterails>> get myAdminMaterialList async* {
    GetMTStockService.getData();
    yield List<AdminMaterails>.empty();
  }

}

