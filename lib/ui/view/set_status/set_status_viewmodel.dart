import 'package:hng/package/base/server-request/api/zuri_api.dart';
import 'package:hng/utilities/constants.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import 'package:hng/app/app.locator.dart';
import 'package:hng/app/app.router.dart';

class SetStatusViewModel extends FormViewModel {
  final _navigationService = locator<NavigationService>();
  final _zuriApi = ZuriApi(coreBaseUrl);

  void exitPage() {
    _navigationService.back();
  }

  Future clearAfter() async {
    await _navigationService.navigateTo(Routes.clearAfterView);
  }

  saveStatus()async {
final response = _zuriApi.patch(path)
  }

  @override
  void setFormStatus() {
    
  }
}
