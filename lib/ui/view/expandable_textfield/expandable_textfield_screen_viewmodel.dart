import 'dart:io';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:zurichat/app/app.locator.dart';
import 'package:zurichat/models/channel_members.dart';
import 'package:zurichat/models/organization_member_model.dart';
import 'package:zurichat/package/base/server-request/channels/channels_api_service.dart';
import 'package:zurichat/package/base/server-request/organization_request/organization_api_service.dart';
import 'package:zurichat/services/local_storage_services.dart';
import 'package:zurichat/services/media_service.dart';
import 'package:zurichat/services/user_service.dart';
import 'package:zurichat/utilities/enums.dart';
import 'package:zurichat/utilities/storage_keys.dart';

import '/../../app/app.logger.dart';

class ExpandableTextFieldScreenViewModel extends BaseViewModel {
  final _mediaService = locator<MediaService>();
  final List<File> _mediaList = [];
  final _dialogService = locator<DialogService>();
  final log = getLogger('ExpandableTextFieldScreenViewModel');
  final channelsApiService = locator<ChannelsApiService>();
  final organizationApiService = locator<OrganizationApiService>();
  final _userService = locator<UserService>();
  final storage = locator<SharedPreferenceLocalStorage>();

  bool isVisible = false;
  bool isExpanded = false;
  bool _showMembers = false;
  bool get showMembers => _showMembers;
  double maxSize = 0;
  double minSize = 70;
  double size = 0;
  double offset = 0;
  List<OrganizationMemberModel> organizationUsersList = [];
  List<OrganizationMemberModel>? matchedUsers = [];
  List<ChannelMembermodel>? channelUsersLists = [];
  String? get displayName => storage.getString(StorageKeys.displayName);

  void init(double max, String channelId, [bool val = true]) {
    if (val) size = minSize;
    maxSize = max;
    userMentions();
    getUsersInChannels(channelId);
    notifyListeners();
  }

  void toggleExpanded(bool val) {
    if (val) {
      size = maxSize;
      isExpanded = true;
    } else {
      size = minSize;
      toggleVisibility(isVisible);
      isExpanded = val;
    }
    notifyListeners();
  }

  void toggleVisibility(bool _isVisible) {
    if (!_isVisible) {
      isVisible = false;
      size = minSize;
    } else {
      isVisible = true;
      size = minSize + 50;
    }
    notifyListeners();
  }

  Future<void> onCameraTap(String roomId) async {
    final media = await _mediaService.getImage(fromGallery: true);
    _mediaList.add(media!);
    if (mediaList.isEmpty) {
      size = isVisible ? minSize + 50 : minSize;
    } else {
      size = isVisible ? minSize + 120 : minSize + 70;
    }
    notifyListeners();
  }

  List<File> get mediaList => _mediaList;
  popDialog(String text, String channelID) async {
    final dialogResult = await _dialogService.showCustomDialog(
      variant: DialogType.scheduleMessageChannel,
      data: {'channelID': channelID, 'message': text},
    );

    if (dialogResult != null) {
      log.i(dialogResult.data);

      notifyListeners();
    }
  }

  /// Get all users in an organization
  Future<void> userMentions() async {
    setBusy(true);
    final orgId = _userService.currentOrgId;

    var users = await organizationApiService.getOrganizationMemberList(orgId);
    if (users.status == 200) {
      matchedUsers = organizationUsersList = users.data;
    }

    setBusy(false);
    notifyListeners();
  }

  void showMembersList(bool show) {
    matchedUsers = organizationUsersList;
    _showMembers = show;
    notifyListeners();
  }

  searchUsers(List<OrganizationMemberModel> search) {
    matchedUsers = search;
    notifyListeners();
  }

  /// filter users
  void onSearchUser(String input) {
    matchedUsers = [
      ...organizationUsersList.where(
          (user) => user.userName!.toLowerCase().contains(input.toLowerCase()))
    ];
    notifyListeners();
  }

  void clearMatchedUsers() {
    matchedUsers = organizationUsersList;
    notifyListeners();
  }

  /// Gets all users in a channel
  /// Args: channel id
  Future<void> getUsersInChannels(channelId) async {
    channelUsersLists = await channelsApiService.getChannelMembers(channelId);
    notifyListeners();
  }

  /// Invite a user to a channel
  /// Args: channel id, username of user to be added
  Future<bool>? addUserToChannel(String channelId, String username) async {
    bool response = false;
    getUsersInChannels(channelId);
    userMentions();

    /// Check if the user to be added exists in the organization
    var isMember = organizationUsersList
        .where((user) => user.userName!.toLowerCase().contains(username));

    if (isMember.isNotEmpty) {
      /// if user exist get the user's id
      String? memberId = isMember.first.id;

      /// Check if user already exists in the channel
      bool? userExists = channelUsersLists
          ?.where((user) => user.name.contains(memberId!))
          .isNotEmpty;

      if (!userExists!) {
        /// Add user to channel if user doesn't exist in the channel
        var res =
            await channelsApiService.addChannelMember(channelId, memberId);

        // If succesful let the response be true
        if (res?['_id'] == memberId) {
          response = true;
        }
      }
    }

    notifyListeners();
    return response;
  }

  void clearMediaList() {
    _mediaList.clear();
  }
}
