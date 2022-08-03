import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:water/BLoC%20Home/Home%20event.dart';

import '../Additionally/Colors.dart';
import '../BLoC Home/Home bloc.dart';
import '../BLoC Home/Home state.dart';

class MainButton extends StatelessWidget {
  const MainButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final HomeBloc bloc = context.read<HomeBloc>();
    int iconOnButton = 0;
    return BlocBuilder<HomeBloc, HomeState>(builder: (context, state) {
      return ElevatedButton(
          style: ElevatedButton.styleFrom(
            fixedSize: const Size(100, 100),
            shape: const CircleBorder(),
            primary: ColorsForApp.backgroundColor,
          ),
          onPressed: () {
            iconOnButton == 0 ? iconOnButton = 1 : iconOnButton = 0;
            bloc.add(ChangeScreenEvent());
          },
          child: Icon(
            iconOnButton == 0 ? Icons.settings : Icons.delete,
            color: ColorsForApp.objectColor,
            size: 30,
          ));
    });
  }
}
