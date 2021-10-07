import 'package:hng/app/app.locator.dart';
import 'package:hng/app/app.logger.dart';
import 'package:hng/app/app.router.dart';
import 'package:hng/models/user_model.dart';
import 'package:hng/package/base/server-request/api/zuri_api.dart';
import 'package:hng/services/user_service.dart';
import 'package:hng/utilities/constants.dart';
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
      final response =
          await _zuriApi.get('organizations/$orgId/members?query=$email',
              token: token);
      _userModel = UserModel.fromJson((response!.data['data'] as List).first);
      _userService.setUserDetails(_userModel!);
    } catch (e) {
      _log.e(e.toString());
    }
  }

  String? get userID => _userService.userId;
  String? get token => _userService.authToken;
  String? get orgId => _userService.currentOrgId;
  String? get email => _userService.userEmail;
  UserModel? get userModel => _userService.userDetails;
}
