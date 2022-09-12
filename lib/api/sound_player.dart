import 'package:flutter/cupertino.dart';
import 'package:flutter_sound_lite/flutter_sound.dart';
import 'package:flutter_sound_lite/public/flutter_sound_player.dart';
import 'package:seven_minutes/AppLayer/Overseer.dart';

//final pathToReadAudio = 'audio_example.aac';

class SoundPlayer {
  late FlutterSoundPlayer _audioPlayer;

  bool get isPlaying => _audioPlayer.isPlaying;

  Future init() async {
    _audioPlayer = FlutterSoundPlayer();

    await _audioPlayer.openAudioSession();
  }

  void dispose() {
    _audioPlayer.closeAudioSession();
    //_audioPlayer = null;
  }

  Future _play(VoidCallback whenFinished) async {
    if(_audioPlayer.isPaused) {
      print("player was paused");
      await _audioPlayer.resumePlayer();

    }else {
      print("player is starting now");
      await _audioPlayer.startPlayer(
        // fromURI: pathToReadAudio,
        fromURI: '${Overseer.audio_file}',
        //'https://7minapp.s3bits.com/uploads/files/fateyha.mp3',
        // https://file-examples-com.github.io/uploads/2017/11/file_example_MP3_700KB.mp3
        codec: Codec.mp3,
        // whenFinished: whenFinished,
      );

    }
    }

  Future _stop() async {
    await _audioPlayer.pausePlayer();//stopPlayer();
  }

  Future togglePlaying({ required VoidCallback whenFinished}) async {
    if (_audioPlayer.isStopped || _audioPlayer.isPaused  ) { //
      print("called play -----");
      Overseer.playeraudio = _audioPlayer;
      await _play(whenFinished);
    } else {
       print("called paused -----");
       if(Overseer.playtime == 40) {
         await _stop();
       }else {
         await _stop();
       }
    }
  }
}
