import 'dart:async';

import 'package:flutter/material.dart';
import 'package:stw/utils.dart';

class TimerService extends ChangeNotifier {
  int startTime = 0;
  int seconds = 0;
  int minutes = 0;
  int stopTime = 0;
  bool timerPlaying = false;
  String twoDigits(int n) => n.round().toString().padLeft(2, '0');
  Timer? timer;

  void start() {
    timerPlaying = true;
    timer = Timer.periodic(Duration(seconds: 1), (timer) {
      // if (startTime == 10) {
      //   stop();
      // } else {
      //   startTime++;
      //   notifyListeners();
      // }
      startTime++;
      upperbound();
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

  void upperbound() {
    if (startTime == 7200) {
      stop();
      reset();
    }
  }

  Widget? changesecondsunit() {
    seconds = startTime % 60;

    if (seconds == 0) {
      return Text(
        "${seconds.round()}0",
        style: textStyle(30, Colors.black, FontWeight.bold),
      );
    } else {
      return Text(
        twoDigits(seconds),
        style: textStyle(30, Colors.black, FontWeight.bold),
      );
    }
  }

  Widget? changeminutesunit() {
    minutes = startTime % 3600;

    if (minutes == 0) {
      return Text(
        "${minutes.round()}0",
        style: textStyle(30, Colors.black, FontWeight.bold),
      );
    } else {
      return Text(
        twoDigits((minutes ~/ 60)),
        style: textStyle(30, Colors.black, FontWeight.bold),
      );
    }
  }

  Widget? changehoursunit() {
    return Text(
      twoDigits((startTime ~/ 3600)),
      style: textStyle(30, Colors.black, FontWeight.bold),
    );
  }
}
