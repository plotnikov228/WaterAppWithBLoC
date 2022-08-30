import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:water/additionally/weight.dart';
import 'package:water/bloc_home/home_event.dart';
import 'package:water/bloc_home/home_state.dart';


import '../additionally/date.dart';
import '../additionally/water_list.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final WaterList waterList;
  final Weight weight;
  HomeBloc({required this.waterList, required this.weight}) : super(WaterScreenState(waterList: waterList, weight:  weight)) {
    int currentTab = 1;
    Date date = Date();

    on<WaterScreenAddEvent>((event, emit) async {
      weight.readWeight();
      waterList.cells(weight.selectedWeight);
      waterList.fillingList();
      waterList.calculateAppbar();
      date.incrementDay();
      waterList.appbarWater =
      'Осталось выпить = ${waterList.sum} / ${waterList.maxWater}';
    });

    on<WaterScreenLoadEvent>((event, emit) async {
      waterList.cells(weight.selectedWeight);
      waterList.readWater();
      waterList.calculateAppbar();
      emit(WaterScreenState(waterList: waterList, weight: weight));
    });

    on<WaterScreenDeleteEvent>((event, emit) async {
      waterList.waterSlots.removeLast();
      waterList.sum = waterList.sum - waterList.waterSlot;
      waterList.fixingSum();
      waterList.waterSlots.isNotEmpty
          ? waterList.appbarWater =
              'Осталось выпить = ${waterList.sum} / ${waterList.maxWater}'
          : waterList.appbarWater = 'Вы всё выпили!';
      waterList.incrementWater();
      emit(WaterScreenState(waterList: waterList, weight: weight));
    });

    ///

    on<SettingsLoadEvent>((event, emit) async {
      weight.readWeight();
      emit(SettingsScreenState(weight: weight));
    });

    on<SettingsChangeWeightEvent>((event, emit) async {
      weight.incrementWeight();
      emit(SettingsScreenState(weight: weight));
    });

    ///

    on<ChangeScreenEvent>((event, emit) async {
      currentTab == 1
          ? {emit(SettingsScreenState(weight: weight)), currentTab = 2}
          : {emit(WaterScreenState(waterList: waterList, weight: weight)), currentTab = 1};
    });
  }
}
