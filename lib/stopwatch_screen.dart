import 'package:flutter/material.dart';
import 'package:stw/widgets/description_text.dart';
import 'package:stw/widgets/displaytimer.dart';
import 'package:stw/widgets/timecontroller.dart';

class StopwatchScreen extends StatelessWidget {
  const StopwatchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          alignment: Alignment.center,
          child: Column(
            children: const [
              SizedBox(
                height: 200,
              ),
              DisplayTimer(),
              SizedBox(
                height: 5,
              ),
              TimeController(),
              SizedBox(
                height: 50,
              ),
              DescriptionText(),
            ],
          ),
        ),
      ),
    );
  }
}
