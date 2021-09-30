import 'dart:async';
import 'dart:convert';

import 'package:centrifuge/centrifuge.dart' as centrifuge;
import 'package:centrifuge/centrifuge.dart';
import 'package:hng/app/app.logger.dart';
import 'package:hng/utilities/constants.dart';
import 'package:stacked/stacked.dart';

class CentrifugeService with ReactiveServiceMixin {
  static Client _client =
      centrifuge.createClient('$websocketUrl?format=protobuf');
  Subscription? _subscription;
  static CentrifugeService? _instance;
  StreamController messageStreamController = StreamController.broadcast();
  static final log = getLogger('CentrifugeService');

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

  Future<Stream?> subscribe(String channelSocketId) async {
    _subscription?.unsubscribe();
    if (channelSocketId == "")
      throw Exception(
          "Channel Socket ID is required to subscribe to a channel");
    _subscription = _client.getSubscription(channelSocketId);

    _subscription!.subscribeErrorStream.listen(_showError);
    _subscription!.subscribeSuccessStream.listen(_showLog);
    _subscription!.unsubscribeStream.listen(_showLog);

    _subscription!.joinStream.listen((event) {
      log.i('Subcribe join stream $event');
    });

    _subscription!.leaveStream.listen((event) {
      log.i('Subcribe leave stream $event');
    });

    _subscription!.publishStream.listen((event) {
      log.i(
          'CENTRIFUGE RTC EVENT OUTPUT ${json.decode(utf8.decode(event.data))}');

      Map userMessage = json.decode(utf8.decode(event.data));

      messageStreamController.sink.add(userMessage);
    });

    _subscription!.subscribe();
  }

  void dispose() {
    messageStreamController.close();
  }
}
