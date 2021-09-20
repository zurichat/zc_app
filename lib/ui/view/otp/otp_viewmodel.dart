import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import '../../../app/app.router.dart';

class OtpViewModel extends BaseViewModel {
  navigatorToHome() {
    NavigationService().navigateTo(Routes.navBarView);
  }
}
