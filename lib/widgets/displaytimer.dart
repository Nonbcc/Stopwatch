import 'package:flutter/material.dart';
import 'package:stw/timeservice.dart';
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
            Container(
              width: MediaQuery.of(context).size.width / 4,
              height: 170,
              child: Center(
                child: Provider.of<TimerService>(context, listen: false)
                    .changehoursunit(),
              ),
            ),
            SizedBox(
              width: 10,
            ),
            Text(
              ":",
              style: textStyle(30, Colors.black, FontWeight.bold),
            ),
            SizedBox(
              width: 10,
            ),
            Container(
              width: MediaQuery.of(context).size.width / 4,
              height: 170,
              child: Center(
                child: Provider.of<TimerService>(context, listen: false)
                    .changeminutesunit(),
              ),
            ),
            SizedBox(
              width: 5,
            ),
            Text(
              ":",
              style: textStyle(30, Colors.black, FontWeight.bold),
            ),
            SizedBox(
              width: 5,
            ),
            Container(
              width: MediaQuery.of(context).size.width / 4,
              height: 170,
              child: Center(
                child: Provider.of<TimerService>(context, listen: false)
                    .changesecondsunit(),
              ),
            ),
          ],
        )
      ],
    );
  }
}
