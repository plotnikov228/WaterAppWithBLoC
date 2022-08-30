import 'dart:math';

import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:water/additionally/water_list.dart';
import 'package:water/additionally/weight.dart';
import 'package:water/screens/settings_screen.dart';
import 'package:water/screens/water_screen.dart';
import 'package:water/widgets/main_button.dart';

import '../additionally/colors.dart';
import '../additionally/date.dart';
import '../bloc_home/home_bloc.dart';
import '../bloc_home/home_event.dart';
import '../bloc_home/home_state.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  WaterList waterList = WaterList();
  Weight weight = Weight();
  final Date date = Date();
  final ColorsForApp colorsForApp = ColorsForApp();
  @override
  Widget build(BuildContext context) {
    return BlocProvider<HomeBloc>(
      create: (context) =>
          HomeBloc(waterList: waterList, weight: weight)
            ..add(WaterScreenLoadEvent()),
      child: Stack(children: <Widget>[
          BlocBuilder<HomeBloc, HomeState>(builder: (context, state) {
          if (state is WaterScreenState) {
          return WaterScreen(state: state);
          } else {
          return Settings(state: state);
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
