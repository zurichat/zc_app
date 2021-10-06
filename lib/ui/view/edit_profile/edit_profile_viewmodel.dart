import 'package:hng/app/app.locator.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

//TODO refactor entire View Model, write as a Future View Model

class EditProfileViewModel extends BaseViewModel {
  final _navigationService = locator<NavigationService>();

  navigateBack() {
    _navigationService.back();
  }
}
