import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class DateFormatScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final f = new DateFormat('d  MMMM  y ');
    DateTime now = new DateTime.now();
    return Text(
      f.format(now),
      // '${now.day} - ${now.month} - ${now.year}',
    style: TextStyle(
      color: Colors.white,
      fontFamily: 'Comfortaa',
      fontWeight: FontWeight.w900

    ),);
  }
}
