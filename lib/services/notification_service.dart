import 'dart:async';

import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:flutter/material.dart';

class NotificationService {
  String messsageChannelKey = 'message';

  StreamController<NotificationPayload> _notificationControl =
      StreamController.broadcast();

  ///Listen to notification click by listening to stream and navigate to the
  ///respective screen by using the payload returned
  Stream<NotificationPayload> get onNotificationTap =>
      _notificationControl.stream;

  void init() {
    AwesomeNotifications().initialize(null, // icon for your app notification
        [
          NotificationChannel(
            channelKey: messsageChannelKey,
            channelName: 'Message Notification',
            channelDescription: "Notification example",
            defaultColor: Color(0XFF9050DD),
            ledColor: Colors.white,
            playSound: true,
            enableLights: true,
            enableVibration: true,
          )
        ]);

    AwesomeNotifications().actionStream.listen((receivedNotifiction) {
      var payload = NotificationPayload._fromMap(receivedNotifiction.payload);
      _notificationControl.sink.add(payload);
    });
  }

  void show({
    required String title,
    required String body,
    required NotificationPayload payload,
  }) {
    AwesomeNotifications().createNotification(
      content: NotificationContent(
        id: 1,
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
        id: 1,
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
  String? membersCount;
  bool? public;

  NotificationPayload({
    required this.messageId,
    required this.roomId,
    required this.name,
    this.membersCount,
    this.public,
  });

  NotificationPayload._fromMap(Map<String, String>? map) {
    map = map ?? {};
    messageId = map['messageId'] ?? '';
    roomId = map['roomId'] ?? '';
    name = map['name'] ?? '';
    membersCount = map['membersCount'];
    public = map['public'] == 'T';
  }

  convertToMap() {
    return <String, String>{
      'messageId': messageId,
      'roomId': roomId,
      'name': name,
      'membersCount': membersCount ?? '',
      'public': public == true ? 'T' : 'F',
    };
  }
}