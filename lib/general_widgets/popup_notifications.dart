import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:flutter/material.dart';


class NotificationService {
  static final NotificationService _notificationService = NotificationService
      ._internal();

  factory NotificationService() {
    return _notificationService;
  }

  NotificationService._internal();

  Future<void> initAwesomeNotification() async {
    AwesomeNotifications().initialize(
      'resource://drawable/ic_launcher',
      [
        NotificationChannel(
            channelKey: 'main_channel',
            channelName: 'Main Channel',
            channelDescription: 'Main channel notifications',
            enableLights: true,
            importance: NotificationImportance.Max,
            ledColor: Colors.white
        )
      ],
    );
  }

  Future<void> requestPermission() async {
    AwesomeNotifications().isNotificationAllowed().then((allowed) {
      if (!allowed) {
        AwesomeNotifications().requestPermissionToSendNotifications();
      }
    });
  }




  Future<void> showNotification(int id, String channelKey, String title,
      String body) async {
    AwesomeNotifications().createNotification(
      content: NotificationContent(
        id: id,
        channelKey: channelKey,
        title: title,
        body: body,
      ),
    );
  }





}


