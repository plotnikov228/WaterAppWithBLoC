import 'package:shared_preferences/shared_preferences.dart';

class Weight {
  static List<int> weightList = [40,45,50,55,60,65,70,75];
  static int selectedWeight = weightList[4];

  static void incrementWeight() async {

    final prefs = await SharedPreferences.getInstance();
    selectedWeight =
    (prefs.setInt('weight', selectedWeight)) as int;
  }

  static void readWeight() async {
    final prefs = await SharedPreferences.getInstance();
    selectedWeight = (prefs.getInt('weight'))!;
  }
}