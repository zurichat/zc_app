import 'package:hng/models/user_search_model.dart';
import 'package:hng/package/base/server-request/api/zuri_api.dart';

import '../../../../app/app.locator.dart';
import '../../../../app/app.logger.dart';
import '../../../../models/organization_model.dart';
import '../../../../services/local_storage_services.dart';
import '../../../../services/user_service.dart';
import '../../../../ui/shared/shared.dart';
import '../../../../utilities/storage_keys.dart';

class OrganizationApiService {
  final log = getLogger('OrganizationApiService');
  final zuriApi = locator<ZuriApi>();
  final storageService = locator<SharedPreferenceLocalStorage>();
  static final _userService = locator<UserService>();
  final email = _userService.userEmail;
  final orgId = _userService.currentOrgId;
  final id = _userService.userId;

  /// Fetches a list of organizations that exist in the zuri database
  /// This does not fetch the Organization the user belongs to
  /// To implement that use `getJoinedOrganizations()`
  Future<List<OrganizationModel>> fetchListOfOrganizations() async {
    final res = await zuriApi.fetchListOfOrganizations(token);
    return res;
    // final res = await zuriApi.get(
    //   '/organizations',
    //    token: token,
    // );
    // log.i(res?.data?['data'].length);
    // return (res?.data?['data'] as List)
    //     .map((e) => OrganizationModel.fromJson(e))
    //     .toList();
  }

  ///Get the list of Organization the user has joined
  Future<List<OrganizationModel>> getJoinedOrganizations() async {
    final res = await zuriApi.getJoinedOrganizations(token, email);
    return res;
    // final res = await zuriApi.get(
    //   '/users/$email/organizations',
    //   token: token,
    // );
    // log.i(res?.data?['data']);
    // print(res?.data);
    // if (res?.data['data'] == null) {
    //   return [];
    // }
    // return (res?.data?['data'] as List)
    //     .map((e) => OrganizationModel.fromJson(e))
    //     .toList();
  }

  /// Fetches information on a particular Organization. It takes a parameter
  /// `id` which is the id of the organization
  Future<OrganizationModel> fetchOrganizationInfo() async {
    final res = await zuriApi.fetchOrganizationInfo(id, token);
    return res;
    // final res = await zuriApi.get(
    //   '/organizations/$id',
    //   token: token,
    // );
    // return OrganizationModel.fromJson(res?.data?['data']);
  }

  /// takes in a `url` and returns a Organization that matches the url
  /// use this url for testing `zurichat-fsp1856.zurichat.com`
  Future<OrganizationModel> fetchOrganizationByUrl(String url) async {
    final res = await zuriApi.fetchOrganizationByUrl(url, token);
    return res;
    // final res = await zuriApi.get(
    //   '/organizations/url/$url',
    //   token: token,
    // );
    // log.i(res?.data);
    // print(res?.data);

    // res?.data?['data']['id'] = res.data['data']['_id'];
    // return OrganizationModel.fromJson(res?.data?['data']);
  }

  ///Limited to the admin who created the org
  ///
  ///This should be used to add users to an organization by the admin user alone
  /// takes in a `Organization id` and joins the Organization
  Future<bool> joinOrganization() async {
    final res = await zuriApi.joinOrganization(orgId, email, token);
    return res;
    // final res = await zuriApi.post(
    //   '/organizations/$orgId/members',
    //   body: {'user_email': email},
    //   token: token,
    // );

    // if (res?.statusCode == 200) {
    //   return true;
    // }

    // return false;
  }

  /// This method creates an organization. Creator email `email` must be present
  ///
  Future<String> createOrganization(String email) async {
    final res = await zuriApi.createOrganization(email, token);
    return res;
    // final res = await zuriApi.post(
    //   '/organizations',
    //   token: token,
    //   body: {'creator_email': email},
    // );
    // return res?.data?['data']['InsertedID'];
  }

  /// Updates an organization's URL. The organization's id `orgId` must not be
  /// null or empty. Url must not begin with `https` or `http`
  Future<void> updateOrgUrl(String orgId, String url) async {
    final res = await zuriApi.updateOrgUrl(orgId, url, token);
    return res;
    // final res = await zuriApi.patch(
    //   '/organizations/$orgId/url',
    //   token: token,
    //   body: {'url': url},
    // );
    // return res?.data?['message'];
  }

  /// Updates an organization's name. The organization's id `orgId` must not be
  /// null or empty
  Future<void> updateOrgName(String orgId, String name) async {
    final res = await zuriApi.updateOrgName(orgId, name, token);
    return res;
    // final res = await zuriApi.patch(
    //   '/organizations/$orgId/name',
    //   token: token,
    //   body: {'organization_name': name},
    // );
    // return res?.data?['message'];
  }

  /// Updates an organization's logo. The organization's id `orgId` must not be
  /// null or empty
  Future<void> updateOrgLogo(String orgId, String url) async {
    final res = await zuriApi.updateOrgLogo(orgId, url, token);
    return res;
    // final res = await zuriApi.patch(
    //   '/organizations/$orgId/logo',
    //   token: token,
    //   body: {'url': url},
    // );
    // return res?.data?['message'];
  }

  Future<void> addMemberToOrganization(String orgId, String email) async {
    final res = await zuriApi.addMemberToOrganization(orgId, email, token);
    return res;
    // final res = await zuriApi.post(
    //   '/organizations/$orgId/members',
    //   token: token,
    //   body: {'user_email': email},
    // );
    // return res?.data?['message'];
  }

  Future<List<UserSearch>> fetchMembersInOrganization() async {
    final res = await zuriApi.fetchMembersInOrganization(orgId, token);
    return res;
    // final res = await zuriApi.get(
    //   '/organizations/$orgId/members',
    //   token: token,
    // );
    // if (res?.data['data'] == null) {
    //   return [];
    // }
    // return (res?.data?['data'] as List)
    //     .map((e) => UserSearch.fromJson(e))
    //     .toList();
  }

  String? get token =>
      storageService.getString(StorageKeys.currentSessionToken);
}
