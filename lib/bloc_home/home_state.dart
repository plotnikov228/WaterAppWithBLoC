
import 'package:water/additionally/date.dart';
import 'package:water/additionally/water_list.dart';

import '../additionally/weight.dart';

abstract class HomeState{}

class WaterScreenState extends HomeState{
  WaterList waterList = WaterList();
  WaterAppBar waterAppBar = WaterAppBar();
  Date date = Date();
  WaterScreenState({required this.waterList, required this.waterAppBar, required this.date});
}

class SettingsScreenState extends HomeState{
  Weight weight = Weight();
  SettingsScreenState({required this.weight});
}