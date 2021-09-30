import 'package:hng/app/app.locator.dart';
import 'package:hng/models/user_search_model.dart';
import 'package:hng/package/base/server-request/api/zuri_api.dart';
import 'package:hng/package/base/server-request/organization_request/organization_api_service.dart';
import 'package:hng/services/local_storage_services.dart';
import 'package:hng/services/user_service.dart';
import 'package:hng/utilities/storage_keys.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class ChannelAddPeopleViewModel extends BaseViewModel {
  final organizationApi = OrganizationApiService();
  final storageService = locator<SharedPreferenceLocalStorage>();
  final _navigationService = locator<NavigationService>();
  final zuriApi = locator<ZuriApi>();
  static final _userService = locator<UserService>();

  String? get orgId => _userService.currentOrgId;

  bool get allMarked =>
      markedUsers.length == matchingUsers.length && matchingUsers.isNotEmpty;

  late List<UserSearch> matchingUsers = [];
  late List<UserSearch> markedUsers = [];

  String? get token =>
      storageService.getString(StorageKeys.currentSessionToken);

  List<UserSearch> users = [];

  navigateBack() => _navigationService.popRepeated(1);
  void onSearchUser(String input) {
    matchingUsers = [
      ...users.where(
          (user) => user.userName!.toLowerCase().contains(input.toLowerCase()))
    ];
    notifyListeners();
  }

  void onFetchMembers() async {
    setBusy(true);
    matchingUsers =
        users = await organizationApi.fetchMembersInOrganization();
    setBusy(false);
  }

//TODO: Change channelID
  void onAddButtonTap() async {
    setBusy(true);
    for (var user in markedUsers) {
      await addMemberToChannel("6148c952e4b2aebf8ec8ccd0", user.id!);
      print(user.id);
    }
    setBusy(false);
    _navigationService.popRepeated(1);
  }

  Future<void> addMemberToChannel(String channelId, String userId) async {
    await zuriApi.post(
      "/$orgId/channels/$channelId/members/",
      token: token,
      body: {
        "_id": userId,
        "role_id": "",
        "is_admin": false,
        "notifications": {
          "additionalProp1": "",
          "additionalProp2": "",
          "additionalProp3": ""
        }
      },
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

}
