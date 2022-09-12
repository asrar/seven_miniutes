//Copyright (C) 2019 Potix Corporation. All Rights Reserved.
//History: Tue Apr 24 09:29 CST 2019
// Author: Jerry Chen

import 'dart:math' as math;

import 'package:flutter/material.dart';
//import 'package:scroll_to_index/scroll_to_index.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Scroll To Index Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Scroll To Index Demo'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({required this.title}) : super();

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final scrollDirection = Axis.vertical;
  var rnd = math.Random();
  int min = 50;
  int max = 200;
  //AutoScrollController controller;
  @override
  void initState() {
    super.initState();
    // controller = AutoScrollController(
    //     viewportBoundaryGetter: () =>
    //         Rect.fromLTRB(0, 0, 0, MediaQuery.of(context).padding.bottom),
    //     axis: scrollDirection);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: ListView.builder(
        scrollDirection: scrollDirection,
       // controller: controller,
        itemBuilder: (context, i) => Padding(
          padding: EdgeInsets.all(8),
          //child: _getRow(i, (min + rnd.nextInt(max - min)).toDouble()),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _scrollToIndex,
        tooltip: 'Increment',
        child: Text(counter.toString()),
      ),
    );
  }

  int counter = -1;
  Future _scrollToIndex() async {
    setState(() {
      counter++;
    });

    // await controller.scrollToIndex(counter,
    //     preferPosition: AutoScrollPosition.begin);
    // controller.highlight(counter);
  }

  // Widget _getRow(int index, double height) {
  //   return _wrapScrollTag(
  //       index: index,
  //       child: Container(
  //         padding: EdgeInsets.all(8),
  //         alignment: Alignment.topCenter,
  //         height: height,
  //         decoration: BoxDecoration(
  //             border: Border.all(color: Colors.lightBlue, width: 4),
  //             borderRadius: BorderRadius.circular(12)),
  //         child: Text('index: $index, height: $height'),
  //       ));
  // }

  // Widget _wrapScrollTag({int index, Widget child}) => AutoScrollTag(
  //   key: ValueKey(index),
  //   controller: controller,
  //   index: index,
  //   child: child,
  //   highlightColor: Colors.black.withOpacity(0.1),
  // );
}