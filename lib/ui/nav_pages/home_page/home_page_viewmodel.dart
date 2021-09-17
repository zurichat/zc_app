import 'dart:developer';

import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import '../../../app/app.locator.dart';
import '../../../app/app.router.dart';
import '../../../services/connectivity_service.dart';

//final _navigationService = locator<NavigationService>();

class HomePageViewModel extends StreamViewModel {
  void nToPref() {
    NavigationService().navigateTo(Routes.fileSearchView);
  }

  void nToInfo() {
    NavigationService().navigateTo(Routes.channelInfoView);
  }

  void nToWorkspace() {
    NavigationService().navigateTo(Routes.workspaceView);
  }

  void navigateToDmUser() {
    locator<NavigationService>().navigateTo(Routes.dmUserView);
  }
  void navigateToDmJumpToView() {
    locator<NavigationService>().navigateTo(Routes.dmJumpToView);
  }

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
    stream.listen((event) {
      connectionStatus = event;
      notifyListeners();
    });
    return connectionStatus;
  }
}
