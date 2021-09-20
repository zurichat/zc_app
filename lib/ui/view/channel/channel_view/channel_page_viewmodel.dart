import 'package:hng/app/app.locator.dart';
<<<<<<< Updated upstream
import 'package:hng/app/app.router.dart';
=======
>>>>>>> Stashed changes
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class ChannelPageViewModel extends BaseViewModel {
  final _navigationService = locator<NavigationService>();

<<<<<<< Updated upstream
  navigateToChannelInfo() {
    _navigationService.navigateTo(Routes.channelInfoView);
  }

  navigateToAddPeople() {
    _navigationService.navigateTo(Routes.addPeopleView);
  }
}
=======
final _navigationService = locator<NavigationService>();

void closePage(){
  _navigationService.back();
}

>>>>>>> Stashed changes
