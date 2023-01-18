import 'dart:async';

import 'package:flutter/material.dart';
import 'package:stw/widgets/fulltime_popup.dart';

class TimerService extends ChangeNotifier {
  int startTime = 0;
  int seconds = 0;
  int minutes = 0;
  int stopTime = 0;
  bool timerPlaying = false;
  String twoDigits(int n) => n.round().toString().padLeft(2, '0');
  Timer? timer;
  FulltimePopup fulltimePopup = FulltimePopup();

  void start(BuildContext context) {
    timerPlaying = true;
    timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (startTime == 15) {
        stop();
        fulltimePopup.fullTimePopup(context);
        reset();
      } else {
        startTime++;
      }
      notifyListeners();
    });
  }

  void stop() {
    timer!.cancel();
    timerPlaying = false;
    print(startTime);
    stopTime = startTime;
    notifyListeners();
  }

  void reset() {
    startTime = 0;
  }

  String changeSecondsUnit(int time) {
    seconds = startTime % 60;
    if (seconds == 0) {
      return "${seconds.round()}0";
    } else {
      return twoDigits(seconds);
    }
  }

  String changeMinutesUnit(int time) {
    minutes = time % 3600;
    if (minutes == 0) {
      return "${minutes.round()}0";
    } else {
      return twoDigits((minutes ~/ 60));
    }
  }

  String changeHoursUnit(int time) {
    return twoDigits((time ~/ 3600));
  }
}
