import 'package:stacked/stacked.dart';

//TODO refactor entire View Model, write as a Future View Model

class EditProfileViewModel extends BaseViewModel {
  final _navigationService = locator<NavigationService>();

  navigateBack() {
    _navigationService.back();
  }
}
