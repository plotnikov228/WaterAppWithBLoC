import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:water/additionally/date.dart';

import 'package:water/additionally/water_list.dart';
import 'package:water/additionally/weight.dart';
import 'package:water/screens/settings_screen.dart';
import 'package:water/screens/water_screen.dart';
import 'package:water/widgets/main_button.dart';

import '../bloc_home/home_bloc.dart';
import '../bloc_home/home_event.dart';
import '../bloc_home/home_state.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final WaterList waterList = WaterList();
    final Weight weight = Weight();
    final WaterAppBar waterAppBar = WaterAppBar();
    final Date date = Date();
    return BlocProvider<HomeBloc>(
      create: (context) => HomeBloc(
          waterList: waterList, weight: weight, waterAppBar: waterAppBar, date: date)
        ..add(WaterScreenLoadEvent()),
      child: Stack(children: <Widget>[
        BlocBuilder<HomeBloc, HomeState>(builder: (context, state) {
          if (state is WaterScreenState) {
            return const WaterScreen();
          } else {
            return const Settings();
          }
        }),
        const Align(
          alignment: Alignment.bottomCenter,
          child: Padding(
            padding: EdgeInsets.all(10),
            child: SizedBox(
              height: 80,
              child: MainButton(),
            ),
          ),
        ),
      ]),
    );
  }
}
