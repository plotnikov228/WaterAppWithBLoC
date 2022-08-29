import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:water/additionally/colors.dart';
import 'package:water/additionally/weight.dart';

import '../bloc_home/home_bloc.dart';
import '../bloc_home/home_event.dart';
import '../bloc_home/home_state.dart';

class Settings extends StatelessWidget {
  const Settings({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ColorsForApp colorsForApp = ColorsForApp();
    final HomeBloc settingsBloc = context.read<HomeBloc>();
    settingsBloc.add(SettingsLoadEvent());
    return BlocBuilder<HomeBloc, HomeState>(builder: (context, state) {
      return Scaffold(
        backgroundColor: colorsForApp.backgroundColor,
        appBar: AppBar(
          title: Text('Настройки',
              style: TextStyle(color: colorsForApp.objectColor)),
          backgroundColor: colorsForApp.appbarBackgroundColor,
        ),
        body: Column(
          children: [
            Padding(
                padding: const EdgeInsets.all(16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Ваш вес',
                            style: TextStyle(
                                color: colorsForApp.objectColor, fontSize: 15)),
                        const Text(
                            'Колличество воды необходимое для питья расчитывается по формуле =',
                            style: TextStyle(color: Colors.grey, fontSize: 7)),
                        const Text('1500 мл + ((вес) - 20 кг) * 20 мл)',
                            style: TextStyle(color: Colors.grey, fontSize: 7)),
                      ],
                    ),
                    DropdownButton<int>(
                      value: Weight.selectedWeight,
                      style: TextStyle(color: colorsForApp.objectColor),
                      dropdownColor: colorsForApp.appbarBackgroundColor,
                      items: Weight.weightList
                          .map<DropdownMenuItem<int>>((int value) {
                        return DropdownMenuItem<int>(
                          value: value,
                          child: Text('$value'),
                        );
                      }).toList(),
                      onChanged: (int? newWeight) {
                        if(Weight.selectedWeight == newWeight){}
                        else{
                          Weight.selectedWeight = newWeight!;
                          settingsBloc.add(SettingsChangeWeightEvent());
                          settingsBloc.add(WaterScreenAddEvent());
                        }

                      },
                    )
                  ],
                ))
          ],
        ),
      );
    });
  }
}
