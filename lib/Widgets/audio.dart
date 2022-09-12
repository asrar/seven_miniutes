import 'package:flutter/material.dart';
// import 'package:audioplayers/audioplayers.dart';

class Audio extends StatefulWidget {
  @override
  _AudioState createState() => _AudioState();
}

class _AudioState extends State<Audio> {
  // AudioPlayer audioPlayer = new AudioPlayer();
  Duration duration = new Duration();
  Duration position = new Duration();

  bool playing = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.green[50],
          borderRadius: BorderRadius.all(Radius.circular(10))),
      padding: EdgeInsets.only(right: 10, top: 5, bottom: 5),
      margin: EdgeInsets.only(top: 10),
      width: MediaQuery.of(context).size.width,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        // crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // Container(width: 300, child: slider()),
              // InkWell(
              //   onTap: () {
              //     getAudio();
              //   },
              //   child: Icon(
              //     playing == false
              //         ? Icons.play_circle_outline
              //         : Icons.pause_circle_outline,
              //     size: 40,
              //     color: Colors.green,
              //   ),
              // )
              // Text('0:00')
              Padding(
                padding: EdgeInsets.only(right: 10, bottom: 5),
                child: Text('0:00'),
              )
            ],
          ),

        ],
      ),
    );
  }

  // Widget slider() {
  //   return Slider.adaptive(
  //       min: 0.0,
  //       value: position.inSeconds.toDouble(),
  //       max: duration.inSeconds.toDouble(),
  //       onChanged: (double value) {
  //         setState(() {
  //           audioPlayer.seek(new Duration(seconds: value.toInt()));
  //         });
  //       });
  // }

  // void getAudio() async {
  //   var url = "http://welldoneapps.net/tone.mp3";
  //
  //   // playing is pause  bu default
  //
  //   if (playing) {
  //     // Pause song
  //
  //     var res = await audioPlayer.pause();
  //     if (res == 1) {
  //       setState(() {
  //         playing = false;
  //       });
  //     }
  //   } else {
  //     // Play song
  //
  //     var res = await audioPlayer.play(url, isLocal: false);
  //     if (res == 1) {
  //       setState(() {
  //         playing = true;
  //       });
  //     }
  //   }
  //
  //   audioPlayer.onDurationChanged.listen((Duration dd) {
  //     setState(() {
  //       duration = dd;
  //     });
  //   });
  //
  //   audioPlayer.onAudioPositionChanged.listen((Duration dd) {
  //     setState(() {
  //       position = dd;
  //     });
  //   });
  // }
}
