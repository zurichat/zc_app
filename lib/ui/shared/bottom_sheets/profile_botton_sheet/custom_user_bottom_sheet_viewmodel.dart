import 'package:hng/services/current_user_profile.dart';
import 'package:hng/services/local_storage_services.dart';
import 'package:hng/utilities/storage_keys.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import '../../../../app/app.locator.dart';
import '../../../../app/app.router.dart';
import '../../../../models/user_model.dart';

final storageService = locator<SharedPreferenceLocalStorage>();

class CustomUserBottomSheetViewModel extends BaseViewModel {
  String photoUrl =
      storageService.getString(StorageKeys.currentOrgId).toString();

  String name = storageService.getString(StorageKeys.firstName).toString();

  String displayName =
      storageService.getString(StorageKeys.displayName).toString();

  String phoneNum = storageService.getString(StorageKeys.phone_num).toString();

  String profileText = storageService.getString(StorageKeys.status).toString();

  final snackbar = locator<SnackbarService>();

  final _navigationService = locator<NavigationService>();

  UserModel? _userModel;

  void navigateToSetStatus() =>
      _navigationService.navigateTo(Routes.setStatusView);

  void navigateToEditProfile() =>
      _navigationService.navigateTo(Routes.editProfileView);

//Fetches User data profile data
  void fetchUser() async {
    await GetUserProfile().currentUser();
  }

  UserModel? get userModel => _userModel;
}
