import 'dart:async';
import 'dart:math';

import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:flutter/material.dart';
import 'package:hng/app/app.locator.dart';
import 'package:hng/services/local_storage_services.dart';
import 'package:hng/ui/shared/colors.dart';
import 'package:hng/utilities/storage_keys.dart';

class NotificationService {
  final String messsageChannelKey = 'message';
  bool _canShowNotification = true;
  final StreamController<NotificationPayload> _notificationControl =
      StreamController.broadcast();
  final _sharedPreference = locator<SharedPreferenceLocalStorage>();

  final Random rand = Random();


/// It update notification status
  void setCanShowNotification(int time) async {
    _canShowNotification = false;
    final duration = DateTime.now().millisecondsSinceEpoch - time;
    if (duration <= 0) {
      _canShowNotification = true;
      return;
    }
    Timer(Duration(milliseconds: duration), () => _canShowNotification = true);
  }

  /// Getting DND time to update notification
  void updateCanShowNotification() {
    try {
      final time = _sharedPreference.getDouble(
        StorageKeys.doNotDisturb,
      );
      setCanShowNotification(time!.toInt());
    } catch (e) {
      setCanShowNotification(DateTime.now().millisecondsSinceEpoch);
    }
  }

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

    AwesomeNotifications().actionStream.listen((receivedNotification) {
      var payload = NotificationPayload._fromMap(receivedNotification.payload);
      //check do not disturb
      if(isNotificationAllowed()){
        _notificationControl.sink.add(payload);
      }
    });
  }

  bool isNotificationAllowed(){
    final futureTime = _sharedPreference.getDouble(
      StorageKeys.doNotDisturb,
    ) ?? 0;
    DateTime now = DateTime.now();
    return now.millisecondsSinceEpoch > futureTime;
  }

  void show({
    required String title,
    required String body,
    required NotificationPayload payload,
  }) {
    if (_canShowNotification) {
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
  }

  void showWithImage({
    required String title,
    required String body,
    required String image,
    required NotificationPayload payload,
  }) {
    if (_canShowNotification) {
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
  int? membersCount;
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
