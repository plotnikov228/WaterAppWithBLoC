import 'package:shared_preferences/shared_preferences.dart';

class WaterList {
  static double waterSlot = 0.2;
  static String waterSlotStr = '0.2';
  static List<String> waterSlots = [];
  static double sum = 0;
  static double maxWater = 0;
  static int numberOfCells = 4;
  static String appbarWater = 'appbar';

  static void calculateAppbar() {
    sum = 0;
    maxWater = 0;
    for (int i = 0; i < WaterList.waterSlots.length; i++) {
      sum = sum + waterSlot;
    }
    for (int i = 0; i < numberOfCells; i++) {
      maxWater = maxWater + waterSlot;
    }
    fixingSum();
    fixingMaxWater();
  }

  static void fillingList() {
    if (waterSlots.isNotEmpty) {
      waterSlots = [];
    }
    for (int i = 0; i < numberOfCells; i++) {
      waterSlots.add(waterSlotStr);
    }

    incrementWater();
  }

  static void fixingSum() {
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

  static void fixingMaxWater() {
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


  static void cells(int weight) {
    double liters;
    numberOfCells = 0;
    liters = 1.5 + ((weight - 20.0) * 0.02);
    while (liters >= waterSlot) {
      liters = liters - waterSlot;
      numberOfCells++;
    }
  }
  static void incrementWater() async {
    final prefs = await SharedPreferences.getInstance();
    WaterList.waterSlots =
    (prefs.setStringList('slot', WaterList.waterSlots)) as List<String>;
  }

  static void readWater() async {
    final prefs = await SharedPreferences.getInstance();
    waterSlots = (prefs.getStringList('slot'))!;
  }
}
