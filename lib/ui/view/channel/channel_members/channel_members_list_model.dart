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
      String? memberId}) async {
    // TODO: Beseech backed to fix endpoint that fetches single organisation member -- {@link https://docs.zuri.chat/organizations/members#fetch-organization-member}
    // until then, fetch all organisation members and verify channel membership
    final organisationMembers =
        await _organisationApiService.fetchOrganisationMembers();
    String isOnline;
    String userId, firstName, lastName, userName, profileImage;
    print('Organisation Members: $organisationMembers');

    organisationMembers.forEach((data) async {
      userId = data['_id'];
      for (int i = 0; i < channelMembersId.length; i++) {
        // the end point which passed #channelMembersId only returns the id, is_admin, & role_id of a channel member
        if (userId == channelMembersId[i].id) {
          userId = data['_id'];
          isOnline = data['presence']; // online status should be here
          firstName = data['first_name'];
          lastName = data['last_name'];
          userName = data['user_name'];
          profileImage = data['image_url'];

          /* // Extra for viewing profile
            String fullName = '$firstName $lastName';
            String displayName = data['display_name'];
            String phone = data['phone'];
            String eMail = data['email'];
            String bio = data['bio'];
            String pronouns = data['pronouns']; */
          channelMembers.add(UserSearch(
            id: userId,
            // isOnline: data['presence'];// online status should be here
            firstName: firstName, lastName: lastName,
            userName: userName, imageUrl: profileImage,
          ));

          print('User: $userId $firstName $lastName $userName $profileImage');
        }
      }
    });
  }

  void fetchOrganisationMember(String memberId) async {
    final organisationMember =
        await _organisationApiService.fetchOrganisationMember(memberId);
    print('Organisation Member: $organisationMember');

    UserSearch.fromJson(organisationMember);
  }

  void onSearchUser(String namePattern) {
    matchingUsers = channelMembers
        .where((member) =>
            (member.userName!.toLowerCase().contains(namePattern) ||
                member.firstName!.toLowerCase().contains(namePattern) ||
                member.lastName!.toLowerCase().contains(namePattern)))
        .toList();
    print('Matching Users: $matchingUsers');
    notifyListeners();
  }

  void onSelectUser(String namePattern) {}

  void goBack() => NavigationService().back();
  /*
    navigator = locator<NavigationService>();
    It's still navigation service that was used.
    The test kills returning a null value if NavigationService is used directly inside of
    */
}
