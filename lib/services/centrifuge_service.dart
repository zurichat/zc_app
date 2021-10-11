import 'dart:async';
import 'dart:convert';

import 'package:centrifuge/centrifuge.dart' as centrifuge;
import 'package:centrifuge/centrifuge.dart';
import 'package:hng/app/app.locator.dart';

import 'package:hng/app/app.logger.dart';
import 'package:hng/services/local_storage_services.dart';
import 'package:hng/utilities/constants.dart';
import 'package:hng/utilities/storage_keys.dart';
import 'package:stacked/stacked.dart';

class CentrifugeService with ReactiveServiceMixin {
  static final storageService = locator<SharedPreferenceLocalStorage>();
  static String? get token =>
      storageService.getString(StorageKeys.currentSessionToken);

  static late Client _client;

  StreamController messageStreamController = StreamController.broadcast();

  static CentrifugeService? _instance;
  static final log = getLogger('CentrifugeService');

  Map<String, Subscription> subList = {};

  ///This contains the `socketId` mapped to the stream or contoller
  ///so user dont subscribe to the same event twice

  static Future<CentrifugeService> getInstance() async {
    _showLog("Starting Centrifuge Service");
    _instance ??= CentrifugeService();

    _client = centrifuge.createClient('$websocketUrl?format=protobuf',
        config: ClientConfig(
          debug: true,
          retry: (int rty) {
            log.w("Retry Count - $rty");
          },
        ));

    final connectData = utf8.encode(json.encode({"bearer": token}));

    _client.setConnectData(connectData);

// _client.setConnectData([2]);
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
    log.wtf(_message);
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
      _showLog("subscribed $socketId");
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
      if (message['channel_id'] == channelId) {
        return;
      }

      onData(message);
    });
    return streamSub;
  }

  bool hasSubscribed(String socketId) {
    return subList.containsKey(socketId);
  }

  Future<Stream?> subscribe(String channelSocketId) async {
    if (channelSocketId == "") {
      throw Exception(
          "Channel Socket ID is required to subscribe to a channel");
    }
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
      Map userMessage = json.decode(utf8.decode(event.data));
      _showLog("CENTRIFUGE RTC EVENT OUTPUT $userMessage");

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
