import 'package:shared_preferences/shared_preferences.dart';

class Date {
  DateTime now = DateTime.now();
  int day = 200;

  void incrementDay() async {
    final prefs = await SharedPreferences.getInstance();
    day = (prefs.setInt('day', now.day) as int);
  }

  void readDay() async {
    final prefs = await SharedPreferences.getInstance();
    day = (prefs.getInt('day'))!;
  }
}