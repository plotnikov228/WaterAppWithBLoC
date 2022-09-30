import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../additionally/colors.dart';
import '../additionally/my_flutter_app_icons.dart';
import '../bloc_home/home_bloc.dart';
import '../bloc_home/home_event.dart';
import '../bloc_home/home_state.dart';

class MainButton extends StatelessWidget {
  const MainButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ColorsForApp colorsForApp = ColorsForApp();
    final HomeBloc bloc = context.read<HomeBloc>();
    int iconOnButton = 0;
    return BlocBuilder<HomeBloc, HomeState>(builder: (context, state) {
      return ElevatedButton(
          style: ElevatedButton.styleFrom(
            fixedSize: const Size(100, 100),
            shape: const CircleBorder(),
            primary: colorsForApp.backgroundColor,
            elevation: 0.1,
          ),
          onPressed: () {
            iconOnButton == 0 ? iconOnButton = 1 : iconOnButton = 0;
            bloc.add(ChangeScreenEvent());
          },
          child: Icon(
            iconOnButton == 0 ? Icons.settings : MyFlutterApp.cup,
            color: colorsForApp.objectColor,
            size: 30,
          ));
    });
  }
}
