import 'package:flutter/material.dart';
import 'package:stw/timeservice.dart';
import 'package:provider/provider.dart';
import 'package:stw/utils.dart';

class TimeController extends StatefulWidget {
  const TimeController({super.key});

  @override
  State<TimeController> createState() => _TimeControllerState();
}

class _TimeControllerState extends State<TimeController> {
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<TimerService>(context);
    return Container(
      width: 100,
      height: 100,
      decoration: BoxDecoration(
        color: Colors.black,
        shape: BoxShape.circle,
      ),
      child: Center(
        child: IconButton(
          onPressed: () {
            if (provider.timerPlaying) {
              Provider.of<TimerService>(context, listen: false).stop();
              showDialog(
                context: context,
                builder: (context) => AlertDialog(
                  alignment: Alignment.center,
                  title: Text(
                    "Reading result",
                    style: textStyle(22),
                  ),
                  content: Text(
                    provider.stopTime > 5
                        ? (provider.stopTime <= 10
                            ? '${provider.stopTime.round().toString()} sec (saved)'
                            : '${provider.stopTime.round().toString()} min (saved)')
                        : 'result not saved (less than 5 minutes)',
                    // provider.stopTime <= 60
                    //     ? '${provider.stopTime.round().toString()} sec'
                    //     : '${provider.stopTime.round().toString()} min',
                    style: textStyle(18),
                  ),
                  actions: [
                    TextButton(
                        onPressed: () => Navigator.pop(context),
                        child: Text(
                          'View Stat.',
                          style: textStyle(16),
                        )),
                    TextButton(
                        onPressed: () => Navigator.pop(context),
                        child: Text(
                          'Close',
                          style: textStyle(16),
                        )),
                  ],
                ),
              );
              Provider.of<TimerService>(context, listen: false).reset();
            } else {
              Provider.of<TimerService>(context, listen: false).start();
            }
          },
          icon: provider.timerPlaying
              ? Icon(Icons.stop)
              : Icon(Icons.play_arrow_sharp),
          color: Colors.white,
          iconSize: 55,
        ),
      ),
    );
  }
}
