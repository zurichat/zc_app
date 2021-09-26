//TODO: remove material import, this is temporary for testing
import 'package:flutter/material.dart';
import 'package:hng/app/app.locator.dart';
import 'package:hng/app/app.router.dart';
import 'package:hng/models/user_post.dart';
import 'package:hng/package/base/server-request/api/http_api.dart';
import 'package:hng/package/base/server-request/channels/channels_api_service.dart';
import 'package:hng/services/centrifuge_service.dart';
import 'package:hng/services/local_storage_services.dart';
import 'package:hng/ui/view/channel/channel_view/channel_page_view.form.dart';

import 'package:hng/utilities/constants.dart';
import 'package:hng/utilities/enums.dart';
import 'package:hng/utilities/storage_keys.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class ChannelPageViewModel extends StreamViewModel {
  bool isVisible = false;

  final _navigationService = locator<NavigationService>();
  final _channelsApiService = locator<ChannelsApiService>();
  final _coreApiService = HttpApiService(coreBaseUrl);
  final storage = locator<SharedPreferenceLocalStorage>();
  final _centrifugeService = locator<CentrifugeService>();

  final _bottomSheetService = locator<BottomSheetService>();

  List<UserPost>? channelUserMessages = [];

  void onMessageFieldTap() {
    isVisible = true;
    notifyListeners();
  }

  void showThreadOptions() async {
    var sheetResponse = await _bottomSheetService.showCustomSheet(
      variant: BottomSheetType.threadOptions,
      isScrollControlled: true,
    );
  }

  void onMessageFocusChanged() {
    isVisible = false;
    notifyListeners();
  }

  void joinChannel(String channelId) async {
    var joinedChannel = await _channelsApiService.joinChannel(channelId);
    print(joinedChannel);
  }

  void fetchMessages(String channelId) async {
    setBusy(true);

    List? channelMessages =
        await _channelsApiService.getChannelMessages(channelId);
    channelMessages.forEach((data) async {
      String userid = data["user_id"];

      // String endpoint = '/users/$userid';

      //final response = await _coreApiService.get(endpoint);

      channelUserMessages!.add(
        UserPost(
            id: data["_id"],
            displayName: userid,
            statusIcon: Icons.looks_6,
            lastSeen: "4 hours ago",
            message: data["content"],
            channelType: ChannelType.public,
            postEmojis: <PostEmojis>[],
            userThreadPosts: <UserThreadPost>[],
            channelName: channelId,
            userImage: "assets/images/chimamanda.png",
            userID: userid),
      );
    });

    notifyListeners();
  }

  void sendMessage(String message, String channelId) async {
    String? userId = storage.getString(StorageKeys.currentUserId);
    var channelMessages = await _channelsApiService.sendChannelMessages(
        channelId, "$userId", message);

    notifyListeners();
  }

  void exitPage() {
    _navigationService.back();
  }

  String time() {
    return "${DateTime.now().hour.toString()}:${DateTime.now().minute.toString()}";
  }

  Future navigateToChannelInfo() async {
    await _navigationService.navigateTo(Routes.channelInfoView);
  }

  Future navigateToAddPeople() async {
    await _navigationService.navigateTo(Routes.addPeopleView);
  }

  navigateToChannelEdit() {
    _navigationService.navigateTo(Routes.editChannelPageView);
  }

  void websocketConnect(String channelId) async {
    await _centrifugeService.connect();
    await _centrifugeService.subscribe(channelId);
  }

  Stream centriSub() async* {}

  @override
  // TODO: implement stream
  Stream get stream => centriSub();
}
