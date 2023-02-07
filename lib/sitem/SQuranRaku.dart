//import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:seven_minutes/AppLayer/Overseer.dart';
import 'package:seven_minutes/JoinGroup/JoinGroup.dart';
import 'package:seven_minutes/audio.dart';
import 'package:seven_minutes/bottom_tabbed.dart';
import 'package:seven_minutes/model_images.dart';
import 'package:seven_minutes/qitem/Quran_Layout.dart';
import 'package:seven_minutes/tabbar_layout.dart';
import 'package:seven_minutes/AppLayer/Provider.dart';
import 'package:seven_minutes/AppLayer/Observer.dart';
import 'package:seven_minutes/qitem/GetPostsManager.dart';
import 'package:seven_minutes/qitem/GetPosts.dart';
import 'dart:async';
import 'package:seven_minutes/api/sound_player.dart';
import 'package:seven_minutes/widget/timer_widget.dart';
import 'package:avatar_glow/avatar_glow.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';
import '../DateFormatScreen.dart';

class SQuranRaku extends StatefulWidget {
  @override
  _SQuranRakuState createState() => _SQuranRakuState();
}

class _SQuranRakuState extends State<SQuranRaku> {
  //  AudioPlayer audioPlayer = new AudioPlayer();

  Duration duration  = new Duration();
  Duration position = new Duration();

  // poistioned Scroll
  final ItemPositionsListener itemPositionsListener =
  ItemPositionsListener.create();

  final ItemScrollController itemScrollController = ItemScrollController();

  int topicId =0;
  bool playing = false;
  bool playingAtFirst = true;
  final timerController =   TimerController(); // take to 7Min App
  final player = SoundPlayer(); // take to 7 Min App
  ScrollController _scrollController = ScrollController();
  final imagePlayMap = {1:20,2:30,1:20,2:30,1:20,2:30,};


  // _scrollToBottom() {
  //   _scrollController.jumpTo(_scrollController.position.maxScrollExtent);
  // }

  @override
  void initState() {
    super.initState();

    player.init(); // take to 7Min App
  }

  @override
  void dispose() {
    // player.dispose(); // take to 7 Min app
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    GetPostsManager manager = Provider.of(context).fetch(GetPostsManager);
    Overseer.iS_oneRakuScreen = true;
    Overseer.isLoadingDone = true;
    // WidgetsBinding.instance.addPostFrameCallback((_) => _scrollToBottom());
    Overseer.cat_id = "1";

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



          // Audio(),
          Expanded(
            child: Observer<List<GetPosts>>(
              stream: manager.productList,
              onSuccess: (context, data) {
                // snapshot.data ?? 0;
                Overseer.quranAactivePostList = data;
                List<GetPosts> _productList = data;
                print("printing from list tile");
                GetPosts _post1 = _productList[0];

                topicId = _post1.iid;
                Overseer.audio_file =  _post1.qitem;
                Overseer.topicId = _post1.iid.toString();
                imagePlayMap.clear();

                for(int i=0;i<_productList[0].SevenImages1.length; i++) {
                  imagePlayMap.addIf(_post1.SevenImages1[i].imgPlay!=null , i, _post1.SevenImages1[i].imgPlay);

                }

                print("-- map of ImagePlay ${imagePlayMap}");
                Overseer.dataIndexList = imagePlayMap.keys.toList();
                Overseer.scrollJumpToList  = imagePlayMap.values.toList();
                return ScrollablePositionedList.builder(
                  // for Auto-scrolling binding controller in build method
                  //  controller: _scrollController,
                  //  reverse: true,
                    shrinkWrap: true,
                    initialScrollIndex: 0,
                    itemPositionsListener: itemPositionsListener,
                    itemScrollController: itemScrollController,

                    addAutomaticKeepAlives: true,
                    scrollDirection: Axis.vertical,
                    itemCount: _productList[0].SevenImages1.length,
                    itemBuilder: (BuildContext context, int index) {
                      print("printing from list tile");
                      GetPosts _post = _productList[0];

                      Overseer.isLoadingDone = false;
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


        ],
      ),
    );
  }
  void getThanks(){

    setState(() {
      print("AKS .. AKS AKS");
    });

    return
      print("jazakAllah AKS");
  }
  // Play button
  Widget buildPlay() {
    final isPlaying = player.isPlaying;
    final Function() notifyParent;
    print(" real playing status at start ${player.isPlaying}");
    final icon = isPlaying && Overseer.playtime != 420 ? Icons.pause : Icons.play_arrow;
    final text = isPlaying && Overseer.playtime != 420 ? 'Pause' : 'Play';




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
            TimerWidget(controller: timerController,refreshParent: refresh),
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

  Widget imageContainer({required String imgPath}) {
    return Container(
      child: Image.network(
        imgPath,
        fit: BoxFit.fill,

      ),
    );
  }

  refresh() {
    if(Overseer.jumpToIndex != 1000) {
      print("going to jump ${Overseer.jumpToIndex}");
      itemScrollController.jumpTo(index: Overseer.jumpToIndex);
    }
    else {
      setState(() {});
    }
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
