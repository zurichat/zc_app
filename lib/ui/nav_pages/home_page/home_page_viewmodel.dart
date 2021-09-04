import 'dart:developer';

import 'package:hng/app/app.locator.dart';
import 'package:hng/services/connectivity_service.dart';
import 'package:stacked/stacked.dart';

class HomePageViewModel extends StreamViewModel {
  final connectivityService = locator<ConnectivityService>();

  bool connectionStatus = false;
  
  @override
  void onError(error) {
    log('Error: $error');
  }
  
  @override
  void onSubscribed() {}

  Stream<bool> checkConnectivity() async* {
    yield await connectivityService.checkConnection();
  }

  @override
  Stream get stream => checkConnectivity();

  bool get status {
    this.stream.listen((event) {
      connectionStatus = event;
      notifyListeners();
    }); 
    return connectionStatus;
  }
}
