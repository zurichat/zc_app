import 'dart:developer';

import 'package:hng/services/connectivity_service.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import '../../app/app.locator.dart';

class HomeViewModel extends StreamViewModel {
  final navigator = locator<NavigationService>();

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
