import 'package:hng/app/app.router.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class OtpViewModel extends BaseViewModel {
  navigatorToHome() {
    NavigationService().navigateTo(Routes.homePage);
  }
}
