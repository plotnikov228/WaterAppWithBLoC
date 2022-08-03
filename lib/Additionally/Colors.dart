import 'package:flutter/material.dart';

class ColorsForApp {
  static Color backgroundColor = Colors.white;
  static Color appbarBackgroundColor = Colors.white;
  static Color objectColor = Colors.lightBlueAccent;
  static Color secondObjectColor = Colors.cyanAccent;

  static Color backgroundColorDay = Colors.white;
  static Color appbarBackgroundColorDay = Colors.white;
  static Color objectColorDay = Colors.lightBlueAccent;
  static Color secondObjectColorDay = Colors.cyanAccent;

  static Color backgroundColorNight = const Color(0xff101010);
  static Color appbarBackgroundColorNight = const Color(0xff1a1a1a);
  static Color objectColorNight = Colors.white;
  static Color secondObjectColorNight = Colors.white60;

  static bool theme = false;

  static void changeColorsOnNightTheme () {
    backgroundColor = backgroundColorNight;
    appbarBackgroundColor = appbarBackgroundColorNight;
    objectColor = objectColorNight;
    secondObjectColor = secondObjectColorNight;
  }

  static void changeColorsOnDayTheme ( ){
    backgroundColor = backgroundColorDay;
    appbarBackgroundColor = appbarBackgroundColorDay;
    objectColor = objectColorDay;
    secondObjectColor = secondObjectColorDay;
  }
}