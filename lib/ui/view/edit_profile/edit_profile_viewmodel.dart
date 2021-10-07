import 'package:hng/app/app.locator.dart';
import 'package:hng/models/user_model.dart';
import 'package:hng/package/base/server-request/api/zuri_api.dart';
import 'package:hng/services/user_service.dart';
import 'package:hng/utilities/constants.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

//TODO refactor entire View Model, write as a Future View Model

class EditProfileViewModel extends BaseViewModel {
  final _navigationService = locator<NavigationService>();
  final _userService = locator<UserService>();
  final _zuriApi = ZuriApi(coreBaseUrl);

  late UserModel userModel;
  String fullName = '';
  String phone = '';
  String track = '';
  String displayName = '';

  void navigateBack() {
    _navigationService.back();
  }

  void onInit(UserModel user) {
    userModel = user;
  }

  UserModel updateData() {
    userModel
      ..firstName =
          fullName.isNotEmpty ? fullName.split(" ").first : userModel.firstName
      ..lastName =
          fullName.isNotEmpty ? fullName.split(" ").last : userModel.lastName
      ..displayName =
          displayName.isNotEmpty ? displayName : userModel.displayName
      ..phoneNumber = phone.isNotEmpty ? phone : userModel.phoneNumber;

    return userModel;
  }

  Future<void> onSave() async {
    updateData();
    await _zuriApi.patch(
      'organizations/$orgId/members/$userId/profile',
      body: userModel.toMap(),
      token: token,
    );
    _userService.setUserDetails(userModel);
    _navigationService.back();
  }

  void close() => _navigationService.back();

  String? get userId => _userService.userId;
  String? get orgId => _userService.currentOrgId;
  String? get email => _userService.userEmail;
  String? get token => _userService.authToken;
}
