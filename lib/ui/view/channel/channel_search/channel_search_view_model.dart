import 'package:flutter/material.dart';
import 'package:hng/app/app.locator.dart';
import 'package:hng/app/app.logger.dart';
import 'package:hng/models/channel_members.dart';
import 'package:hng/models/search_result_model.dart';
import 'package:hng/models/user_search_model.dart';
import 'package:hng/package/base/server-request/channels/channels_api_service.dart';
import 'package:hng/package/base/server-request/organization_request/organization_api_service.dart';
import 'package:hng/services/connectivity_service.dart';
import 'package:hng/services/local_storage_services.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class ChannelSearchViewModel extends BaseViewModel {
  static final storageService = locator<SharedPreferenceLocalStorage>();
  final TextEditingController searchController = TextEditingController();
  final _connectivityService = locator<ConnectivityService>();
  final _channelApiService = ChannelsApiService();
  final _organisationApiService = OrganizationApiService();
  final _log = getLogger('ChannelSearchViewModel');
  final _navigationService = locator<NavigationService>();

  List<UserSearch> membersInOrg = [];
  List<UserSearch> memberSearchResults = [];

  List<SearchResultModel> messageResults = [];
  List<SearchResultModel> fileResults = [];

  List<ChannelMemberModel> usersInChannel = [];

  late String userIdSearched;

  void navigateBack() => _navigationService.back();

  // void openResult(String url) => _navigationService.navigateTo(Routes.);

  void onChanged(value) {
    if (value.isNotEmpty) {
      // membersInOrg = membersInOrg
      //     .where((channelUsers) => (channelUsers.name.toString().contains(
      //           '@${value.toLowerCase()}',
      //         )))
      //     .toList();
      if (value.toString().contains('@', 0)) print(value);
      notifyListeners();
    } else {
      membersInOrg = membersInOrg;
      notifyListeners();
    }
    notifyListeners();
  }

  void fetchOrganisationMembers() async {
    List? organisationMembers =
        await _organisationApiService.fetchOrganisationMembers();
    _log.i('Organisation Members fetched successfully');
    print(organisationMembers);

    organisationMembers!.forEach((data) async {
      String userId = data['_id'];
      String firstName = data['first_name'], lastName = data['last_name'];
      String userName = data['user_name'];
      // online status should be here
      String profileImage = data['image_url'];

      membersInOrg.add(
        UserSearch(
          id: userId,
          firstName: firstName,
          lastName: lastName,
          userName: userName,
          imageUrl: profileImage,
        ),
      );
    });
  }

  Future<List<SearchResultModel>> searchContent(
      String channelId, String userId, Map<String, dynamic> searchQuery) async {
    final results = await _channelApiService.getItems(channelId, searchQuery);
    results.forEach((element) {
      if (element.hasFiles)
        fileResults.add(element);
      else
        messageResults.add(element);
    });
    return results;
  }

  List<UserSearch>? searchUser(String text) {
    List<UserSearch>? matchingUsers = [];

    if (text.isNotEmpty) {
      if (text.contains('@')) {
        String userName = text.split('@')[1].split(' ')[0].trim();
        print('Username: $userName');
        userName.toLowerCase();

        matchingUsers = membersInOrg
            .where((member) =>
                (member.userName!.toLowerCase().contains(userName) ||
                    member.firstName!.toLowerCase().contains(userName) ||
                    member.lastName!.toLowerCase().contains(userName)))
            .toList();
        notifyListeners();
      }
      print('Match: $matchingUsers');
    }
    memberSearchResults = matchingUsers;
    return matchingUsers;
  }

  void parseUserName({required String userId, required String userName}) {
    String userName0 = searchController.text.split('@')[1].split(' ')[0].trim();
    String parsedUserName = userName;
    if (userName.contains(userName0))
      parsedUserName = searchController.text.replaceAll(userName0, userName);
    // searchController.text =
    searchController.text.replaceFirst(userName0, userName);
    notifyListeners();
    // searchController.text =
    //     searchController.text.split('@')[1].replaceAll(userName0, theUserName);
    print('The user: $parsedUserName');
    userIdSearched = userId;
  }
}
