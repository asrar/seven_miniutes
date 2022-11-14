import 'package:flutter/material.dart';
import 'package:seven_minutes/AppLayer/Overseer.dart';
import 'package:seven_minutes/DateFormatScreen.dart';
import 'package:get/get.dart';
import 'package:seven_minutes/bottom_tabbed.dart';
import 'package:seven_minutes/sitem/sunnah.dart';
import 'package:seven_minutes/tabbar_layout.dart';

import '../AppLayer/Observer.dart';
import '../AppLayer/Provider.dart';
import '../BottomNavigationBar/bottom_tabbed-old.dart';
import '../audio.dart';
import '../model_images.dart';
//import '../sitem/model_sunnah.dart';

// import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:seven_minutes/AppLayer/Overseer.dart';
import 'package:seven_minutes/audio.dart';
import 'package:seven_minutes/model_images.dart';
import 'package:seven_minutes/tabbar_layout.dart';
import 'package:seven_minutes/AppLayer/Provider.dart';
import 'package:seven_minutes/AppLayer/Observer.dart';
import 'package:seven_minutes/sitem/GetSunnahPostsManager.dart';
import 'package:seven_minutes/sitem/GetSunnahPosts.dart';
import 'dart:async';
import 'package:seven_minutes/api/sound_player.dart';
import 'package:seven_minutes/widget/timer_widget.dart';
import 'package:avatar_glow/avatar_glow.dart';


import '../DateFormatScreen.dart';
import 'Sunnah_Layout.dart';

class SunnahHomeScreen extends StatefulWidget {
  @override
  _SunnahHomeScreenState createState() => _SunnahHomeScreenState();
}

class _SunnahHomeScreenState extends State<SunnahHomeScreen> {
  // AudioPlayer audioPlayer = new AudioPlayer();

  Duration duration  = new Duration();
  Duration position = new Duration();
  bool playing = false;
  bool playingAtFirst = true;
  final timerController = TimerController(); // take to 7Min App
  final player = SoundPlayer(); // take to 7 Min App
  ScrollController _scrollController = ScrollController();

  // _scrollToBottom() {
  //   _scrollController.jumpTo(_scrollController.position.maxScrollExtent);
  // }

  @override
  void initState() {
    super.initState();

    player.init();
    //   player.init(); // take to 7Min App
  }

