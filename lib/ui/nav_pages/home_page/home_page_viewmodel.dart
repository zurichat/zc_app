import 'package:hng/app/app.router.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class HomePageViewModel extends BaseViewModel {
  nToPref() {
    NavigationService().navigateTo(Routes.preferenceView);
  }
}
