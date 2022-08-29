import 'dart:math';

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
  const WaterScreen({Key? key}) : super(key: key);

  @override
  State<WaterScreen> createState() => _WaterScreenState();
}

class _WaterScreenState extends State<WaterScreen> {
  final Date date = Date();
  ColorsForApp colorsForApp = ColorsForApp();

  @override
  Widget build(BuildContext context) {
    date.readDay();
    WaterList.cells(Weight.selectedWeight);
    final HomeBloc waterBloc = context.read<HomeBloc>();
    return BlocBuilder<HomeBloc, HomeState>(builder: (context, state) {
      date.readDay();
      if (date.day != date.now.day) {
        waterBloc.add(WaterScreenAddEvent());
      }
      return Scaffold(
        backgroundColor: colorsForApp.backgroundColor,
        appBar: AppBar(
          title: Text(WaterList.appbarWater,
              style: TextStyle(color: colorsForApp.objectColor)),
          backgroundColor: colorsForApp.appbarBackgroundColor,
        ),
        body: Stack(children: [
          Align(
              alignment: Alignment.bottomCenter,
              child: ProgressWave(
                  progress: max(0, WaterList.waterSlots.length) /
                      WaterList.numberOfCells)),
          Padding(
            padding: const EdgeInsets.all(16),
            child: ListView.builder(
              itemCount: WaterList.waterSlots.length,
              itemBuilder: (context, index) => Card(
                child: ListTile(
                  title: Text(WaterList.waterSlots[index]),
                  trailing: IconButton(
                    icon: const Icon(
                      Icons.delete_forever,
                      color: Colors.black,
                    ),
                    onPressed: () {
                      if (WaterList.waterSlots.isEmpty) {
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
    });
  }
}
