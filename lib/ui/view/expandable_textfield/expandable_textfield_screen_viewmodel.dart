import 'dart:io';

import 'package:zurichat/app/app.locator.dart';
import 'package:zurichat/services/media_service.dart';
import 'package:zurichat/utilities/enums.dart';

import 'package:zurichat/models/channel_members.dart';
import 'package:zurichat/package/base/server-request/channels/channels_api_service.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import '/../../app/app.logger.dart';

class ExpandableTextFieldScreenViewModel extends BaseViewModel {
  final _mediaService = locator<MediaService>();
  final List<File> _mediaList = [];
  final _dialogService = locator<DialogService>();
  final log = getLogger('ExpandableTextFieldScreenViewModel');
  final channelsApiService = locator<ChannelsApiService>();

  bool isVisible = false;
  bool isExpanded = false;
  bool _showMembers = false;
  bool get showMembers => _showMembers;
  double maxSize = 0;
  double minSize = 70;
  double size = 0;
  double offset = 0;
  List<ChannelMembermodel>? channelUsersList = [];
  List<ChannelMembermodel>? matchedUsers = [];

  void init(double max, [bool val = true]) {
    if (val) size = minSize;
    maxSize = max;
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

  Future<void> userMentions() async {
    setBusy(true);
    matchedUsers = channelUsersList =
        await channelsApiService.getChannelMembers("615045e9cf2c0f1ad758558d");
    setBusy(false);
    notifyListeners();
  }

 
  void showMembersList(bool show) {
    matchedUsers = channelUsersList;
    _showMembers = show;
    notifyListeners();
  }

  searchUsers(List<ChannelMembermodel> search) {
    matchedUsers = search;
  }

  void onSearchUser(String input) {
    matchedUsers = [
      ...channelUsersList!.where(
          (user) => user.name.toLowerCase().contains(input.toLowerCase()))
    ];
    notifyListeners();
  }

  void clearMatchedUsers() {
    matchedUsers = channelUsersList;

    notifyListeners();
  }
  void clearMediaList() {
    _mediaList.clear();
  }
}
