import 'package:flutter/services.dart';

fullscreen(bool isFull) {
  isFull
      ? SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: [])
      : SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: [
          SystemUiOverlay.bottom,
          SystemUiOverlay.top,
        ]);
  ;

  isFull
      ? SystemChrome.setPreferredOrientations(
          [DeviceOrientation.landscapeRight])
      : SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);

  ;
}
