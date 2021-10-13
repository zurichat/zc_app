import 'package:dio/dio.dart';
import 'package:zurichat/app/app.locator.dart';
import 'package:zurichat/app/app.router.dart';
import 'package:zurichat/package/base/server-request/api/zuri_api.dart';
import 'package:zurichat/services/local_storage_services.dart';
import 'package:zurichat/services/user_service.dart';
import 'package:zurichat/utilities/constants.dart';
import 'package:zurichat/utilities/mixins/validators_mixin.dart';
import 'package:zurichat/utilities/storage_keys.dart';
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

  inviteWithMail(String email) async {
    final orgId = userService.currentOrgId;
    final token = userService.authToken;
    await storage.clearData(StorageKeys.invitedEmail);
    if (validateEmail(email) == null) {
      setBusy(true);

      Map<String, dynamic> body = {
        "emails": [email],
      };
      try {
        final res = await _zuriApi.inviteToOrganizationWithNormalMail(
            orgId, body, token);
        log.i('>>>>>>>>> invite response : $res');
        setBusy(false);

        await storage.setString(StorageKeys.invitedEmail, email);
        navigateToInvitationSent();
      } on DioError catch (e) {
        log.w(e.toString());
        setBusy(false);
      }
    }
  }

// String get selectedEmail =>
  String? getInvitedMail() {
    return storage.getString(StorageKeys.invitedEmail) ?? '';
  }

  void navigateBack() {
    navigationService.back();
  }

  void navigateToHome() {
    navigationService.popRepeated(2);
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
