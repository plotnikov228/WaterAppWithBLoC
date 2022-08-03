import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:water/screens/WaterScreen%20and%20SettingsScreen.dart';
import 'package:water/widgets/MainButton.dart';

import '../BLoC Home/Home bloc.dart';
import '../BLoC Home/Home event.dart';
import '../BLoC Home/Home state.dart';

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
