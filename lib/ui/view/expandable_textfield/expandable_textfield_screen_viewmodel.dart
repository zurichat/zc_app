import 'package:hng/app/app.locator.dart';
import 'package:hng/utilities/enums.dart';

import 'package:hng/models/channel_members.dart';
import 'package:hng/package/base/server-request/channels/channels_api_service.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import '/../../app/app.logger.dart';

class ExpandableTextFieldScreenViewModel extends BaseViewModel {
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

  // void showMembersList(bool show) {
  //   matchedUsers = channelUsersList;
  //   _showMembers = show;
  //   notifyListeners();
  // }
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
}
