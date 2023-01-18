import 'package:flutter/material.dart';
import 'package:stw/time_service.dart';
import 'package:stw/utils.dart';
import 'package:provider/provider.dart';

class DisplayTimer extends StatefulWidget {
  const DisplayTimer({super.key});

  @override
  State<DisplayTimer> createState() => _DisplayTimerState();
}

class _DisplayTimerState extends State<DisplayTimer> {
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<TimerService>(context);

    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              width: MediaQuery.of(context).size.width / 4,
              height: 170,
              child: Center(
                child: Text(
                  Provider.of<TimerService>(context, listen: false)
                      .changeHoursUnit(provider.startTime),
                  style: textStyle(30, Colors.black, FontWeight.bold),
                ),
              ),
            ),
            const SizedBox(
              width: 10,
            ),
            Text(
              ":",
              style: textStyle(30, Colors.black, FontWeight.bold),
            ),
            const SizedBox(
              width: 10,
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width / 4,
              height: 170,
              child: Center(
                child: Text(
                  Provider.of<TimerService>(context, listen: false)
                      .changeMinutesUnit(provider.startTime),
                  style: textStyle(30, Colors.black, FontWeight.bold),
                ),
              ),
            ),
            const SizedBox(
              width: 5,
            ),
            Text(
              ":",
              style: textStyle(30, Colors.black, FontWeight.bold),
            ),
            const SizedBox(
              width: 5,
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width / 4,
              height: 170,
              child: Center(
                child: Text(
                  Provider.of<TimerService>(context, listen: false)
                      .changeSecondsUnit(provider.startTime),
                  style: textStyle(30, Colors.black, FontWeight.bold),
                ),
              ),
            ),
          ],
        )
      ],
    );
  }
}
