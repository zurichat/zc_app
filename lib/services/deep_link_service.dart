import 'dart:async';

import 'package:zurichat/utilities/utilities.dart';
import 'package:uni_links/uni_links.dart';
import 'package:flutter/services.dart' show PlatformException;

class DeepLinkService {
  StreamController deepLinkController = StreamController.broadcast();
  StreamSubscription? _sub;

  Future<void> initUniLinks() async {
    // Platform messages may fail, so we use a try/catch PlatformException.
    try {
      final initialLink = await getInitialLink();
      log.i(initialLink);

      //TODO: parse the uri here
    } on PlatformException {
      // Handle exception by warning the user their action did not succeed
      // return?
    }
  }

  listen() {
    // Attach a listener to the stream
    _sub = uriLinkStream.listen((Uri? uri) {
      if (uri != null) {
        deepLinkController.add('ADD the info herre');
      }
    }, onError: (err) {
      // Handle exception by warning the user their action did not succeed
    });
  }

  Stream get stream => uriLinkStream;

  stopListening() {
    _sub?.cancel();
  }
}
