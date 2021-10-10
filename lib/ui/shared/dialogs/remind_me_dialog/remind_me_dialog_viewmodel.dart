import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:flutter/material.dart';
import 'package:hng/app/app.locator.dart';
import 'package:hng/utilities/utilities.dart';
import 'package:intl/intl.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class RemindMeDialogViewModel extends BaseViewModel {
  final navigationService = locator<NavigationService>();
  final now = DateTime.now();

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
    await AwesomeNotifications().createNotification(
        content: NotificationContent(
            id: 1,
            channelKey: 'message',
            title: 'Message Reminder',
            body: 'Your Message Reminder has arrived'),
        schedule: NotificationInterval(interval: 1200, timeZone: "+01:00"));

    navigationService.popRepeated(1);
  }

//1 hour
  void messageReminderOneHour() async {
    await AwesomeNotifications().createNotification(
        content: NotificationContent(
            id: 1,
            channelKey: 'message',
            title: 'Message Reminder',
            body: 'Your Message Reminder has arrived'),
        schedule: NotificationInterval(interval: 3600, timeZone: "+01:00"));
    navigationService.popRepeated(1);
  }

  //3 hours
  void messageReminderThreeHours() async {
       await AwesomeNotifications().createNotification(
        content: NotificationContent(
            id: 1,
            channelKey: 'message',
            title: 'Message Reminder',
            body: 'Your Message Reminder has arrived'),
        schedule: NotificationCalendar.fromDate(
            date: now.add(const Duration(hours: 3))));
    navigationService.popRepeated(1);
  }

  //tomorrow

  void messageReminderTomorrow() async {
    await AwesomeNotifications().createNotification(
        content: NotificationContent(
            id: 1,
            channelKey: 'message',
            title: 'Message Reminder',
            body: 'Your Message Reminder has arrived'),
        schedule: NotificationCalendar.fromDate(
            date: now.add(const Duration(days: 1))));
    navigationService.popRepeated(1);
  }

  //next week
  void messageReminderNextWeek() async {
       await AwesomeNotifications().createNotification(
        content: NotificationContent(
            id: 1,
            channelKey: 'message',
            title: 'Message Reminder',
            body: 'Your Message Reminder has arrived'),
        schedule: NotificationCalendar.fromDate(
            date: now.add(const Duration(days: 7))));
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

       await AwesomeNotifications().createNotification(
        content: NotificationContent(
            id: 1,
            channelKey: 'message',
            title: 'Message Reminder',
            body: 'Your Message Reminder has arrived'),
        schedule: NotificationCalendar.fromDate(
            date: selectedDate));

    navigationService.popRepeated(1);
  }
}
