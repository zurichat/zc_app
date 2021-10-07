import 'package:hng/app/app.locator.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class DirectMessageViewModel extends BaseViewModel {
  final _navigationService = locator<NavigationService>();

  navigateBack() {
    _navigationService.back();
  }
}
