import 'package:flutter/material.dart';

class SingletonScaffold {
  static final SingletonScaffold _singleton = SingletonScaffold._internal();
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  bool isBuyButtonActive = true;

  openEndDrawer() => scaffoldKey.currentState!.openEndDrawer();

  bool get isEndrawerOpen {
    if (scaffoldKey.currentState == null) {
      return false;
    }
    return scaffoldKey.currentState!.isEndDrawerOpen;
  }

  factory SingletonScaffold() {
    return _singleton;
  }

  SingletonScaffold._internal();
}
