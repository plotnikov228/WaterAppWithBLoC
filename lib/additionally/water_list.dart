import 'package:shared_preferences/shared_preferences.dart';

class WaterList {
  double waterSlot = 0.2;
  List<String> waterSlots = <String>[];
  int numberOfCells = 4;

  void fillingList() {
    if (waterSlots.isNotEmpty) {
      waterSlots = [];
    }
    for (int i = 0; i < numberOfCells; i++) {
      waterSlots.add(waterSlot.toString());
    }
    incrementWater();
  }

  void cells(int weight) {
    double liters;
    numberOfCells = 0;
    liters = 1.5 + ((weight - 20.0) * 0.02);
    while (liters >= waterSlot) {
      liters = liters - waterSlot;
      numberOfCells++;
    }
  }

  void incrementWater() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setStringList('slot', waterSlots);
    waterSlots = (prefs.getStringList('slot'))!;
  }

  void readWater() async {
    final prefs = await SharedPreferences.getInstance();
    waterSlots = (prefs.getStringList('slot'))!;
  }
}

class WaterAppBar {
  double sum = 0;
  double maxWater = 0;
  String appbarWater = '';

  void calculateAppbar(List waterSlots, double waterSlot, int numberOfCells) {
    sum = 0;
    maxWater = 0;
    for (int i = 0; i < waterSlots.length; i++) {
      sum = sum + waterSlot;
    }
    for (int i = 0; i < numberOfCells; i++) {
      maxWater = maxWater + waterSlot;
    }
    fixingSum();
    fixingMaxWater();
    if (sum != 0) {
      appbarWater =
      'Осталось выпить = $sum / $maxWater';
    } else {
      appbarWater = 'Вы всё выпили!';
    }
  }

  void fixingSum() {
    if (sum == 0.2000000000000007) sum = 0.2;
    if (sum == 0.19999999999999996) sum = 0.2;
    if (sum == 0.39999999999999997) sum = 0.4;
    if (sum == 0.4000000000000001) sum = 0.4;
    if (sum == 0.6000000000000001) sum = 0.6;
    if (sum == 0.8000000000000003) sum = 0.8;
    if (sum == 1.0000000000000002) sum = 1;
    if (sum == 1.2000000000000002) sum = 1.2;
    if (sum == 1.4000000000000001) sum = 1.4;
    if (sum == 1.5999999999999999) sum = 1.6;
    if (sum == 1.7999999999999998) sum = 1.8;
    if (sum == 1.9999999999999998) sum = 2;
    if (sum == 2.1999999999999997) sum = 2.2;
  }

  void fixingMaxWater() {
    if (maxWater == 0.2000000000000007) maxWater = 0.2;
    if (maxWater == 0.19999999999999996) maxWater = 0.2;
    if (maxWater == 0.39999999999999997) maxWater = 0.4;
    if (maxWater == 0.4000000000000001) maxWater = 0.4;
    if (maxWater == 0.6000000000000001) maxWater = 0.6;
    if (maxWater == 0.8000000000000003) maxWater = 0.8;
    if (maxWater == 1.0000000000000002) maxWater = 1;
    if (maxWater == 1.2000000000000002) maxWater = 1.2;
    if (maxWater == 1.4000000000000001) maxWater = 1.4;
    if (maxWater == 1.7999999999999998) maxWater = 1.8;
    if (maxWater == 1.9999999999999998) maxWater = 2;
    if (maxWater == 2.1999999999999997) maxWater = 2.2;
  }
}
