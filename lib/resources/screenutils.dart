import 'package:flutter/material.dart';

class ScreenUtils extends StatefulWidget {
  const ScreenUtils({super.key});

  @override
  State<ScreenUtils> createState() => _ScreenUtilsState();
}

double screenwidth = 0.0, screenheight = 0.0;

class _ScreenUtilsState extends State<ScreenUtils> {
  @override
  Widget build(BuildContext context) {
    screenwidth = MediaQuery.of(context).size.width;
    screenheight = MediaQuery.of(context).size.height;
    return Container();
  }
}
