import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:water/screens/SettingsScreen.dart';
import 'package:water/screens/WaterScreen.dart';

import '../BLoC Home/Home bloc.dart';
import '../BLoC Home/Home state.dart';

class WaterScreenAndSettings extends StatelessWidget {
  const WaterScreenAndSettings({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeBloc, HomeState>(builder: (context, state) {
      if (state is WaterScreenState) return const WaterScreen();
      if (state is SettingsScreenState) return const Settings();
      else return Container();
    });
  }
}
