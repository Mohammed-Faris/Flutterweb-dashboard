import 'package:flutter/material.dart';

import '../constants/app_constants.dart';

class TabWidget extends StatefulWidget {
  const TabWidget({super.key});

  @override
  State<TabWidget> createState() => _TabWidgetState();
}

class _TabWidgetState extends State<TabWidget> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: five.toInt(),
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              _tabSection(context),
            ],
          ),
        ),
      ),
    );
  }

  Widget _tabSection(BuildContext context) {
    return DefaultTabController(
      length: five.toInt(),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          TabBar(
            labelColor: blackcolor,
            tabs: tablist,
          ),
          SizedBox(
              height: MediaQuery.of(context).size.height * 0.35,
              child: tabbarview),
        ],
      ),
    );
  }
}
