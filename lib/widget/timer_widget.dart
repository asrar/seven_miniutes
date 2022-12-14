import 'dart:async';

import 'package:flutter/material.dart';
import 'package:seven_minutes/AppLayer/Overseer.dart';

class TimerController extends ValueNotifier<bool> {
  TimerController({bool isPlaying = false}) : super(isPlaying);

  void startTimer() => value = true;

  void stopTimer() => value = false;
}

class TimerWidget extends StatefulWidget {
  final TimerController controller;
 // final Function() notifyParent;
  final Function() refreshParent;
  const TimerWidget({
     //Key key,
     required this.controller,
    required this.refreshParent,
  }) : super();

  @override
  _TimerWidgetState createState() => _TimerWidgetState();
}

class _TimerWidgetState extends State<TimerWidget> {
  Duration duration = Duration();

  late Timer timer;

  @override
  void initState() {
    super.initState();

    widget.controller.addListener(() {
      if (widget.controller.value) {
        startTimer();
      } else {
        stopTimer();
      }
    });
  }

  void reset() => setState(() => duration = Duration());

  void addTime() {
    final addSeconds = 1;

    setState(() {
      final seconds = duration.inSeconds + addSeconds;
      if(seconds == 420 ){
        timer?.cancel();



        Overseer.playtime = 420;
        print("-- time is up now 40 . jazakAllah");
      }
      print("jump to list from timer ${Overseer.scrollJumpToList}");
      print("Index to list from timer ${Overseer.dataIndexList}");
      if(Overseer.scrollJumpToList.contains(seconds)) {
      print("index of seconds ${Overseer.scrollJumpToList.indexOf(seconds)}");
       Overseer.jumpToIndex = Overseer.dataIndexList[Overseer.scrollJumpToList.indexOf(seconds)];
      print("Setting jump  ${Overseer.jumpToIndex}");
       widget.refreshParent();
      }
      if(seconds == 420 ){
        Overseer.jumpToIndex = 1000;
           timer.cancel();
        Overseer.playtime = 420;
        Overseer.playeraudio!.stopPlayer();
        print("-- time is up now at 20 jazakAllah");
        widget.refreshParent();
      }
      if (seconds < 0) {
        timer.cancel();
      } else {
        duration = Duration(seconds: seconds);
      }
    });
  }

  void startTimer({bool resets = true}) {
    print("-->>>>> timer reset @ start 1");
    if (!mounted) return;
    print("-- timer reset @ start 2");
    if (resets) {
   //   reset();
    }

    timer = Timer.periodic(Duration(seconds: 1), (_) => addTime());
  }

  void stopTimer({bool resets = true}) {
    print("-- timer reset @ Stop  1  ");
    if (!mounted) return;
    print("-- timer reset @ Stop  2  ");
    if (resets) {
    //  reset();
    }

    setState(() => timer.cancel());
  }

  @override
  Widget build(BuildContext context) => Center(child: buildTime());

  Widget buildTime() {
    String twoDigits(int n) => n.toString().padLeft(2, "0");
    final twoDigitMinutes = twoDigits(duration.inMinutes.remainder(60));
    final twoDigitSeconds = twoDigits(duration.inSeconds.remainder(60));

    return Text(
      '$twoDigitMinutes:$twoDigitSeconds',
      style: TextStyle(
        fontSize: 15,
        fontWeight: FontWeight.bold,
        color: Colors.white,
      ),
    );
  }
}
