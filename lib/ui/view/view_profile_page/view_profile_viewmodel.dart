import 'package:hng/app/app.locator.dart';
import 'package:hng/app/app.router.dart';
import 'package:hng/models/profile_model.dart';
import 'package:hng/services/connectivity_service.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

ProfileModel userData = new ProfileModel();

class ViewProfileViewModel extends BaseViewModel {
  final _navigationService = locator<NavigationService>();
  final snackbar = locator<SnackbarService>();
  final connectivityService = locator<ConnectivityService>();

  void editProfile() {
    _navigationService.navigateTo(Routes.editProfileView);
  }
}
