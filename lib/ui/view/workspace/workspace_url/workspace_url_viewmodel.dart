import 'package:flutter/material.dart';
import 'package:hng/app/app.locator.dart';
import 'package:hng/app/app.router.dart';
import 'package:hng/package/base/server-request/workspace_request/workspace_api.dart';
import 'package:hng/services/local_storage_services.dart';
import 'package:hng/utilities/storage_keys.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class WorkspaceUrlViewModel extends BaseViewModel {
  final navigation = locator<NavigationService>();
  final storage = locator<SharedPreferenceLocalStorage>();
  final api = WorkSpaceApi();
  bool isEmpty = true;
  String _email = 'johndoe@gmail.com';
  String? url;
  Color buttonColor = Color(0xffBEBEBE);

  void updateString(String value) {
    if (value.trim().isEmpty) {
      isEmpty = true;
      buttonColor = Color(0xffBEBEBE);
    } else {
      isEmpty = false;
      buttonColor = Colors.green;
    }
    url = value.trim();
    notifyListeners();
  }

  Future<void> signInToWorkspace() async {
    if (url != null && url!.isNotEmpty) {
      final workspace = await api.fetchWorkspaceByUrl(url!);
      await storeWorkspaceId(workspace.id);
      navigation.popUntil(ModalRoute.withName(Routes.workspaceView));
    }
    //TODO: put the error text
  }

  Future<void> storeWorkspaceId(String id) async {
    List<String> ids = storage.getStringList(StorageKeys.workspaceIds) ?? [];
    ids.add(id);
    await storage.setStringList(StorageKeys.workspaceIds, ids);
  }

  Color get buttonColors => buttonColor;
  bool get title => isEmpty;
  String get email => _email;
}
