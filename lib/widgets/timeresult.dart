import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:stw/timeservice.dart';

import '../utils.dart';

class ShowResult extends StatelessWidget {
  const ShowResult({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<TimerService>(context);
    return Center(
      child: Container(
        alignment: Alignment.center,
        width: 320,
        height: 425,
        decoration: BoxDecoration(
          color: Color(0xFFEFD3C2),
        ),
        child: Column(children: [
          Text(
            'Reading Result',
            style: textStyle(20, Color(0xFF482311), FontWeight.bold),
          ),
          SizedBox(
            height: 30,
          ),
          Row(
            children: [
              build(context),
            ],
          ),
        ]),
      ),
    );
  }
}
