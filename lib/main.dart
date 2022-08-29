import 'package:flutter/material.dart';
import 'package:water/screens/home.dart';


void main() async {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: '/home',
        routes: {
          '/home': (context) => const Home()
        });
  }
}
