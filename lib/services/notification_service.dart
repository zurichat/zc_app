import 'dart:async';
import 'dart:math';

import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:flutter/material.dart';
import 'package:zurichat/app/app.locator.dart';
import 'package:zurichat/app/app.router.dart';
import 'package:zurichat/ui/shared/colors.dart';
import 'package:stacked_services/stacked_services.dart';

class NotificationService {
  final _navigationService = locator<NavigationService>();

  final String messsageChannelKey = 'message';

  final StreamController<NotificationPayload> _notificationControl =
      StreamController.broadcast();

  final Random rand = Random();

  final now = DateTime.now();

  ///Listen to notification click by listening to stream and navigate to the
  ///respective screen by using the payload returned
  ///```
  ///  NotificationService().onNotificationTap.listen((payload) {
  ///     //move to the respective screeen
  ///  });
  /// ```
  Stream<NotificationPayload> get onNotificationTap =>
      _notificationControl.stream;

  void init() {
    AwesomeNotifications().initialize(
        'resource://drawable/zuri_chat_logo', // use the default icon for your app notification
        [
          NotificationChannel(
            channelKey: messsageChannelKey,
            channelName: 'Message Notification',
            channelDescription: "Notification example",
            defaultColor: AppColors.zuriPrimaryColor,
            ledColor: Colors.white,
            playSound: true,
            enableLights: true,
            importance: NotificationImportance.High,
            enableVibration: true,
          )
        ]);

    AwesomeNotifications().actionStream.listen((receivedNotifiction) {
      //var payload = NotificationPayload._fromMap(receivedNotifiction.payload);
      //_notificationControl.sink.add(payload);
      _navigationService.navigateTo(Routes.homePage);
    });
  }

  void show({
    required String title,
    required String body,
    required NotificationPayload payload,
  }) {
    AwesomeNotifications().createNotification(
      content: NotificationContent(
        id: rand.nextInt(999999999),
        channelKey: messsageChannelKey,
        title: title,
        body: body,
        payload: payload.convertToMap(),
      ),
    );
  }

  void showWithImage({
    required String title,
    required String body,
    required String image,
    required NotificationPayload payload,
  }) {
    AwesomeNotifications().createNotification(
      content: NotificationContent(
        id: rand.nextInt(999999999),
        channelKey: messsageChannelKey,
        title: title,
        body: body,
        payload: payload.convertToMap(),
        bigPicture: image,
        notificationLayout: NotificationLayout.BigPicture,
      ),
    );
  }

  dispose() {
    _notificationControl.close();
  }

  //Message Reminer
  Future<void> messageReminder({required DateTime dateTime}) async {
    await AwesomeNotifications().createNotification(
        content: NotificationContent(
            id: 1,
            channelKey: 'message',
            title: 'Message Reminder',
            body:
                "You set a notification for a message for ${dateTime.toString().substring(0, 5)}"),
        schedule: NotificationCalendar.fromDate(date: dateTime));
  }

  //Message Custom reminder function
  Future<void> customReminder(var selectedDate, var selectedTime) async {
    selectedDate = DateTime(
      selectedDate.year,
      selectedDate.month,
      selectedDate.day,
      selectedTime.hour,
      selectedTime.minute,
    );

    await AwesomeNotifications().createNotification(
        content: NotificationContent(
            id: 1,
            channelKey: 'message',
            title: 'Message Reminder',
            body:
                "You set a notification for a message for ${selectedDate.toString().substring(0, 16)}"),
        schedule: NotificationCalendar.fromDate(date: selectedDate));
  }
}

///This payload gives a pattern for saving notification data and retreiving it
///When the notification is clicked. Note: payload is not shown to the user
///
///This makes notification to follow a strict pattern rather than just using
///the default `Map<String, String>` that awesome notification provides
class NotificationPayload {
  ///Id of the particular message sent
  String messageId = '';

  ///For Channel = `channel id`,
  ///
  ///For dms = `room Id or other user id`,
  String roomId = '';

  ///For Channel = `channel name`,
  ///
  ///For dms = `other user name`,
  String name = '';
  int? membersCount;
  bool? public;

  NotificationPayload({
    required this.messageId,
    required this.roomId,
    required this.name,
    this.membersCount,
    this.public,
  });

  // ignore: unused_element
  NotificationPayload._fromMap(Map<String, String>? map) {
    map = map ?? {};
    messageId = map['messageId'] ?? '';
    roomId = map['roomId'] ?? '';
    name = map['name'] ?? '';
    membersCount = int.tryParse(map['membersCount'] ?? '0');
    public = map['public'] == 'T';
  }

  convertToMap() {
    return <String, String>{
      'messageId': messageId,
      'roomId': roomId,
      'name': name,
      'membersCount': '$membersCount',
      'public': public == true ? 'T' : 'F',
    };
  }
}

void initNotificationService() {
  final NotificationService notificationService =
      locator<NotificationService>();
  notificationService.init();
}
