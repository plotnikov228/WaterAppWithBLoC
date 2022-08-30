import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:water/additionally/date.dart';
import 'package:water/additionally/water_list.dart';
import 'package:water/additionally/weight.dart';
import 'package:water/widgets/water_dialog.dart';
import 'package:water/widgets/waves.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../additionally/colors.dart';
import '../bloc_home/home_bloc.dart';
import '../bloc_home/home_event.dart';
import '../bloc_home/home_state.dart';

class WaterScreen extends StatefulWidget {
  final HomeState state;

  const WaterScreen({Key? key, required this.state}) : super(key: key);

  @override
  State<WaterScreen> createState() => _WaterScreenState();
}

class _WaterScreenState extends State<WaterScreen> {
  final Date date = Date();
  ColorsForApp colorsForApp = ColorsForApp();
  Weight weight = Weight();
  WaterList waterList = WaterList();

  @override
  Widget build(BuildContext context) {
    date.readDay();
    waterList.cells(weight.selectedWeight);
    final HomeBloc waterBloc = context.read<HomeBloc>();
    return BlocBuilder<HomeBloc, HomeState>(builder: (context, state) {
      if (state is WaterScreenState) {
        if (date.day != date.now.day) {
          waterBloc.add(WaterScreenAddEvent());
        }
        if (state.waterList.waterSlots.isNotEmpty) {
          return Scaffold(
            backgroundColor: colorsForApp.backgroundColor,
            appBar: AppBar(
              title: Text(state.waterList.appbarWater,
                  style: TextStyle(color: colorsForApp.objectColor)),
              backgroundColor: colorsForApp.appbarBackgroundColor,
            ),
            body: Stack(children: [
              Align(
                  alignment: Alignment.bottomCenter,
                  child: ProgressWave(
                      progress: max(0, state.waterList.waterSlots.length) /
                          state.waterList.numberOfCells)),
              Padding(
                padding: const EdgeInsets.all(16),
                child: ListView.builder(
                  itemCount: state.waterList.waterSlots.length,
                  itemBuilder: (context, index) => Card(
                    child: ListTile(
                      title: Text(state.waterList.waterSlots[index]),
                      trailing: IconButton(
                        icon: const Icon(
                          Icons.delete_forever,
                          color: Colors.black,
                        ),
                        onPressed: () {
                          if (state.waterList.waterSlots.isEmpty) {
                            showMyDialog(context);
                          }
                          waterBloc.add(WaterScreenDeleteEvent());
                        },
                      ),
                    ),
                  ),
                ),
              ),
            ]),
          );
        } else {
          return Scaffold(
            backgroundColor: colorsForApp.backgroundColor,
            appBar: AppBar(
              title: Text(state.waterList.appbarWater,
                  style: TextStyle(color: colorsForApp.objectColor)),
              backgroundColor: colorsForApp.appbarBackgroundColor,
            ),
            body: Stack(children: [
              Align(
                  alignment: Alignment.bottomCenter,
                  child: ProgressWave(
                      progress: max(0, state.waterList.waterSlots.length) /
                          state.waterList.numberOfCells)),
              Center(child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Вы всё выпили,',
                    style: TextStyle(color: Colors.grey, fontSize: 16),
                  ),
                  Text(
                    'Возвращайтесь завтра!',
                    style: TextStyle(
                        color: colorsForApp.objectColor, fontSize: 16),
                  )
                ],
              ))
            ]),
          );
        }
      } else
        return Container();
    });
  }
}
