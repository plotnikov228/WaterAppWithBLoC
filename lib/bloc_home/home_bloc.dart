import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:water/additionally/date.dart';
import 'package:water/additionally/weight.dart';
import 'package:water/bloc_home/home_event.dart';
import 'package:water/bloc_home/home_state.dart';

import '../additionally/water_list.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  WaterList waterList;
  Weight weight;
  WaterAppBar waterAppBar;
  Date date;

  HomeBloc({required this.waterList, required this.weight, required this.waterAppBar, required this.date}) : super(WaterScreenState(waterList: waterList, waterAppBar: waterAppBar, date: date)) {


    void checkNewDay () {
      if (date.day != date.now.day) {
        waterList.fillingList();
        date.incrementDay();
        if (state is WaterScreenState) {
          waterAppBar.calculateAppbar(
              waterList.waterSlots, waterList.waterSlot,
              waterList.numberOfCells);
          emit(
              WaterScreenState(waterList: waterList, waterAppBar: waterAppBar, date: date));
        }
      }
    }

    on<WaterScreenAddEvent>((event, emit) async {
      waterList.cells(weight.selectedWeight);
      waterList.fillingList();
      waterAppBar.calculateAppbar(
          waterList.waterSlots, waterList.waterSlot, waterList.numberOfCells);
    });

    on<WaterScreenLoadEvent>((event, emit) async {
      weight.readWeight();
      date.readDay();
      waterList.readWater();
      waterList.cells(weight.selectedWeight);
      waterAppBar.calculateAppbar(
          waterList.waterSlots, waterList.waterSlot, waterList.numberOfCells);
      checkNewDay();
      emit(WaterScreenState(waterList: waterList, waterAppBar: waterAppBar, date: date));
    });

    on<WaterScreenDeleteEvent>((event, emit) async {
      waterList.waterSlots.removeLast();
      waterList.incrementWater();
      waterAppBar.calculateAppbar(
          waterList.waterSlots, waterList.waterSlot, waterList.numberOfCells);
      waterList.waterSlots.isNotEmpty
          ? waterAppBar.appbarWater =
              'Осталось выпить = ${waterAppBar.sum} / ${waterAppBar.maxWater}'
          : waterAppBar.appbarWater = 'Вы всё выпили!';

      emit(WaterScreenState(waterList: waterList, waterAppBar: waterAppBar, date: date));
    });

    ///

    on<SettingsLoadEvent>((event, emit) async {
      emit(SettingsScreenState(weight: weight));
    });

    on<SettingsChangeWeightEvent>((event, emit) async {
      weight.incrementWeight();
      emit(SettingsScreenState(weight: weight));
    });

    ///
    int currentTab = 1;

    on<ChangeScreenEvent>((event, emit) async {
      currentTab == 1
          ? {emit(SettingsScreenState(weight: weight)), currentTab = 2}
          : {
              emit(WaterScreenState(
                  waterList: waterList, waterAppBar: waterAppBar, date: date)),
              currentTab = 1
            };
    });
  }
}
