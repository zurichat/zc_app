import 'dart:async';

import 'package:flutter/widgets.dart';
import 'package:hng/app/app.locator.dart';
import 'package:hng/app/app.router.dart';
import 'package:hng/models/channel_members.dart';
import 'package:hng/models/channel_model.dart';
import 'package:hng/models/user_post.dart';
import 'package:hng/models/user_search_model.dart';
import 'package:hng/package/base/server-request/channels/channels_api_service.dart';
import 'package:hng/services/centrifuge_service.dart';
import 'package:hng/services/local_storage_services.dart';
import 'package:hng/services/notification_service.dart';

import 'package:hng/utilities/enums.dart';
import 'package:hng/utilities/storage_keys.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class ChannelPageViewModel extends BaseViewModel {
  final _navigationService = locator<NavigationService>();
  final _channelsApiService = locator<ChannelsApiService>();
  final storage = locator<SharedPreferenceLocalStorage>();
  final _centrifugeService = locator<CentrifugeService>();
  final _notificationService = locator<NotificationService>();

  final _bottomSheetService = locator<BottomSheetService>();

// ignore: todo
//TODO refactor this
  ScrollController scrollController = ScrollController();
  bool isVisible = false;
  bool isExpanded = false;

  bool isLoading = true;
  List<UserSearch> usersInOrg = [];
  List<ChannelMembermodel> channelMembers = [];
  List<UserPost>? channelUserMessages = [];
  StreamSubscription? messageSubscription;
  StreamSubscription? notificationSubscription;

  void onMessageFieldTap() {
    isVisible = true;
    notifyListeners();
  }

  void initialise(String channelId) async {
    await joinChannel('$channelId');
    fetchMessages('$channelId');

    // getChannelSocketId("$channelId");

    listenToNewMessage("$channelId");
    // listenToNewMessages("$channelId");
  }

  void showThreadOptions() async {
    await _bottomSheetService.showCustomSheet(
      variant: BottomSheetType.threadOptions,
      isScrollControlled: true,
    );
  }

  void onMessageFocusChanged() {
    isVisible = false;
    notifyListeners();
  }

  Future<void> joinChannel(String channelId) async {
    await _channelsApiService.joinChannel(channelId);
  }

  void fetchMessages(String channelId) async {
    //setBusy(true);

    List? channelMessages =
        await _channelsApiService.getChannelMessages(channelId);
    channelUserMessages = [];

    channelMessages.forEach((data) async {
      final String userid = data['user_id'];

      channelUserMessages!.add(
        UserPost(
            id: data['_id'],
            displayName: userid,
            statusIcon: '7️⃣',
            lastSeen: '4 hours ago',
            message: data['content'],
            channelType: ChannelType.public,
            postEmojis: <PostEmojis>[],
            userThreadPosts: <UserThreadPost>[],
            channelName: channelId,
            userImage: 'assets/images/chimamanda.png',
            userID: userid,
            channelId: channelId),
      );
    });
    isLoading = false;

    notifyListeners();
  }

  void sendMessage(String message, String channelId) async {
    final userId = storage.getString(StorageKeys.currentUserId);
    await _channelsApiService.sendChannelMessages(
        channelId, "$userId", message);
    scrollController.jumpTo(scrollController.position.minScrollExtent);
    notifyListeners();
  }

  void exitPage() {
    _navigationService.back();
  }

  String time() {
    return '''
${DateTime.now().hour.toString()}:${DateTime.now().minute.toString()}''';
  }

  navigateToChannelInfoScreen(int numberOfMembers, ChannelModel channelDetail) {
    NavigationService().navigateTo(Routes.channelInfoView,
        arguments: ChannelInfoViewArguments(
          numberOfMembers: numberOfMembers,
          channelMembers: channelMembers,
          channelDetail: channelDetail,
        ));
  }

  Future navigateToAddPeople() async {
    await _navigationService.navigateTo(Routes.channelAddPeopleView);
  }

  void goBack() {
    _navigationService.back();
  }

  // ignore: always_declare_return_types
  navigateToChannelEdit() {
    _navigationService.navigateTo(Routes.editChannelPageView);
  }

  void websocketConnect(String channelSocketId) async {
    await _centrifugeService.subscribe(channelSocketId);
  }

  void listenToNewMessage(String channelId) async {
    String channelSockId =
        await _channelsApiService.getChannelSocketId(channelId);

    messageSubscription = _centrifugeService.listen(
      socketId: channelSockId,
      channelId: channelId,
      onData: (message) {
        fetchMessages(channelId);
        notifyListeners();
      },
    );
  }

  void showNotificationForOtherChannels(
      String channelId, String channelName) async {
    notificationSubscription = _centrifugeService.onNotificationReceived(
      channelId: channelId,
      onData: (message) {
        _notificationService.show(
          title: '#$channelName',
          body: message['content'],
          payload: NotificationPayload(
            messageId: message['_id'],
            roomId: message['channel_id'],
            name: channelName,
          ),
        );
      },
    );
  }

  @override
  void dispose() {
    // this fixes the scroll controller error
    messageSubscription?.cancel();
    notificationSubscription?.cancel();
    super.dispose();
  }

  void toggleExpanded() {
    isExpanded = !isExpanded;
    notifyListeners();
  }
}
