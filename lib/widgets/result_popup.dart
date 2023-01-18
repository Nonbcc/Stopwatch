import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:stw/time_service.dart';
import 'package:stw/utils.dart';

class ResultPopup {
  void resultPopup(BuildContext context) {
    final provider = Provider.of<TimerService>(context, listen: false);
    String sec = Provider.of<TimerService>(context, listen: false)
        .changeSecondsUnit(provider.stopTime);
    String min = Provider.of<TimerService>(context, listen: false)
        .changeMinutesUnit(provider.stopTime);
    String hr = Provider.of<TimerService>(context, listen: false)
        .changeHoursUnit(provider.stopTime);
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        alignment: Alignment.center,
        title: Text(
          "Reading result",
          style: textStyle(22),
        ),
        content: Row(
          children: [
            if (provider.stopTime >= 5) ...[
              Text(hr),
              const SizedBox(
                width: 5,
              ),
              const Text(
                'h',
              ),
              const SizedBox(
                width: 5,
              ),
              Text(min),
              const SizedBox(
                width: 5,
              ),
              const Text(
                'm',
              ),
              const SizedBox(
                width: 5,
              ),
              Text(sec),
              const SizedBox(
                width: 5,
              ),
              const Text(
                's',
              ),
            ] else if (provider.stopTime < 5) ...[
              const Text(
                'result not saved (less than 5 min)',
              )
            ]
          ],
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
  }
}
