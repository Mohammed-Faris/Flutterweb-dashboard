import 'package:flutter/material.dart';
import 'package:web_evaluation/widgets/chart_widget.dart';
import 'package:web_evaluation/widgets/tab_widget.dart';

import '../../constants/app_constants.dart';

class ChartScreen extends StatelessWidget {
  const ChartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(five, five, five, zero),
          child: Container(
            height: MediaQuery.of(context).size.height * 0.6,
            color: Colors.white,
            child: const ChartDisplayScreen(),
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(five, five, five, zero),
            child: Container(
              color: Colors.white,
              child: Container(
                color: whitecolor,
                child: const TabWidget(),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
