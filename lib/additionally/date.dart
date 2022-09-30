import 'package:shared_preferences/shared_preferences.dart';

class Date {
  DateTime now = DateTime.now();
  int day = 200;

  void incrementDay() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setInt('day', now.day);
    day = (prefs.getInt('day'))!;
  }

  void readDay() async {
    final prefs = await SharedPreferences.getInstance();
    day = (prefs.getInt('day'))!;
  }
}