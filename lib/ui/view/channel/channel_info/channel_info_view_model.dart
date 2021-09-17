import 'package:hng/app/app.locator.dart';
import 'package:hng/app/app.router.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class ChannelInfoViewModel extends BaseViewModel {
  void navigateToEditChannel() {
    locator<NavigationService>().navigateTo(Routes.channelInfoEdit);
  }
}
