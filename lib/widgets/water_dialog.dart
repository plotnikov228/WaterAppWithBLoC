import 'package:flutter/material.dart';

Future<void> showMyDialog(BuildContext context) async {
  return showDialog<void>(
    context: context,
    barrierDismissible: false,
    builder: (BuildContext context) {
      return AlertDialog(
        title: const Text('Уведомление'),
        content: SingleChildScrollView(
          child: ListBody(
            children: const <Widget>[
              Text(
                  'Вы выпили весь наш запас воды... Возвращайтесь завтра за добавкой!'),
            ],
          ),
        ),
        actions: <Widget>[
          TextButton(
            child: const Text('Ок'),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ],
      );
    },
  );
}