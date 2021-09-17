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
    print(storageService.getString(StorageKeys.currentSessionToken));
    print('donee');
    final res = await _api.get('organizations/', headers: {
      'Authorization':
          'Bearer ${storageService.getString(StorageKeys.currentSessionToken)}'
    });
    print(res?.data?['data'].length);
    return (res?.data?['data'] as List)
        .map((e) => WorkspaceModel.fromJson(e))
        .toList();
  }

  /// Fetches information on a particular Organization. It takes a parameter
  /// `id` which is the id of the organization
  // Future<List<WorkspaceModel>>
  fetchOrganizationInfo(String id) async {
    final res = await _api.get('/organizations/', data: {
      'organization_id': id
    }, headers: {
      'Authorization':
          'Bearer ${storageService.getString(StorageKeys.currentSessionToken)}'
    });
    return (res?.data?['data'] as List)
        .map((e) => WorkspaceModel.fromJson(e))
        .toList();
  }
}
