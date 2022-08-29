import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:water/screens/water_screen_and_settings_screen.dart';
import 'package:water/widgets/main_button.dart';

import '../bloc_home/home_bloc.dart';
import '../bloc_home/home_event.dart';
import '../bloc_home/home_state.dart';


class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeBloc(HomeState)..add(WaterScreenLoadEvent()),
      child: Stack(children: const <Widget>[
        WaterScreenAndSettings(),
        Align(
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
