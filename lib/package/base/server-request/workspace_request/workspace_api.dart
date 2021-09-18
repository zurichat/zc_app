import '../../../../app/app.locator.dart';
import '../../../../models/workspace_model.dart';
import '../../../../services/local_storage_services.dart';
import '../../../../utilities/storage_keys.dart';
import '../api/http_api.dart';

class WorkSpaceApi {
  final _api = HttpApiService();
  final storageService = locator<SharedPreferenceLocalStorage>();

  /// Fetches a list of organizations that the user is part of
  Future<List<WorkspaceModel>> fetchListOfOrganizations() async {
    final res = await _api.get(
      '/organizations',
      headers: {'Authorization': 'Bearer $token'},
    );
    print(res?.data?['data'].length);
    return (res?.data?['data'] as List)
        .map((e) => WorkspaceModel.fromJson(e))
        .toList();
  }

  /// Fetches information on a particular Organization. It takes a parameter
  /// `id` which is the id of the organization
  Future<WorkspaceModel> fetchOrganizationInfo(String id) async {
    final res = await _api.get(
      '/organizations/$id',
      headers: {'Authorization': 'Bearer $token'},
    );
    return WorkspaceModel.fromJson(res?.data?['data']);
  }

  /// takes in a `url` and returns a workspace that matches the url
  Future<WorkspaceModel> fetchWorkspaceByUrl(String url) async {
    final res = await _api.get(
      '/organizations/url/$url',
      headers: {'Authorization': 'Bearer $token'},
    );
    return WorkspaceModel.fromJson(res?.data?['data']);
  }

  /// This method creates an organization. Creator email `email` must be present
  ///
  Future<String> createOrganization(String email) async {
    final res = await _api.post(
      '/organizations',
      headers: {'Authorization': 'Bearer $token'},
      data: {"creator_email": email},
    );
    return res?.data?['data']['InsertedID'];
  }

  /// Updates an organization's URL. The organization's id `orgId` must not be
  /// null or empty. Url must not begin with `https` or `http`
  Future<void> updateOrgUrl(String orgId, String url) async {
    final res = await _api.post(
      '/organizations/$orgId/url',
      headers: {'Authorization': 'Bearer $token'},
      data: {"url": url},
    );
    return res?.data?['message'];
  }

  /// Updates an organization's name. The organization's id `orgId` must not be
  /// null or empty
  Future<void> updateOrgName(String orgId, String name) async {
    final res = await _api.post(
      '/organizations/$orgId/name',
      headers: {'Authorization': 'Bearer $token'},
      data: {"organization_name": name},
    );
    return res?.data?['message'];
  }

  /// Updates an organization's logo. The organization's id `orgId` must not be
  /// null or empty
  Future<void> updateOrgLogo(String orgId, String url) async {
    final res = await _api.post(
      '/organizations/$orgId/logo',
      headers: {'Authorization': 'Bearer $token'},
      data: {"url": url},
    );
    return res?.data?['message'];
  }

  String? get token =>
      storageService.getString(StorageKeys.currentSessionToken);
}
