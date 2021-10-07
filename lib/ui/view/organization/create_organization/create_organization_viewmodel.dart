import 'package:flutter/animation.dart';
import 'package:hng/app/app.logger.dart';
import 'package:hng/constants/app_strings.dart';
import 'package:hng/package/base/server-request/channels/channels_api_service.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import '../../../../app/app.locator.dart';
import '../../../../app/app.router.dart';
import '../../../../models/organization_model.dart';
import '../../../../package/base/server-request/organization_request/organization_api_service.dart';
import '../../../../utilities/enums.dart';
// import '../../../../services/local_storage_services.dart';

class CreateOrganizationViewModel extends BaseViewModel {
  final log = getLogger("CreateOrganizationViewModel");
  final _navigation = locator<NavigationService>();
  final snackbar = locator<SnackbarService>();
  final _channelApiService = locator<ChannelsApiService>();
  // final _storage = locator<SharedPreferenceLocalStorage>();
  final _api = OrganizationApiService();
  String company = '';
  String project = '';
  String invite = '';
  bool? _checkBoxVal = false;
  late OrganizationModel? org;

  // ignore_for_file: prefer_typing_uninitialized_variables
  late final pageController;
  late final email;

  void init(dynamic val, String _email) {
    pageController = val;
    email = _email;
  }

  void back() => _navigation.back();

  void next() {
    pageController.nextPage(
      duration: const Duration(seconds: 1),
      curve: Curves.ease,
    );
  }

  void onCheckBoxChanged(bool? value) {
    _checkBoxVal = value;
    notifyListeners();
  }

  void onInviteTap() {
    snackbar.showCustomSnackBar(
        message: ComingSoon, variant: SnackbarType.failure);
  }

  Future<OrganizationModel?> createOrganization(
      String email, String name) async {
    try {
      final organization = name.toLowerCase();
      final id = await _api.createOrganization(email);
      await _api.updateOrgName(id, name);
      await _api.updateOrgUrl(id, '$organization.zurichat.com');
      // await _api.updateOrgLogo(id, org.logoUrl!);
      if (id.isEmpty) {
        snackbar.showCustomSnackBar(
            message: errorOccurred, variant: SnackbarType.failure);
        return null;
      }
      return OrganizationModel(
        id: id,
        name: name,
        organizationUrl: '$organization.zurichat.com',
        logoUrl: null,
        time: null,
        isOwner: true,
        noOfMembers: 0,
      );
    } catch (e) {
      log.e(e.toString());
      snackbar.showSnackbar(message: e.toString());
    }
  }

  Future<void> onCompanyNext(String email) async {
    if (company.isEmpty) {
      return snackbar.showCustomSnackBar(
          message: fillAllFields, variant: SnackbarType.failure);
    }
    setBusy(true);
    org = await createOrganization(email, company);
    setBusy(false);
    if (org != null) next();
  }

  Future<void> addProject() async {
    if (project.isEmpty) {
      return snackbar.showCustomSnackBar(
          message: fillAllFields, variant: SnackbarType.failure);
    }
    final res = await _channelApiService.createChannels(
      name: project,
      description: 'First channel for your organization',
      private: false,
      email: email!,
      id: org!.id!,
    );

    if (res) {
      next();
    } else {
      return snackbar.showCustomSnackBar(
          message: errorOccurred, variant: SnackbarType.failure);
    }
  }

  Future<void> addTeammates() async {
    if (invite.isEmpty) {
      return snackbar.showCustomSnackBar(
          message: fillAllFields, variant: SnackbarType.failure);
    }
    if (org == null) {
      log.e('Org is null');
      return snackbar.showCustomSnackBar(
        message: errorOccurred,
        variant: SnackbarType.failure,
      );
    }
    setBusy(true);
    await _api.addMemberToOrganization(org!.id!, invite);
    setBusy(false);
    _navigation
        .popUntil((route) => route.settings.name == Routes.organizationView);
  }

  bool? get checkBoxVal => _checkBoxVal;
}
