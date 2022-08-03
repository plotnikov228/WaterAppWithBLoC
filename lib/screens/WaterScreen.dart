import 'dart:math';

import 'package:flutter/material.dart';
import 'package:water/Additionally/WaterList.dart';
import 'package:water/Additionally/Weight.dart';
import 'package:water/widgets/WaterDialog.dart';
import 'package:water/widgets/Waves.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../Additionally/Colors.dart';
import '../BLoC Home/Home bloc.dart';
import '../BLoC Home/Home event.dart';
import '../BLoC Home/Home state.dart';

class WaterScreen extends StatelessWidget {
  const WaterScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    WaterList.cells(Weight.selectedWeight);
    final HomeBloc waterBloc = context.read<HomeBloc>();
    waterBloc.add(WaterScreenLoadEvent());
    return BlocBuilder<HomeBloc, HomeState>(builder: (context, state) {
      if (WaterList.waterSlots.isNotEmpty) {
        return Scaffold(
          backgroundColor: ColorsForApp.backgroundColor,
          appBar: AppBar(
            title: Text(WaterList.appbarWater,
                style: TextStyle(color: ColorsForApp.objectColor)),
            backgroundColor: ColorsForApp.appbarBackgroundColor,
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
      }
      else{
        return Scaffold(
          backgroundColor: ColorsForApp.backgroundColor,
          appBar: AppBar(
            title: Text(WaterList.appbarWater,
                style: TextStyle(color: ColorsForApp.objectColor)),
            backgroundColor: ColorsForApp.appbarBackgroundColor,
          ),
          body: Stack(children: [
            Align(
                alignment: Alignment.bottomCenter,
                child: ProgressWave(
                    progress: max(0, WaterList.waterSlots.length) /
                        WaterList.numberOfCells)),
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'Вы всё выпили,',
                    style: TextStyle(color: Colors.grey, fontSize: 14),
                  ),
                  Text(
                    'До завтра!',
                    style: TextStyle(color: ColorsForApp.objectColor, fontSize: 20),
                  ),
                ],
              ),
            )

          ]),
        );
      }
    });
  }
}
