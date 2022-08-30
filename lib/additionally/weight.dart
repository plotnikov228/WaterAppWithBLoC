import 'package:shared_preferences/shared_preferences.dart';

class Weight {
  final List<int> weightList = [40,45,50,55,60,65,70,75];
  int selectedWeight = 50;

  void incrementWeight() async {

    final prefs = await SharedPreferences.getInstance();
    selectedWeight =
    (prefs.setInt('weight', selectedWeight)) as int;
  }

  void readWeight() async {
    final prefs = await SharedPreferences.getInstance();
    selectedWeight = (prefs.getInt('weight'))!;
  }
}