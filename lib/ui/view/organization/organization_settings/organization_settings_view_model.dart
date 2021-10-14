import 'dart:io';

import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:zurichat/app/app.locator.dart';
import 'package:zurichat/app/app.router.dart';
import 'package:zurichat/models/organization_model.dart';
import 'package:zurichat/package/base/server-request/api/zuri_api.dart';
import 'package:zurichat/services/media_service.dart';
import 'package:zurichat/services/user_service.dart';
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

  File? tempImage;

  void back() {
    navigation.back();
  }

  void navigateToWorkspaceName(OrganizationModel org) {
    navigation.navigateTo(
      Routes.organizationNameUrl,
      arguments: OrganizationNameUrlArguments(org: org),
    );
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
      final url = await _mediaService.uploadImage(tempImage, orgId);
      await _zuriApi.updateOrgLogo(orgId, url!, token);
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
    tempImage = await _mediaService.getImage(fromGallery: isCamera!.confirmed);
    notifyListeners();
  }

  String get token => _userService.authToken;

  Future<void> updateOrgNameAndUrl(
      String orgId, String orgName, String orgUrl) async {
    try {
      setBusy(true);
      await _zuriApi.updateOrgName(orgId, orgName, token);
      await _zuriApi.updateOrgUrl(orgId, orgUrl, token);
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
}
