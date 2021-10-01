import 'package:hng/app/app.locator.dart';
import 'package:hng/app/app.router.dart';
import 'package:hng/models/profile_model.dart';
import 'package:hng/services/connectivity_service.dart';
import 'package:hng/services/current_user_profile.dart';
import 'package:hng/services/local_storage_services.dart';
import 'package:hng/utilities/storage_keys.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class ViewProfileViewModel extends FutureViewModel {
  final _navigationService = locator<NavigationService>();
  final snackbar = locator<SnackbarService>();
  final connectivityService = locator<ConnectivityService>();
  final storageService = locator<SharedPreferenceLocalStorage>();

  ProfileModel userData = ProfileModel();
  bool isActive = true;

  get status => storageService.getString(StorageKeys.status).toString();

  get currentUserEmail =>
      storageService.getString(StorageKeys.currentUserEmail).toString();

  void editProfile() {
    _navigationService.navigateTo(Routes.editProfileView);
  }

  @override
  Future futureToRun() async {
    setBusy(true);
    userData = await GetUserProfile().currentUser();
    setBusy(false);
    throw UnimplementedError();
  }
}
