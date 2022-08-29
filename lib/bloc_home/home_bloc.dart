import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:water/additionally/weight.dart';
import 'package:water/bloc_home/home_event.dart';
import 'package:water/bloc_home/home_state.dart';


import '../additionally/date.dart';
import '../additionally/water_list.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc(initialState) : super(WaterScreenState()) {
    int currentTab = 1;
    Date date = Date();

    ///


    ///

    on<WaterScreenAddEvent>((event, emit) async {
      Weight.readWeight();
      WaterList.cells(Weight.selectedWeight);
      WaterList.fillingList();
      WaterList.calculateAppbar();
      date.incrementDay();
      WaterList.appbarWater =
      'Осталось выпить = ${WaterList.sum} / ${WaterList.maxWater}';
    });

    on<WaterScreenLoadEvent>((event, emit) async {
      WaterList.cells(Weight.selectedWeight);
      WaterList.readWater();
      WaterList.calculateAppbar();
      emit(WaterScreenState());
    });

    on<WaterScreenDeleteEvent>((event, emit) async {
      WaterList.waterSlots.removeLast();
      WaterList.sum = WaterList.sum - WaterList.waterSlot;
      WaterList.fixingSum();
      WaterList.waterSlots.isNotEmpty
          ? WaterList.appbarWater =
              'Осталось выпить = ${WaterList.sum} / ${WaterList.maxWater}'
          : WaterList.appbarWater = 'Вы всё выпили!';
      WaterList.incrementWater();
      emit(WaterScreenState());
    });

    ///

    on<SettingsLoadEvent>((event, emit) async {
      Weight.readWeight();
      emit(SettingsScreenState());
    });

    on<SettingsChangeWeightEvent>((event, emit) async {
      Weight.incrementWeight();
      emit(SettingsScreenState());
    });

    ///

    on<ChangeScreenEvent>((event, emit) async {
      currentTab == 1
          ? {emit(SettingsScreenState()), currentTab = 2}
          : {emit(WaterScreenState()), currentTab = 1};
    });
  }
}
