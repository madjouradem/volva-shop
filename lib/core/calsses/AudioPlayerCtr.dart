import 'package:audioplayers/audioplayers.dart';
import 'package:get/get.dart';

class AudioPlayerCtr extends GetxController {
  AudioPlayerCtr(this.path, {isLocal});

  final audioPlayer = AudioPlayer();
  bool isPlaying = false;
  Duration duration = Duration.zero;
  Duration position = Duration.zero;
  String path = '';
  final bool isLocal = false;

  @override
  void onInit() {
    super.onInit();

    setAudio();

    audioPlayer.onPlayerStateChanged.listen((event) {
      isPlaying = event == PlayerState.playing;
      update();
    });

    audioPlayer.onDurationChanged.listen((event) {
      duration = event;
      update();
    });

    audioPlayer.onPositionChanged.listen((event) {
      position = event;
      update();
    });
  }

  String formatTime(Duration duration) {
    String twoDigits(int n) => n.toString().padLeft(2, '0');
    final hours = twoDigits(duration.inHours);
    final minutes = twoDigits(duration.inMinutes.remainder(60));
    final seconds = twoDigits(duration.inSeconds.remainder(60));
    return [
      if (duration.inHours > 0) hours,
      minutes,
      seconds,
    ].join(':');
  }

  setAudio() async {
    await audioPlayer.setSourceUrl(path);
  }

  @override
  void dispose() {
    print('On Disposes');
    super.dispose();
    audioPlayer.dispose();
  }
}
