import 'package:water/additionally/weight.dart';

import '../additionally/water_list.dart';

abstract class HomeState{}

class WaterScreenState extends HomeState{
  WaterList waterList = WaterList();
  Weight weight = Weight();
  WaterScreenState({required this.waterList, required this.weight});
}
class WaterScreenEmptyState extends HomeState{}
class SettingsScreenState extends HomeState{
  Weight weight = Weight();
  SettingsScreenState({required this.weight});
}