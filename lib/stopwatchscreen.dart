import 'package:flutter/material.dart';
import 'package:stw/timeservice.dart';
import 'package:stw/widgets/displaytimer.dart';
import 'package:stw/widgets/timecontroller.dart';
import 'package:stw/widgets/timeresult.dart';
import 'package:provider/provider.dart';
import 'utils.dart';

class StopwatchScreen extends StatelessWidget {
  const StopwatchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          alignment: Alignment.center,
          child: Column(
            children: [
              SizedBox(
                height: 200,
              ),
              DisplayTimer(),
              SizedBox(
                height: 40,
              ),
              TimeController(),
            ],
          ),
        ),
      ),
    );
  }
}
