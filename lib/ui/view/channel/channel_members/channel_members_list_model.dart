import 'package:hng/app/app.locator.dart';
import 'package:hng/models/channel_members.dart';
import 'package:hng/models/static_user_model.dart';
import 'package:hng/models/user_search_model.dart';
import 'package:hng/package/base/server-request/organization_request/organization_api_service.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class ChannelMembersListModel extends BaseViewModel {
  final navigator = locator<NavigationService>();
  final _organisationApiService = OrganizationApiService();

  bool get allMarked =>
      markedUsers.length == matchingUsers.length && matchingUsers.isNotEmpty;

  late List<UserSearch> matchingUsers = [];
  late List<UserSearch> channelMembers = [];
  late List<UserSearch> organisationMembers = [];

  late List<StaticUserModel> markedUsers = [];

  /// Based on the 'id' attribute of each channel member, fetch their detail
  /// from the organisation endpoint (which holds all details about a member)
  Future<void> fetchOrganisationMembers(
      {required List<ChannelMemberModel> channelMembersId,
      String? memberId}) async {}

  void fetchOrganisationMember(String memberId) async {
    final organisationMember =
        await _organisationApiService.fetchOrganisationMember(memberId);
    print('Organisation Member: $organisationMember');

    UserSearch.fromJson(organisationMember);
  }

  void onSearchUser(String namePattern) {}

  void onSelectUser(String namePattern) {}

  void goBack() => NavigationService().back();
}
