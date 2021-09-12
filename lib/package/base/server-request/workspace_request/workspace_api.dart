import 'package:hng/package/base/server-request/api/http_api.dart';
import 'package:hng/models/workspace_model.dart';

class WorkSpaceApi {
  HttpApi _api = HttpApi();

  /// Fetches a list of organizations that the user is part of
  Future<List<WorkspaceModel>> fetchListOfOrganizations() async {
    final res = await _api.get('/organizations');
    print(res?.data?['data'].length);
    return (res?.data?['data'] as List).map((e) => WorkspaceModel.fromJson(e)).toList();
  }

  /// Fetches information on a particular Organization. It takes a parameter 
  /// `id` which is the id of the organization  
  Future<List<WorkspaceModel>> fetchOrganizationInfo(String id) async {
    final res = await _api.get('/organizations', data: {'organization_id': id});
    return (res?.data?['data'] as List).map((e) => WorkspaceModel.fromJson(e)).toList();
  }
}