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

import 'package:hng/utilities/enums.dart';
import 'package:hng/utilities/storage_keys.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';


class ChannelPageViewModel extends FormViewModel {
  final _navigationService = locator<NavigationService>();
  final _channelsApiService = locator<ChannelsApiService>();
  final storage = locator<SharedPreferenceLocalStorage>();
  final _centrifugeService = locator<CentrifugeService>();
  final _bottomSheetService = locator<BottomSheetService>();
  final _storageService = locator<SharedPreferenceLocalStorage>();


  //draft implementations
  var storedDraft = '';
  void getDraft(channelId){
      var draft = _storageService.getString(channelId);
      if(draft != null){
        storedDraft = draft ;
        _storageService.clearData(channelId);
      }
  }

  void storeDraft(channelId, value){
    if(value.length > 0){
      _storageService.setStringList(StorageKeys.currentUserChannelDrafts, [channelId]);
      _storageService.setString(channelId, value);
    }
  }

// ignore: todo
//TODO refactor this
  ScrollController scrollController = ScrollController();
  bool isVisible = false;
  bool isExpanded = false;

  bool isLoading = true;
  List<UserSearch> usersInOrg = [];
  List<ChannelMembermodel> channelMembers = [];
  List<UserPost>? channelUserMessages = [];

  void onMessageFieldTap() {
    isVisible = true;
    notifyListeners();
  }

  void initialise(String channelId) async {
    await joinChannel('$channelId');
    fetchMessages('$channelId');

    getChannelSocketId('$channelId');

    listenToNewMessages('$channelId');
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

  void getChannelSocketId(String channelId) async {
    final channelSockId =
        await _channelsApiService.getChannelSocketId(channelId);

    websocketConnect(channelSockId);
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
        ),
      );
    });
    isLoading = false;
    //scrollController.jumpTo(scrollController.position.maxScrollExtent);

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

  void goBack(channelId, value) {
    storeDraft(channelId, value);
    _navigationService.back();
  }

  // ignore: always_declare_return_types
  navigateToChannelEdit() {
    _navigationService.navigateTo(Routes.editChannelPageView);
  }

  void websocketConnect(String channelSocketId) async {
    await _centrifugeService.subscribe(channelSocketId);
  }

  void listenToNewMessages(String channelId) {
    _centrifugeService.messageStreamController.stream.listen((event) {
      String? eventType = event['event']['action'];
      if (eventType == 'create:message') fetchMessages(channelId);

      notifyListeners();
    });
  }

  void toggleExpanded() {
    isExpanded = !isExpanded;
    notifyListeners();
  }

  @override
  void setFormStatus() {
    // TODO: implement setFormStatus
  }
}
