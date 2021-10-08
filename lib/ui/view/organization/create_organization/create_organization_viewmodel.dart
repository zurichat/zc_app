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

class CreateOrganizationViewModel extends BaseViewModel {
  final log = getLogger("CreateOrganizationViewModel");
  final _navigation = locator<NavigationService>();
  final snackbar = locator<SnackbarService>();
  final _channelApiService = locator<ChannelsApiService>();
  final _api = OrganizationApiService();
  String company = '';
  String project = '';
  String invite = '';
  bool? _checkBoxVal = false;
  late OrganizationModel? org;

  late String email = '';

  void init(String _email) {
    email = _email;
  }

  void back() => _navigation.back();

  void onCheckBoxChanged(bool? value) {
    _checkBoxVal = value;
    notifyListeners();
  }

  void onInviteTap() {
    snackbar.showCustomSnackBar(
        message: ComingSoon, variant: SnackbarType.failure);
  }

  void updateData({String? comp, String? proj, String? invi}) {
    if (comp != null) company = comp;
    if (proj != null) project = proj;
    if (invi != null) invite = invi;
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
          userIdInOrg: '');
    } catch (e) {
      log.e(e.toString());
      snackbar.showSnackbar(message: e.toString());
    }
  }

  Future<bool> onCompanyNext() async {
    if (company.isEmpty) {
      snackbar.showCustomSnackBar(
          message: fillAllFields, variant: SnackbarType.failure);
      return false;
    }
    setBusy(true);
    org = await createOrganization(email, company);
    setBusy(false);
    if (org != null) {
      return true;
    }
    return false;
  }

  Future<bool> addProject() async {
    if (project.isEmpty) {
      snackbar.showCustomSnackBar(
          message: fillAllFields, variant: SnackbarType.failure);
      return false;
    }
    final res = await _channelApiService.createChannels(
      name: project,
      description: 'First channel for your organization',
      private: false,
      email: email,
      id: org!.id!,
    );

    if (res) {
      return true;
    } else {
      snackbar.showCustomSnackBar(
          message: errorOccurred, variant: SnackbarType.failure);
      return false;
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
