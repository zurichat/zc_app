import 'dart:async';
import 'dart:developer';

import 'package:hng/app/app.locator.dart';
import 'package:hng/services/connectivity_service.dart';
import 'package:stacked/stacked.dart';

class StartupViewModel extends StreamViewModel<bool> {
  // Service locator for connectivity service.
  final _connectivityService = locator<ConnectivityService>();
  bool onlineStatus = false;

  bool get status {
    stream.listen((event) {
      onlineStatus = event;
      notifyListeners();
    });
    return onlineStatus;
  }

  Stream<bool> checkConnectivity() async* {
    yield await _connectivityService.checkConnection();
    // throw Exception("This is an error");
  }

  @override
  void onError(error) {
    log('ERRORRR!!: $error');
  }

  @override
  Stream<bool> get stream => checkConnectivity();
}
