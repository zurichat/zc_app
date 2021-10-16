import 'package:zurichat/app/app.locator.dart';
import 'package:zurichat/services/notification_service.dart';
import 'package:intl/intl.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class RemindMeDialogViewModel extends BaseViewModel {
  final navigationService = locator<NavigationService>();
  final notificationService = locator<NotificationService>();

  String twentyMinutes = DateFormat('h:mm a')
      .format(DateTime.now().add(const Duration(minutes: 20)));
  var oneHour =
      DateFormat('h:mm a').format(DateTime.now().add(const Duration(hours: 1)));
  var threeHours =
      DateFormat('h:mm a').format(DateTime.now().add(const Duration(hours: 3)));
  var tomorrow = DateFormat("EEEE 'at' h:mm a")
      .format(DateTime.now().add(const Duration(days: 1)));
  var nextWeek = DateFormat("EEEE 'at' h:mm a")
      .format(DateTime.now().add(const Duration(days: 7)));
  var now = DateTime.now();

//twenty minutes
  void messageRemindertwentyMinutes() async {
    await notificationService.messageReminder(
        dateTime: now.add(const Duration(minutes: 20)));
    navigationService.popRepeated(1);
  }

//1 hour
  void messageReminderOneHour() async {
    await notificationService.messageReminder(
        dateTime: now.add(const Duration(hours: 1)));
    navigationService.popRepeated(1);
  }

  //3 hours
  void messageReminderThreeHours() async {
    await notificationService.messageReminder(
        dateTime: now.add(const Duration(hours: 3)));
    navigationService.popRepeated(1);
  }

  //tomorrow

  void messageReminderTomorrow() async {
    await notificationService.messageReminder(
        dateTime: now.add(const Duration(days: 1)));
    navigationService.popRepeated(1);
  }

  //next week
  void messageReminderNextWeek() async {
    await notificationService.messageReminder(
        dateTime: now.add(const Duration(days: 7)));
    navigationService.popRepeated(1);
  }

  //custom
  void customReminder(selectedDate, selectedTime) async {
    await notificationService.customReminder(selectedDate, selectedTime);
    navigationService.popRepeated(1);
    notifyListeners();
  }
}
