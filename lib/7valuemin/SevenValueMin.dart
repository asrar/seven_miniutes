import 'dart:async';

import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

class TimerScreen extends StatefulWidget {
  const TimerScreen({Key? key}) : super(key: key);

  @override
  State<TimerScreen> createState() => _TimerScreenState();
}

class _TimerScreenState extends State<TimerScreen> {
  Timer? _timer = Timer(const Duration(seconds: 0), (){});
  Timer? _timer1 = Timer(const Duration(seconds: 0), (){});
  Timer? _timer2 = Timer(const Duration(seconds: 0), (){});
  Timer? _timer3 = Timer(const Duration(seconds: 0), (){});
  Timer? _timer4 = Timer(const Duration(seconds: 0), (){});
  Timer? _timer5 = Timer(const Duration(seconds: 0), (){});
  Timer? _timer6 = Timer(const Duration(seconds: 0), (){});
  int _start = 0;
  int _start1 = 0;
  int _start2 = 0;
  int _start3 = 0;
  int _start4 = 0;
  int _start5 = 0;
  int _start6 = 0;
  List<String> weeklyDays = [
    'Monday',
    'Tuesday',
    'Wednesday',
    'Thursday',
    'Friday',
    'Saturday',
    'Monday',
  ];
  List<dynamic> percentValue = [];
  void stop(){
    if(_timer != null){
      setState(() {
        // _start = 0;
        _timer!.cancel();
        _timer1!.cancel();
        _timer2!.cancel();
        _timer3!.cancel();
        _timer4!.cancel();
        _timer5!.cancel();
        _timer6!.cancel();
      });
    }
  }
  void startTimer() {
    const oneSec = Duration(seconds: 1);
    // _start = 0;
    print("this is timer value inside if ${_start.toString()}");
    _timer = Timer.periodic(
      oneSec,
          (Timer timer) {
        if(_start < 60){
          setState(() {
            print("this is timer value ${_start.toString()}");
            percentValue.add(_start);
            _start++;
          });
        } else if(_start1 <60){
          setState(() {
            print("this is timer value ${_start1.toString()}");
            percentValue.add(_start1);
            _start1++;
          });
        }else if(_start2 <60){
          setState(() {
            print("this is timer value ${_start2.toString()}");
            percentValue.add(_start2);
            _start2++;
          });
        }else if(_start3 < 60){
          setState(() {
            print("this is timer value ${_start3.toString()}");
            percentValue.add(_start3);
            _start3++;
          });
        }else if(_start4 < 60){
          setState(() {
            print("this is timer value ${_start4.toString()}");
            percentValue.add(_start4);
            _start4++;
          });
        } else if(_start5 < 60){
          setState(() {
            print("this is timer value ${_start5.toString()}");
            percentValue.add(_start5);
            _start5++;
          });
        } else {
          if (_start6 >= 60) {
            print("timer 1 cancel ");
            setState(() {
              timer.cancel();
            });
          } else{
            setState(() {
              print("this is timer value ${_start6.toString()}");
              percentValue.add(_start6);
              _start6++;
            });
          }
        }
         // else {

        // }
        // }
      },
    );
  }
  @override
  void initState() {
    // TODO: implement initState
    startTimer();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    var timerValue = _start / 60;
    // var timerValueSecond = timerValue * 1;
    ///
    var timerValue1 = _start1 / 60;
    // var timerValueSecond1 = timerValue1 * 1;
    ///
    var timerValue2 = _start2 / 60;
    // var timerValueSecond2 = timerValue2 * 1;
    ///
    var timerValue3 = _start3 / 60;
    // var timerValueSecond3 = timerValue3 * 1;
    ///
    var timerValue4 = _start4 / 60;
    // var timerValueSecond4 = timerValue4 * 1;
    ///
    var timerValue5 = _start5 / 60;
    // var timerValueSecond5 = timerValue5 * 1;
    ///
    var timerValue6 = _start6 / 60;
    // var timerValueSecond6 = timerValue6 * 1;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(color: Colors.black),
        elevation: 0,
        title:  Text(
          "Timer ${_timer!.isActive ? "start":"startas"}",
          style: TextStyle(color: Colors.black),
        ),
        actions: [
          GestureDetector(
              onTap: () {
                _timer!.isActive ? stop() :startTimer();
              },
              child: _timer!.isActive ? Icon(Icons.stop): Icon(Icons.play_circle_fill)),
          const SizedBox(
            width: 10,
          ),

          const SizedBox(
            width: 20,
          )
        ],
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Container(
          padding: EdgeInsets.only(left: 20, right: 20, top: 10),
          width: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              ListView.builder(
                  itemCount: weeklyDays.length,
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemBuilder: ((context, index) {
                    return Container(
                      padding: EdgeInsets.symmetric(horizontal: 10),
                      margin: const EdgeInsets.only(bottom: 5,top: 5),
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: Colors.red,
                        borderRadius: BorderRadius.circular(15)
                      ),

                      height: MediaQuery.of(context).size.height*0.11,
                      child: Center(
                        child: Row(
                          children: [
                            Container(
                              width: MediaQuery.of(context).size.width*0.4,
                              child: Row(
                                children: [
                                  Text(weeklyDays[index]),
                                  SizedBox(width: MediaQuery.of(context).size.width*0.013,),
                                  Text(index == 0 ? _start.toString() : index == 1 ?  _start1.toString() : index == 2 ? _start2.toString() : index == 3 ? _start3.toString()  : index == 4 ?  _start4.toString() : index == 5 ?   _start5.toString() :  _start6.toString() ),
                                ],
                              ),
                            ),
                            Spacer(),
                            CircularPercentIndicator(
                              radius: 20.0,
                              backgroundColor: Colors.grey,
                              progressColor: Colors.blue,
                              lineWidth: 5.0,
                              percent: index == 0 ? timerValue : index == 1 ?  timerValue1 : index == 2 ? timerValue2 : index == 3 ? timerValue3  : index == 4 ?  timerValue4 : index == 5 ?  timerValue5 :  timerValue6,
                              center: Text(
                                  index == 0 ? _start.toString() : index == 1 ?  _start1.toString() : index == 2 ? _start2.toString() : index == 3 ? _start3.toString()  : index == 4 ?  _start4.toString() : index == 5 ?   _start5.toString() :  _start6.toString(),
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20.0),
                              ),
                            )
                          ],
                        ),
                      ),
                    );
                  }))
            ],
          ),
        ),
      ),
    );
  }
}
