import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:hng/app/app.locator.dart';
import 'package:hng/main.dart';
import 'package:hng/utilities/utilities.dart';
import 'package:intl/intl.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class RemindMeDialogViewModel extends BaseViewModel {
  final navigationService = locator<NavigationService>();

  String twentyMinutes = DateFormat('h:mm a')
      .format(DateTime.now().add(const Duration(seconds: 10)));
  var oneHour =
      DateFormat('h:mm a').format(DateTime.now().add(const Duration(hours: 1)));
  var threeHours =
      DateFormat('h:mm a').format(DateTime.now().add(const Duration(hours: 3)));
  var tomorrow = DateFormat("EEEE 'at' h:mm a")
      .format(DateTime.now().add(const Duration(days: 1)));
  var nextWeek = DateFormat("EEEE 'at' h:mm a")
      .format(DateTime.now().add(const Duration(days: 7)));

//twenty minutes
  void messageRemindertwentyMinutes() async {
    var androidPlatformChannelSpecifics = const AndroidNotificationDetails(
      'Zuri chat',
      'Zuri Chat Message Notification',
      icon: 'zuri_chat_logo',
      largeIcon: DrawableResourceAndroidBitmap('zuri_chat_logo'),
    );

    var platformChannelSpecifics =
        NotificationDetails(android: androidPlatformChannelSpecifics);


    // ignore: deprecated_member_use
    await flutterLocalNotificationsPlugin.schedule(
        0,
        'Message Reminder',
        "Your Message Reminder has arrived",
        DateTime.now().add(const Duration(minutes: 20)),
        platformChannelSpecifics,
        androidAllowWhileIdle: true);

    navigationService.popRepeated(1);
  }

//1 hour
  void messageReminderOneHour() async {
    var androidPlatformChannelSpecifics = const AndroidNotificationDetails(
      'Zuri chat',
      'Zuri Chat Message Notification',
      icon: 'zuri_chat_logo',
      largeIcon: DrawableResourceAndroidBitmap('zuri_chat_logo'),
    );

    var platformChannelSpecifics =
        NotificationDetails(android: androidPlatformChannelSpecifics);

    // ignore: deprecated_member_use
    await flutterLocalNotificationsPlugin.schedule(
        0,
        'Message Reminder',
        "Title",
        DateTime.now().add(const Duration(hours: 1)),
        platformChannelSpecifics,
        androidAllowWhileIdle: true);

    navigationService.popRepeated(1);
  }

  //3 hours
  void messageReminderThreeHours() async {
    var androidPlatformChannelSpecifics = const AndroidNotificationDetails(
      'Zuri chat',
      'Zuri Chat Message Notification',
      icon: 'zuri_chat_logo',
      largeIcon: DrawableResourceAndroidBitmap('zuri_chat_logo'),
    );

    var platformChannelSpecifics =
        NotificationDetails(android: androidPlatformChannelSpecifics);

    // ignore: deprecated_member_use
    await flutterLocalNotificationsPlugin.schedule(
        0,
        'Message Reminder',
        "Your Message Reminder has arrived",
        DateTime.now().add(const Duration(hours: 3)),
        platformChannelSpecifics,
        androidAllowWhileIdle: true);

    navigationService.popRepeated(1);
  }

  //tomorrow

  void messageReminderTomorrow() async {
    var androidPlatformChannelSpecifics = const AndroidNotificationDetails(
      'Zuri chat',
      'Zuri Chat Message Notification',
      icon: 'zuri_chat_logo',
      largeIcon: DrawableResourceAndroidBitmap('zuri_chat_logo'),
    );

    var platformChannelSpecifics =
        NotificationDetails(android: androidPlatformChannelSpecifics);

    // ignore: deprecated_member_use
    await flutterLocalNotificationsPlugin.schedule(
        0,
        'Message Reminder',
        "Your Message Reminder has arrived",
        DateTime.now().add(const Duration(days: 1)),
        platformChannelSpecifics,
        androidAllowWhileIdle: true);

    navigationService.popRepeated(1);
  }

  //next week
  void messageReminderNextWeek() async {
    var androidPlatformChannelSpecifics = const AndroidNotificationDetails(
      'Zuri chat',
      'Zuri Chat Message Notification',
      icon: 'zuri_chat_logo',
      largeIcon: DrawableResourceAndroidBitmap('zuri_chat_logo'),
    );

    var platformChannelSpecifics =
        NotificationDetails(android: androidPlatformChannelSpecifics);

    // ignore: deprecated_member_use
    await flutterLocalNotificationsPlugin.schedule(
        0,
        'Message Reminder',
        "Your Message Reminder has arrived",
        DateTime.now().add(const Duration(days: 7)),
        platformChannelSpecifics,
        androidAllowWhileIdle: true);

    navigationService.popRepeated(1);
  }

  //custom
  Future<void>? customReminder(BuildContext? context) async {
    Future<dynamic>? _selectDateTime() {
      return showDatePicker(
        context: context!,
        initialDate: DateTime.now().add(const Duration(seconds: 1)),
        firstDate: DateTime.now(),
        lastDate: DateTime(2100),
      );
    }

    Future<dynamic> _selectTime() {
      final now = DateTime.now();

      return showTimePicker(
        context: context!,
        initialTime: TimeOfDay(hour: now.hour, minute: now.minute),
      );
    }

    var selectedDate = await _selectDateTime();
    var selectedTime = await _selectTime();

    selectedDate = DateTime(
      selectedDate.year,
      selectedDate.month,
      selectedDate.day,
      selectedTime.hour,
      selectedTime.minute,
    );
    log.i(selectedDate.year);
    log.i(selectedDate);

    notifyListeners();

    var androidPlatformChannelSpecifics = const AndroidNotificationDetails(
      'Zuri chat',
      'Zuri Chat Message Notification',
      icon: 'zuri_chat_logo',
      largeIcon: DrawableResourceAndroidBitmap('zuri_chat_logo'),
    );

    var platformChannelSpecifics =
        NotificationDetails(android: androidPlatformChannelSpecifics);

    // ignore: deprecated_member_use
    await flutterLocalNotificationsPlugin.schedule(
        0,
        'Message Reminder',
        "Your Message Reminder has arrived",
        selectedDate,
        platformChannelSpecifics,
        androidAllowWhileIdle: true);

    navigationService.popRepeated(2);
  }
}
