import 'dart:math';

import 'package:flutter/material.dart';
import 'package:water/widgets/waves.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../additionally/colors.dart';
import '../bloc_home/home_bloc.dart';
import '../bloc_home/home_event.dart';
import '../bloc_home/home_state.dart';

class WaterScreen extends StatelessWidget {

  const WaterScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ColorsForApp colorsForApp = ColorsForApp();
    final HomeBloc waterBloc = context.read<HomeBloc>();
    return BlocBuilder<HomeBloc, HomeState>(builder: (context, state) {

      if (state is WaterScreenState) {
        waterBloc.add(WaterScreenLoadEvent());
        if (state.waterList.waterSlots.isNotEmpty) {
          state.waterAppBar.calculateAppbar(state.waterList.waterSlots, state.waterList.waterSlot,
              state.waterList.numberOfCells);
          return Scaffold(
            backgroundColor: colorsForApp.backgroundColor,
            appBar: AppBar(
              title: Text(state.waterAppBar.appbarWater,
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
                  itemBuilder: (context, index) =>
                      Card(
                        child: ListTile(
                          key: Key(index.toString()),
                          title: Text(
                            state.waterList.waterSlots[index],
                            style: TextStyle(color: colorsForApp.objectColor),
                          ),
                          trailing: IconButton(
                            icon: Icon(
                              Icons.check,
                              color: colorsForApp.objectColor,
                            ),
                            onPressed: () {
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
              title: Text('Вы всё выпили!',
                  style: TextStyle(color: colorsForApp.objectColor)),
              backgroundColor: colorsForApp.appbarBackgroundColor,
            ),
            body: Stack(children: [
              Align(
                  alignment: Alignment.bottomCenter,
                  child: ProgressWave(
                      progress: max(0, state.waterList.waterSlots.length) /
                          state.waterList.numberOfCells)),
              Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        'Вы всё выпили,',
                        style: TextStyle(color: Colors.grey, fontSize: 16),
                      ),
                      Text(
                        'Возвращайтесь завтра!',
                        style:
                        TextStyle(color: colorsForApp.objectColor,
                            fontSize: 16),
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
