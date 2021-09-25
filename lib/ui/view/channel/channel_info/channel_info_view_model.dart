import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import '../../../../app/app.locator.dart';
import '../../../../app/app.router.dart';

class ChannelInfoViewModel extends BaseViewModel {
  final _navigationService = locator<NavigationService>();

  void navigateToEditChannel() {
    _navigationService.navigateTo(Routes.editChannelPageView);
  }

  void navigateToAddPeopleChannel() {
    _navigationService.navigateTo(Routes.addPeopleView);
  }

  void navigateToMembersList() {}
  // _navigationService.navigateTo(Routes.editChannelPage);
}


