import 'dart:async';
import 'dart:convert';

import 'package:centrifuge/centrifuge.dart' as centrifuge;
import 'package:centrifuge/centrifuge.dart';
import 'package:hng/app/app.logger.dart';
import 'package:hng/utilities/constants.dart';
import 'package:stacked/stacked.dart';

class CentrifugeService with ReactiveServiceMixin {
  static Client _client = centrifuge.createClient(
    '$websocketUrl?format=protobuf',
  );
  StreamController<Map> messageStreamController = StreamController.broadcast();

  static CentrifugeService? _instance;
  static final log = getLogger('CentrifugeService');

  ///This contains the `socketId` mapped to the stream or contoller
  ///so user dont subscribe to the same event twice
  Map<String, Subscription> subList = {};

  static Future<CentrifugeService> getInstance() async {
    if (_instance == null) {
      _instance = CentrifugeService();
    }

    _client.connectStream.listen(_showLog);
    _client.disconnectStream.listen(_showLog);

    _client.connect();
    return _instance!;
  }

  void disconnect() async {
    _client.disconnect();
  }

  void _showError(_error) {
    log.e(_error);
  }

  static void _showLog(_message) {
    log.i(_message);
  }

  ///Use this to listen to centrifuge event either from dm, channels
  ///or any sub you want to listen to
  ///```
  ///   CentrifugeService().listen(String socketId,(Map userMessage){
  ///        //Perform any function with the message return
  ///   })
  /// ```
  /// A StreamSubscription is returned. Cancel the stream subscription if
  /// you no longer want to listen for events use `streamSub.cancel()`
  ///
  StreamSubscription listen({
    required String socketId,
    required channelId,
    required Function(Map userMessage) onData,
  }) {
    if (!hasSubscribed(socketId)) {
      subscribe(socketId);
    }

    var streamSub = messageStreamController.stream.listen((message) {
      String? eventType = message['event']['action'];
      if (eventType != 'create:message') {
        return;
      }
      if (message['channel_id'] != channelId) {
        return;
      }
      onData(message);
    });
    return streamSub;
  }

  StreamSubscription onNotificationReceived({
    required String channelId,
    required Function(Map userMessage) onData,
  }) {
    var streamSub = messageStreamController.stream.listen((message) {
      String? eventType = message['event']['action'];
      if (eventType != 'create:message') {
        return;
      }
      // if (message['channel_id'] == channelId) {
      //   return;
      // }

      onData(message);
    });
    return streamSub;
  }

  bool hasSubscribed(String socketId) {
    return subList.containsKey(socketId);
  }

  Future<Stream?> subscribe(String channelSocketId) async {
    if (channelSocketId == "")
      throw Exception(
          "Channel Socket ID is required to subscribe to a channel");
    Subscription? subscription = _client.getSubscription(channelSocketId);

    subscription.subscribeErrorStream.listen(_showError);
    subscription.subscribeSuccessStream.listen(_showLog);
    subscription.unsubscribeStream.listen(_showLog);

    subscription.joinStream.listen((event) {
      log.i('Subcribe join stream $event');
    });

    subscription.leaveStream.listen((event) {
      log.i('Subcribe leave stream $event');
    });

    subscription.publishStream.listen((event) {
      log.i(
          'CENTRIFUGE RTC EVENT OUTPUT ${json.decode(utf8.decode(event.data))}');

      Map userMessage = json.decode(utf8.decode(event.data));

      messageStreamController.sink.add(userMessage);
    });

    subscription.subscribe();
    if (hasSubscribed(channelSocketId)) {
      subscription.unsubscribe();
      return null;
    }
    subList[channelSocketId] = subscription;
  }

  void dispose() {
    messageStreamController.close();
  }
}

class _CentrifugeSubEvent {
  Subscription subscription;
  StreamController controller;

  get stream => controller.stream;
  _CentrifugeSubEvent({
    required this.subscription,
    required this.controller,
  });
}
// 0:"user_id" -> "6146430f1a5607b13c00bc13"
// 1:"channel_id" -> "61526afe361598d72bed874a"
// 2:"content" -> "yo"
// 3:"emojis" -> List (0 items)
// 4:"has_files" -> false
// 5:"files" -> List (0 items)
// 6:"pinned" -> false
// 7:"edited" -> false
// 8:"type" -> "message"
// 9:"event" -> Map (1 item)
// 10:"replies" -> 0
// 11:"can_reply" -> true
// 12:"timestamp" -> "2021-10-01T11:42:26.955579+00:00"
// 13:"_id" -> "6156fafbd56dd3c4d8a963f4"