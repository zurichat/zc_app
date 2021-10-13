import 'package:zurichat/app/app.locator.dart';
import 'package:zurichat/app/app.router.dart';
import 'package:zurichat/models/user_model.dart';
import 'package:zurichat/services/user_service.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class CustomUserBottomSheetViewModel extends FutureViewModel {
  final _navigationService = locator<NavigationService>();
  final _userService = locator<UserService>();

  //UserModel? _userModel;

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
    Future.delayed(const Duration(seconds: 2));
  }

  String? get userID => _userService.memberId;
  String? get token => _userService.authToken;
  String? get orgId => _userService.currentOrgId;
  String? get email => _userService.userEmail;
  UserModel? get userModel => _userService.userDetails;
}
