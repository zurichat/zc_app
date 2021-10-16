import 'package:zurichat/app/app.locator.dart';
import 'package:zurichat/app/app.logger.dart';
import 'package:zurichat/app/app.router.dart';
import 'package:zurichat/models/user_model.dart';
import 'package:zurichat/package/base/server-request/api/zuri_api.dart';
import 'package:zurichat/services/user_service.dart';
import 'package:zurichat/utilities/constants.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class CustomUserBottomSheetViewModel extends FutureViewModel {
  final _log = getLogger('CustomUserBottomSheetViewModel');
  final _navigationService = locator<NavigationService>();
  final _userService = locator<UserService>();
  final _zuriApi = ZuriApi(coreBaseUrl);

  UserModel? _userModel;

  void navigateToSetStatus() =>
      _navigationService.navigateTo(Routes.setStatusView);

  void navigateToEditProfile() async {
    await _navigationService.navigateTo(
      Routes.editProfileView,
      arguments: EditProfileViewArguments(user: userModel!),
    );
    notifyListeners();
  }

  @override
  Future<void> futureToRun() async {
    try {
      final response = await _zuriApi
          .get('organizations/$orgId/members/$userID', token: token);
      _userModel = UserModel.fromJson(response!.data['data']);
      _userService.setUserDetails(_userModel!);
    } catch (e) {
      _log.e(e.toString());
    }
  }

  String? get userID => _userService.memberId;
  String? get token => _userService.authToken;
  String? get orgId => _userService.currentOrgId;
  String? get email => _userService.userEmail;
  UserModel? get userModel => _userService.userDetails;
}
