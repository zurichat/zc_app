import 'dart:async';
import 'dart:convert';

import 'package:centrifuge/centrifuge.dart' as centrifuge;
import 'package:centrifuge/centrifuge.dart';
import 'package:hng/app/app.logger.dart';
import 'package:hng/utilities/constants.dart';
import 'package:stacked/stacked.dart';

class CentrifugeService with ReactiveServiceMixin {
  static Client? _client;
  Subscription? _subscription;
  StreamController<String> messageStreamController =
      StreamController.broadcast();
  final log = getLogger('CentrifugeService');

  Future connect() async {
    _client = centrifuge.createClient('$websocketUrl?format=protobuf',
        config: centrifuge.ClientConfig());

   
    _client!.connect();
  }

  void disconnect() async {
    _client!.disconnect();
  }

  void _showError(_error) {
    log.e(_error);
  }

  void _showLog(_message) {
    log.i(_message);
  }

  Future subscribe(String channel) async {
    _subscription = _client!.getSubscription(channel);

    _showLog(_subscription!.channel);

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
      log.i('WORK WORK RIGHT NOW ${json.decode(utf8.decode(event.data))}');

      messageStreamController.sink.add('Message Received');
      Map user_message = json.decode(utf8.decode(event.data));
    });

    _subscription!.subscribe();
  }

  void dispose() {
    messageStreamController.close();
  }
}
