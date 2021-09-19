import 'dart:developer';

import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import '../../../app/app.locator.dart';
import '../../../app/app.router.dart';
import '../../../services/connectivity_service.dart';

final _navigationService = locator<NavigationService>();
final connectivityService = locator<ConnectivityService>();

bool connectionStatus = false;

class HomePageViewModel extends StreamViewModel {
  void nToPref() {
    _navigationService.navigateTo(Routes.fileSearchView);
  }

  void nToInfo() {
    _navigationService.navigateTo(Routes.channelInfoView);
  }

  void nToWorkspace() {
    _navigationService.navigateTo(Routes.workspaceView);
  }

  void navigateToDmUser() {
    _navigationService.navigateTo(Routes.dmUserView);
  }

  void navigateToThreads() async {
    await _navigationService.navigateTo(Routes.threadsView);
  }

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
