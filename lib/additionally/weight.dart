import 'package:shared_preferences/shared_preferences.dart';

class Weight {
  final List<int> weightList = [40,45,50,55,60,65,70,75];
  int selectedWeight = 50;

  void incrementWeight() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setInt('weight', selectedWeight);
    selectedWeight = (prefs.getInt('weight'))!;
  }

  void readWeight() async {
    final prefs = await SharedPreferences.getInstance();
    selectedWeight = (prefs.getInt('weight'))!;
  }
}