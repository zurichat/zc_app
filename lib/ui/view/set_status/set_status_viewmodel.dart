import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import '../../../app/app.locator.dart';
import '../../../app/app.router.dart';

class SetStatusViewModel extends BaseViewModel {
  final _navigationService = locator<NavigationService>();

  void exitPage() {
    _navigationService.back();
  }

  Future clearAfter() async {
    await _navigationService.navigateTo(Routes.clearAfterView);
  }
}
