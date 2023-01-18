import 'package:flutter/material.dart';
import 'package:stw/time_service.dart';
import 'package:provider/provider.dart';
import 'package:stw/widgets/result_popup.dart';

class TimeController extends StatefulWidget {
  const TimeController({super.key});

  @override
  State<TimeController> createState() => _TimeControllerState();
}

class _TimeControllerState extends State<TimeController> {
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<TimerService>(context);
    ResultPopup resultPopup = ResultPopup();

    return Container(
      width: 100,
      height: 100,
      decoration: const BoxDecoration(
        color: Colors.black,
        shape: BoxShape.circle,
      ),
      child: Center(
        child: IconButton(
          onPressed: () {
            if (provider.timerPlaying) {
              Provider.of<TimerService>(context, listen: false).stop();
              resultPopup.resultPopup(context);
              Provider.of<TimerService>(context, listen: false).reset();
            } else {
              Provider.of<TimerService>(context, listen: false).start(context);
            }
          },
          icon: provider.timerPlaying
              ? const Icon(Icons.stop)
              : const Icon(Icons.play_arrow_sharp),
          color: Colors.white,
          iconSize: 55,
        ),
      ),
    );
  }
}
