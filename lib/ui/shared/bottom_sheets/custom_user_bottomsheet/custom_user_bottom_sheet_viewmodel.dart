import 'package:hng/app/app.locator.dart';
import 'package:hng/app/app.router.dart';
import 'package:hng/package/base/server-request/api/zuri_api.dart';
import 'package:hng/services/current_user_profile.dart';
import 'package:hng/services/local_storage_services.dart';
import 'package:hng/utilities/constants.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:hng/models/profile_model.dart';

class CustomUserBottomSheetViewModel extends FutureViewModel {
  final _navigationService = locator<NavigationService>();
  final storage = locator<SharedPreferenceLocalStorage>();
  ProfileModel currentUserData = ProfileModel();
  final zuriApi = ZuriApi(coreBaseUrl);

  @override
  Future futureToRun() async {
    setBusy(true);
    currentUserData = await GetUserProfile().currentUser();
    setBusy(false);
  }
  void navigateToSetStatus() =>
      _navigationService.navigateTo(Routes.setStatusView);

  void navigateToEditProfile() =>
      _navigationService.navigateTo(Routes.editProfileView);
}
