import 'package:hng/app/app.locator.dart';
import 'package:hng/package/base/server-request/api/http_api.dart';
import 'package:hng/package/base/server-request/organization_request/organization_api_service.dart';
import 'package:hng/services/local_storage_services.dart';
import 'package:hng/utilities/storage_keys.dart';
import 'package:stacked/stacked.dart';

import 'package:hng/models/static_user_model.dart';
import 'package:stacked_services/stacked_services.dart';

class ChannelAddPeopleViewModel extends BaseViewModel {
  final organizationApi = OrganizationApiService();
  final storageService = locator<SharedPreferenceLocalStorage>();
  final navigationService = locator<NavigationService>();
  final api = HttpApiService("https://channels.zuri.chat/api/v1");
  bool get allMarked =>
      markedUsers.length == matchingUsers.length && matchingUsers.isNotEmpty;

  late List<StaticUserModel> matchingUsers = users;
  late List<StaticUserModel> markedUsers = [];

  final users = [
    StaticUserModel(
      online: true,
      userName: 'Chimamanda',
      userimg: 'chimamanda.png',
      joinInfo: '',
      time: '',
    ),
    StaticUserModel(
      online: false,
      userName: 'Naisu',
      userimg: 'naisu.png',
      joinInfo: '',
      time: '',
    ),
    StaticUserModel(
      online: false,
      userName: 'Baptist',
      userimg: 'baptist.png',
      joinInfo: '',
      time: '',
    ),
    StaticUserModel(
      online: true,
      userName: 'Gringo',
      userimg: 'gringo.png',
      joinInfo: '',
      time: '',
    ),
  ];

  void onSearchUser(String input) {
    matchingUsers = [
      ...users.where(
          (user) => user.userName.toLowerCase().contains(input.toLowerCase()))
    ];
    notifyListeners();
  }

  void onFetchMembers(String input) async {
    setBusy(true);
    await organizationApi.fetchMembersInOrganization(orgId!);
    setBusy(false);
  }

  void onAddButtonTap() async {
    setBusy(true);
    for (var user in markedUsers) {
      await addMemberToChannel("", user.userName);
    }
    setBusy(false);
    navigationService.popRepeated(1);
  }

 Future <void> addMemberToChannel(String channelId, String userId) async {
    await api.post(
      "/$orgId/channels/$channelId/members/",
      headers: {'Authorization': 'Bearer ${organizationApi.token}'},
      data: {"_id":userId},
    );
  }

  void onMarkOne(bool? marked, int i) {
    if (marked!)
      markedUsers.add(matchingUsers[i]);
    else
      markedUsers.remove(matchingUsers[i]);
    notifyListeners();
  }

  void onMarkAll(bool? marked) {
    markedUsers = marked! ? matchingUsers : [];
    notifyListeners();
  }

  String? get orgId => storageService.getString(StorageKeys.currentOrgId);
}
