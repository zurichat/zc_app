import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import '../../../app/app.router.dart';

class HomePageViewModel extends BaseViewModel {
  nToPref() {
    NavigationService().navigateTo(Routes.preferenceView);
  }

  nToInfo() {
    NavigationService().navigateTo(Routes.channelInfoView);
  }
}
