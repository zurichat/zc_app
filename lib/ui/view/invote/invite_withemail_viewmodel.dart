import 'package:hng/app/app.locator.dart';
import 'package:hng/package/base/server-request/api/zuri_api.dart';
import 'package:hng/services/local_storage_services.dart';
import 'package:hng/services/user_service.dart';
import 'package:hng/utilities/mixins/validators_mixin.dart';
import 'package:stacked/stacked.dart';
import '../../../../app/app.logger.dart';

class InviteEmailViewModel extends BaseViewModel with ValidatorMixin {
  final storage = locator<SharedPreferenceLocalStorage>();
  final userService = locator<UserService>();
  final log = getLogger('InviteEmailView');
  final _zuriApi = locator<ZuriApi>();
  inviteWithMail(String email) {
    final orgId = userService.currentOrgId;
    final token = userService.authToken;
    if (validateEmail(email) == null) {
      Map<String, dynamic> body = {
        "user_id": email,
      };
      final res =
          _zuriApi.inviteToOrganizationWithNormalMail(orgId, body, token);
      log.i('>>>>>>>>>>>>>>>>> invite response : $res');
    }
  }
}
