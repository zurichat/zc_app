import 'package:hng/app/app.locator.dart';
import 'package:hng/models/user_search_model.dart';
import 'package:hng/package/base/server-request/api/zuri_api.dart';
import 'package:hng/package/base/server-request/organization_request/organization_api_service.dart';
import 'package:hng/services/local_storage_services.dart';
import 'package:hng/utilities/constants.dart';
import 'package:hng/utilities/storage_keys.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class ChannelAddPeopleViewModel extends BaseViewModel {
  final organizationApi = OrganizationApiService();
  final storageService = locator<SharedPreferenceLocalStorage>();
  final navigationService = locator<NavigationService>();
  final api = ZuriApi(channelsBaseUrl);

  String? get orgId => storageService.getString(StorageKeys.currentOrgId);

  String? get token =>
      storageService.getString(StorageKeys.currentSessionToken);

  bool get allMarked =>
      markedUsers.length == matchingUsers.length && matchingUsers.isNotEmpty;

  late List<UserSearch> matchingUsers = [];
  late List<UserSearch> markedUsers = [];
  late List<UserSearch> users = [];

  void navigateBack() => navigationService.popRepeated(1);

  void onSearchUser(String input) {
    matchingUsers = [
      ...users.where(
          (user) => user.userName!.toLowerCase().contains(input.toLowerCase()))
    ];
    notifyListeners();
  }

  void onMarkAll(bool? marked) {
    markedUsers = marked! ? [...matchingUsers] : [];
    notifyListeners();
  }

  void addMarkedUsersToChannel(String channelId) async {
    if (markedUsers.isNotEmpty) {
      setBusy(true);
      for (final user in markedUsers) {
        await api.addMemberToChannel(channelId, orgId!, user.id!, token);
      }
      setBusy(false);
      navigateBack();
    }
  }

  void fetchOrganizationMembers() async {
    setBusy(true);
    matchingUsers =
        users = (await organizationApi.fetchMembersInOrganization(orgId!))
          ..sort((user1, user2) =>
              user1.userName!.trim().compareTo(user2.userName!.trim()));
    setBusy(false);
  }

  void markOne(bool? marked, int i) {
    if (marked!) {
      markedUsers.add(matchingUsers[i]);
    } else {
      markedUsers.remove(matchingUsers[i]);
    }
    notifyListeners();
  }
}
