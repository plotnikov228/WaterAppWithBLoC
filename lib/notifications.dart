import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class Notifications {
  FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();

  void initNotifications() {
    var android = const AndroidInitializationSettings('@mipmap/app_icon');
    var IOS = const IOSInitializationSettings(
      requestAlertPermission: false,
      requestBadgePermission: false,
      requestSoundPermission: false,
    );

    var settings = InitializationSettings(android: android, iOS: IOS);
    flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();
    flutterLocalNotificationsPlugin.initialize(settings);
  }

  Future<void> pushNotification() async {
    const AndroidNotificationDetails androidPlatformChannelSpecifics =
        AndroidNotificationDetails(
      'water plan',
      'description',
      importance: Importance.max,
      priority: Priority.high,
      showWhen: false,
      enableVibration: true,

    );
    const IOSNotificationDetails iSODetails = IOSNotificationDetails(
        sound: "default.wav",
        presentAlert: true,
        presentBadge: true,
        presentSound: true,
    );
    const NotificationDetails platformChannelSpecifics = NotificationDetails(
        android: androidPlatformChannelSpecifics, iOS: iSODetails);

    var date = DateTime.now();

    await flutterLocalNotificationsPlugin.showDailyAtTime(
        0,
        'Доброе утро',
        'Порция воды загружена в ваше приложение!',
        const Time(00,07,00),
        platformChannelSpecifics,
        payload: 'item x');

    uiLocalNotificationDateInterpretation: UILocalNotificationDateInterpretation.absoluteTime;
    androidAllowWhileIdle: true;
  }
}
