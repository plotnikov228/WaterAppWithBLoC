import 'package:flutter/material.dart';
import 'package:water/notifications.dart';
import 'package:water/screens/home.dart';


void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Notifications notifications = Notifications();
  notifications.initNotifications();
  notifications.pushNotification();
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
