import 'package:flutter/material.dart';
import 'package:stw/time_service.dart';
import 'package:provider/provider.dart';
import 'package:stw/utils.dart';

class DescriptionText extends StatelessWidget {
  const DescriptionText({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<TimerService>(context);
    return SizedBox(
      height: 50,
      width: 250,
      child: Column(
        children: [
          if (provider.timerPlaying) ...[
            const Text(''),
          ] else ...[
            Text(
              'The maximum for Stopwatch is 2 hours, and you need at least 5 minutes of timer to save data.',
              style: textStyle(12, Colors.black),
            ),
          ]
        ],
      ),
    );
  }
}
