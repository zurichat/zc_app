import 'package:dio/dio.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hng/app/app.locator.dart';
import 'package:hng/app/app.router.dart';
import 'package:hng/package/base/server-request/api/zuri_api.dart';
import 'package:hng/services/local_storage_services.dart';
import 'package:hng/services/user_service.dart';
import 'package:hng/utilities/constants.dart';
import 'package:hng/utilities/mixins/validators_mixin.dart';
import 'package:hng/utilities/storage_keys.dart';
import 'package:stacked/stacked.dart';
import '../../../../../../app/app.logger.dart';
import 'package:stacked_services/stacked_services.dart';

class InviteViewModel extends FormViewModel with ValidatorMixin {
  final storage = locator<SharedPreferenceLocalStorage>();
  final userService = locator<UserService>();
  final navigationService = locator<NavigationService>();
  final snackbar = locator<SnackbarService>();
  final log = getLogger('InviteEmailView');
  final _zuriApi = ZuriApi(coreBaseUrl);
  bool isLoading = false;

  inviteWithMail(String email) async {
    final orgId = userService.currentOrgId;
    final token = userService.authToken;
    if (validateEmail(email) == null) {
      isLoading = true;
      notifyListeners();
      Map<String, dynamic> body = {
        "user_id": email,
      };
      try {
        final res = await _zuriApi.inviteToOrganizationWithNormalMail(
            orgId, body, token);
        log.i('>>>>>>>>> invite response : $res');
        isLoading = false;
        notifyListeners();
        if (res != null) navigateToInvitationSent();
      } on DioError catch (e) {
        log.w(e.toString());
        isLoading = false;
        notifyListeners();
      }
      await storage.setString(StorageKeys.invitedEmail, email);
    }
  }

  void navigateBack() {
    navigationService.back();
  }

  void navigateToContacts() {
    navigationService.navigateTo(Routes.importContacts);
  }

  void navigateToInvitationSent() {
    navigationService.navigateTo(Routes.invitationSent);
  }

  @override
  void setFormStatus() {
    // TODO: implement setFormStatus
  }
}
