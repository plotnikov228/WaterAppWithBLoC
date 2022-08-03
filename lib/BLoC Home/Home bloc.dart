import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:water/Additionally/Colors.dart';
import 'package:water/Additionally/Weight.dart';
import 'package:water/BLoC%20Home/Home%20event.dart';
import 'package:water/BLoC%20Home/Home%20state.dart';

import '../Additionally/Date.dart';
import '../Additionally/WaterList.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc(initialState) : super(WaterScreenState()) {
    int currentTab = 1;
    bool openApp = false;
    Date date = Date();

    ///

    void _incrementTheme() async {
      final prefs = await SharedPreferences.getInstance();
      ColorsForApp.theme = (prefs.setBool('theme', ColorsForApp.theme)) as bool;
    }

    void _readTheme() async {
      final prefs = await SharedPreferences.getInstance();
      ColorsForApp.theme = (prefs.getBool('theme'))!;
    }

    ///

    on<WaterScreenAddEvent>((event, emit) async {
      Weight.readWeight();
      WaterList.cells(Weight.selectedWeight);
      WaterList.fillingList();
      WaterList.incrementWater();
      date.incrementDay();
      WaterList.appbarWater =
      'Осталось выпить = ${WaterList.sum} / ${WaterList.maxWater}';
    });

    on<WaterScreenLoadEvent>((event, emit) async {
      WaterList.readWater();
      WaterList.cells(Weight.selectedWeight);
      WaterList.calculateAppbar();
      WaterList.waterSlots.isNotEmpty ? WaterList.appbarWater =
      'Осталось выпить = ${WaterList.sum} / ${WaterList.maxWater}'
          : WaterList.appbarWater = 'Вы всё выпили!';

      _readTheme();
      ColorsForApp.theme == false ? ColorsForApp.changeColorsOnDayTheme() :
          ColorsForApp.changeColorsOnNightTheme();

      date.readDay();
      if(date.day != date.now.day){
        WaterList.fillingList();
        WaterList.incrementWater();
        date.incrementDay();
        WaterList.appbarWater =
        'Осталось выпить = ${WaterList.sum} / ${WaterList.maxWater}';
      }

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
      _readTheme();
      Weight.readWeight();
      emit(SettingsScreenState());
    });

    on<SettingsThemeChangeEvent>((event, emit) async {
      ColorsForApp.backgroundColor == ColorsForApp.backgroundColorDay
          ? {ColorsForApp.changeColorsOnNightTheme()}
          : {ColorsForApp.changeColorsOnDayTheme()};
      _incrementTheme();
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
