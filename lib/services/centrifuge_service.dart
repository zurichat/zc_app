import 'dart:async';

import 'package:centrifuge/centrifuge.dart' as centrifuge;
import 'package:centrifuge/centrifuge.dart';
import 'package:hng/app/app.logger.dart';
import 'package:hng/utilities/constants.dart';
import 'package:stacked/stacked.dart';

class CentrifugeService with ReactiveServiceMixin {
  static Client? _client;
  Subscription? _subscription;
  final log = getLogger("CentrifugeService");

  Future connect() async {
    _client = centrifuge.createClient("$websocketUrl?format=protobuf");

    _client!.connectStream.listen((event) {
      log.i("client connect stream $event");
    });
    _client!.disconnectStream.listen((event) {
      log.i("Client disconnect stream $event");
    });
    _client!.connect();
  }

  void disconnect() async {
    _client!.disconnect();
  }

  void _showError(dynamic _error) {
    log.e(_error);
  }

  void _showLog(dynamic _message) {
    log.i(_message);
  }

  Future subscribe(String channel) async {
    _subscription = _client!.getSubscription(channel);

    _subscription!.subscribeErrorStream.listen(_showError);
    _subscription!.subscribeSuccessStream.listen(_showLog);
    _subscription!.unsubscribeStream.listen(_showLog);

    _subscription!.joinStream.listen((event) {
      log.i("Subcribe join stream $event");
    });

    _subscription!.leaveStream.listen((event) {
      log.i("Subcribe leave stream $event");
    });

    _subscription!.publishStream.listen((event) {
      log.i("Subcribe publish stream $event");
    });

    _subscription!.subscribe();
  }
}
