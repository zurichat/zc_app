import 'dart:io';

import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:zurichat/app/app.locator.dart';
import 'package:zurichat/app/app.router.dart';
import 'package:zurichat/models/organization_model.dart';
import 'package:zurichat/utilities/api_handlers/zuri_api.dart';
import 'package:zurichat/services/app_services/media_service.dart';
import 'package:zurichat/services/in_review/user_service.dart';
import 'package:zurichat/ui/shared/shared.dart';
import 'package:zurichat/utilities/enums.dart';
import 'package:zurichat/utilities/mixins/validators_mixin.dart';
import '../../../../app/app.logger.dart';

class OrganizationSettingsViewModel extends BaseViewModel with ValidatorMixin {
  final log = getLogger('OrganizationSettingsViewModel');
  final navigation = locator<NavigationService>();
  final snackbar = locator<SnackbarService>();
  final dialog = locator<DialogService>();
  final _mediaService = locator<MediaService>();
  final _userService = locator<UserService>();
  final _zuriApi = ZuriApi(coreBaseUrl);
  late String name, url;

  File? tempImage;

  void init(String name, String url) {
    name = name;
    url = url;
  }

  void back() {
    navigation.back();
  }

  void navigateToWorkspaceName(OrganizationModel org) {
    //TODO: getting ready
    // navigation.navigateTo(
    //   Routes.organizationNameUrl,
    //   arguments: OrganizationNameUrlArguments(org: org),
    // );
  }

  void navigateToWorkspaceLogo(OrganizationModel org) {
    navigation.navigateTo(
      Routes.organizationLogo,
      arguments: OrganizationLogoArguments(org: org),
    );
  }

  Future<void> updateOrgLogo(String orgId) async {
    try {
      setBusy(true);
      if (tempImage == null) return;
      await _zuriApi.updateOrgLogo(orgId, tempImage!, token);
      setBusy(false);
      navigation
          .popUntil((route) => route.settings.name == Routes.organizationView);
      snackbar.showCustomSnackBar(
          variant: SnackbarType.success, message: 'Update Successful');
    } catch (e) {
      setBusy(false);
      log.e(e.toString());
      snackbar.showCustomSnackBar(
          variant: SnackbarType.failure,
          message: 'Error Updating Workspace logo');
    }
  }

  Future<void> selectImage() async {
    final isCamera =
        await dialog.showCustomDialog(variant: DialogType.imageSource);
    if (isCamera?.confirmed == null) return;
    tempImage = await _mediaService.getImage(fromGallery: !isCamera!.confirmed);
    notifyListeners();
  }

  Future<void> updateOrgNameAndUrl(
      String orgId, String orgName, String orgUrl) async {
    try {
      final parsedUrl = '$orgUrl.zurichat.com';

      setBusy(true);
      if (orgName != name) await _zuriApi.updateOrgName(orgId, orgName, token);
      if (orgUrl != url) await _zuriApi.updateOrgUrl(orgId, parsedUrl, token);
      setBusy(false);
      navigation
          .popUntil((route) => route.settings.name == Routes.organizationView);
      snackbar.showCustomSnackBar(
          variant: SnackbarType.success, message: 'Update Successful');
    } catch (e) {
      setBusy(false);
      log.e(e.toString());
      snackbar.showCustomSnackBar(
          variant: SnackbarType.failure, message: 'Update not successful');
    }
  }

  String get token => _userService.authToken;
}
