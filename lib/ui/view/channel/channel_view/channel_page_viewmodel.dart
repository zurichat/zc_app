import 'package:hng/app/app.router.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class ChannelPageViewModel extends BaseViewModel {
  navigateToChannelInfo() {
    NavigationService().navigateTo(Routes.channelInfoView);
  }
}
