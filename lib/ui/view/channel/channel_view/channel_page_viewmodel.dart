import 'package:hng/app/app.router.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class ChannelPageViewModel extends BaseViewModel {
  void navigateToChannelInfoScreen() {
    NavigationService().navigateTo(Routes.channelInfoView);
  }

  void goBack() {
    NavigationService().back();
  }
}
