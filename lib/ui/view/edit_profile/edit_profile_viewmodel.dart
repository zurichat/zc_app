import 'package:hng/app/app.locator.dart';
import 'package:hng/constants/app_strings.dart';
import 'package:hng/models/user_model.dart';
import 'package:hng/package/base/server-request/api/zuri_api.dart';
import 'package:hng/services/user_service.dart';
import 'package:hng/utilities/constants.dart';
import 'package:hng/utilities/enums.dart';
import 'package:hng/utilities/mixins/validators_mixin.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

//TODO refactor entire View Model, write as a Future View Model

class EditProfileViewModel extends BaseViewModel with ValidatorMixin {
  final _navigationService = locator<NavigationService>();
  final _userService = locator<UserService>();
  final _snackbarService = locator<SnackbarService>();
  final _zuriApi = ZuriApi(coreBaseUrl);

  late UserModel userModel;
  String fullName = '';
  String phone = '';
  String bio = '';
  String displayName = '';

  void navigateBack() {
    _navigationService.back();
  }

  void onInit(UserModel user) {
    userModel = user;
    fullName = user.fullName ?? '';
    phone = user.phoneNumber ?? '';
    displayName = user.displayName ?? '';
    bio = user.bio ?? '';
  }

  void setState() => notifyListeners();

  UserModel updateData() {
    if (validateNotEmptyField(fullName) != null) {
      _snackbarService.showCustomSnackBar(
          message: 'Fullname cannot be null', variant: SnackbarType.failure);
    }
    fullName = fullName.trim();
    userModel
      ..firstName =
          fullName.isNotEmpty ? fullName.split(" ").first : userModel.firstName
      ..lastName =
          fullName.isNotEmpty ? fullName.split(" ").last : userModel.lastName
      ..displayName = displayName
      ..bio = bio
      ..phoneNumber = phone;

    return userModel;
  }

  Future<void> onSave() async {
    if (!hasDataChanged) {
      return;
    }
    updateData();
    final res = await _zuriApi.patch(
      'organizations/$orgId/members/$userId/profile',
      body: userModel.toMap(),
      token: token,
    );
    if (res?.statusCode == 200) {
      _snackbarService.showCustomSnackBar(
          message: profileUpdated, variant: SnackbarType.success);
      _userService.setUserDetails(userModel);
      close();
    } else {
      _snackbarService.showCustomSnackBar(
          message: errorOccurred, variant: SnackbarType.failure);
    }
  }

  void close() => _navigationService.back();

  String? get userId => _userService.memberId;
  String? get orgId => _userService.currentOrgId;
  String? get email => _userService.userEmail;
  String? get token => _userService.authToken;
  bool get hasDataChanged {
    if (displayName != userModel.displayName ||
        bio != userModel.bio ||
        phone != userModel.phoneNumber ||
        (fullName.isNotEmpty && fullName != userModel.fullName)) {
      return true;
    }
    else {
      return false;
    }
  }
}
