import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import '../../../app/app.router.dart';

//final _navigationService = locator<NavigationService>();

class HomePageViewModel extends BaseViewModel {
  nToPref() {
    NavigationService().navigateTo(Routes.preferenceView);
  }

  nToWorkspace() {
    NavigationService().navigateTo(Routes.workspaceView);
  }
}