  @override
  void dispose() {
//    player.dispose(); // take to 7 Min app
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    GetSunnahPostsManager manager = Provider.of(context).fetch(GetSunnahPostsManager);
    // WidgetsBinding.instance.addPostFrameCallback((_) => _scrollToBottom());
    Overseer.cat_id = "2";
    return Scaffold(
      backgroundColor: Colors.white,
      // floatingActionButton: FloatingActionButton(
      //   backgroundColor: Color(0xFF3E6EA4),
      //   child: Column(
      //     children: [buildPlayer(),
      //       SizedBox(height: 10),
      //       buildPlay()],
      //   ),
      //   onPressed: () {
      //     // TODO: add the audio controls
      //
      //   //   getAudio();
      //   },
      // ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          Container(
              height: 110,
              padding: EdgeInsets.only(left: 15, top: 45, right: 15),
              color: Color(0xFF3E6EA4),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      InkWell(
                        onTap: () {
                          Get.offAll(BottomTabbed());
                        },
                        child: Container(

                          child: Icon(
                            Icons.arrow_back_ios,
                            color: Colors.white,
                          ),
                        ),
                      )
                    ],
                  ),
                  Column(
                    children: [

                      Text(
                        'Soorat Fatiha',
                        style: TextStyle(
                            color: Colors.white,
                            letterSpacing: 1,
                            fontSize: 20,
                            fontFamily: 'Comfortaa',
                            fontWeight: FontWeight.w900),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      // DateFormatScreen()
                      Container(
                        child: Text(
                          duration.inMinutes.toString(),
                          style: TextStyle(
                              fontFamily: 'Comfortaa', color: Colors.white),
                        ),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      InkWell(
                        onTap: () {
                          setState((){});
                          // Navigator.push(
                          //     context,
                          //     MaterialPageRoute(
                          //         builder: (context) => TabbarLayout()));
                        },
                        child: Container(
                          child: Icon(
                            Icons.notification_important,
                            color: Colors.white,
                            size: 30,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              )),

          // Audio(),
          Expanded(
            child: Observer<List<GetSunnahPosts>>(
              stream: manager.productList,
              onSuccess: (context, data) {
                // snapshot.data ?? 0;

                List<GetSunnahPosts> _productList = data;
                print("printing from list tile");
                GetSunnahPosts _post1 = _productList[0];
                Overseer.audio_file =  _post1.qitem;
                return ListView.builder(
                  // for Auto-scrolling binding controller in build method
                    controller: _scrollController,
                    //  reverse: true,
                    shrinkWrap: true,

                    addAutomaticKeepAlives: true,
                    scrollDirection: Axis.vertical,
                    itemCount: _productList[0].SevenImages1.length,
                    itemBuilder: (BuildContext context, int index) {
                      print("printing from list tile");
                      GetSunnahPosts _post = _productList[0];

                      return imageContainer(
                          imgPath:
                          "https://7minapp.s3bits.com/uploads/files/" +
                              _post.SevenImages1[index].image);
                    });
              },
              onWaiting: (context) {
                return Center(child: CircularProgressIndicator());
              },
              onError: (context, error) {
                print("printing error");
                print(error);
                return Center(child: Text("Please Check Internet!"));
              },
            ),
          ),
          // temporary hide the audio player by @Asrar
          Stack(

            alignment: Alignment.centerLeft,
            // alignment: Alignment.bottomRight,
            children: <Widget>[
              Overseer.playtime != 420 ?
              Align(
                alignment: Alignment.bottomLeft,
                child: buildPlayer(),
              ):SizedBox(width: 1,),
              Overseer.playtime == 420 ?
              Align(
                alignment: Alignment.bottomCenter,
                child:  Container(
                  height: Get.height * 0.050,
                  width: Get.width * 0.45,
                  decoration: BoxDecoration(
                      color: Colors.green,
                      borderRadius: BorderRadius.circular(15)),
                  child: Center(
                    child: TextButton(
                      onPressed: () {
                        print(" ALLAH is the GREATEST - AKS");
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => TabbarLayout()));
                        // Get.to(AdminProjectScreen());
                      },
                      child: Text(
                        "DONE",
                        style: TextStyle(color: Colors.black),
                      ),
                    ),
                  ),
                ),
              ) :
              Align(
                alignment: Alignment.bottomCenter,
                child: Text("JazakAllah for listening"),
              ),
              Overseer.playtime != 420 ?
              Align(
                alignment: Alignment.bottomRight,
                child: buildPlay(),
              ):SizedBox(width: 1,),
            ],
          ),
        ],
      ),
    );
  }
  void getThanks(){
    print("jazakAllah AKS");
  }
  // Play button
  Widget buildPlay() {
    final isPlaying = player.isPlaying;
    print(" real playing status at start ${player.isPlaying}");
    final icon = isPlaying ? Icons.pause : Icons.play_arrow;
    final text = isPlaying ? 'Pause' : 'Play';

    return Container(
      padding: EdgeInsets.only(right:10),
      child: ElevatedButton.icon(


        style: ElevatedButton.styleFrom(
          //  padding: EdgeInsets.only(right: 20),
          minimumSize: Size(50, 40),
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(50)),
          // shape: ShapeBorder.,
          primary: Colors.indigo.shade900.withBlue(70),
          onPrimary: Colors.white,
        ),
        icon: Icon(icon),
        label: Text(
          text,
          style: TextStyle(fontSize: 15, fontWeight: FontWeight.w800),
        ),
        onPressed: () async {
          //  if (!recorder.isRecordingAvailable) return;   // to start playing player from first on_pressed
          if(playingAtFirst){
            //  timerController.startTimer();
            //  setState(() {});
            playingAtFirst = false;
            await player.togglePlaying( whenFinished: () => getThanks());
            setState(() {
              if (player.isPlaying) {
                print("--------- start timer >>>>> ${player.isPlaying}");
                timerController.startTimer();


              } else {
                timerController.stopTimer();
                print("--------- end timer >>>>> ${player.isPlaying}");
              }
              print("screen updated on first play");
            });
          }else{
            await player.togglePlaying(whenFinished: () => getThanks());
            setState(() {
              if (player.isPlaying) {
                print("--------- start timer >>>>> ${player.isPlaying}");
                timerController.startTimer();


              } else {
                timerController.stopTimer();
                print("--------- end timer >>>>> ${player.isPlaying}");
              }
              print("yes playing is finished 2222");
            });
          }



        },
      ),
    );
  }

  Widget buildPlayer() {
    // final text = recorder.isRecording ? 'Now Recording' : 'Press Start';
    final animate = player.isPlaying;

    print("duration is  ---------------------- ${duration.inMinutes} ");
    print("position is --------------- ${ position.inMinutes}");
    if(duration.inMinutes == 2 ) {
      setState(() {
        print("real pringing is done now");
      });
    }


    return AvatarGlow(

      endRadius: 35,
      animate: animate,
      repeatPauseDuration: Duration(milliseconds: 100),
      child: CircleAvatar(
        radius: 25,

        backgroundColor: Colors.indigo.shade900.withBlue(70),
        child: player.isPlaying
            ? Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TimerWidget(controller: timerController,refreshParent: refresh,),
          ],
        )
        //Icon(Icons.audiotrack_outlined, size: 120)
            : Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TimerWidget(controller: timerController,refreshParent: refresh,),
          ],
        ),
        // ),
      ),
    );
  }

  Widget imageContainerLocal({required String imgPath}) {
    return Container(
      child: Image(
        fit: BoxFit.cover,
        image: AssetImage(imgPath),
      ),
    );
  }

  Widget imageContainer({ required String imgPath}) {
    return Container(
      child: Image.network(
        imgPath,
        fit: BoxFit.fill,
      ),
    );
  }
  refresh() {

    setState(() {});
  }
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
