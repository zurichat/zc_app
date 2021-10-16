import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:flutter/widgets.dart';
import 'package:zurichat/app/app.locator.dart';
import 'package:zurichat/app/app.router.dart';
import 'package:zurichat/models/channel_members.dart';
import 'package:zurichat/models/channel_model.dart';
import 'package:zurichat/models/user_post.dart';
import 'package:zurichat/package/base/server-request/api/zuri_api.dart';
import 'package:zurichat/package/base/server-request/channels/channels_api_service.dart';
import 'package:zurichat/services/centrifuge_service.dart';
import 'package:zurichat/services/local_storage_services.dart';
import 'package:zurichat/services/media_service.dart';
import 'package:zurichat/services/notification_service.dart';
import 'package:zurichat/app/app.logger.dart';
import 'package:zurichat/services/user_service.dart';
import 'package:zurichat/ui/shared/shared.dart';
import 'package:zurichat/utilities/enums.dart';
import 'package:zurichat/utilities/storage_keys.dart';
import 'package:simple_moment/simple_moment.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class ChannelPageViewModel extends FormViewModel {
  final _navigationService = locator<NavigationService>();
  final _channelsApiService = locator<ChannelsApiService>();
  final storage = locator<SharedPreferenceLocalStorage>();
  final _centrifugeService = locator<CentrifugeService>();
  final _notificationService = locator<NotificationService>();
  final log = getLogger("ChannelPageViewModel");
  final _bottomSheetService = locator<BottomSheetService>();
  final _storageService = locator<SharedPreferenceLocalStorage>();
  final _snackbarService = locator<SnackbarService>();
  final _mediaService = locator<MediaService>();
  final _userService = locator<UserService>();
  bool _checkUser = true;

  get checkUser => _checkUser;
  final _api = ZuriApi(channelsBaseUrl);
  String pluginId = '6165f520375a4616090b8275';

  //Draft implementations
  var storedDraft = '';

  void getDraft(channelId) {
    List<String>? spList =
        _storageService.getStringList(StorageKeys.currentUserChannelIdDrafts);
    if (spList != null) {
      for (String e in spList) {
        if (jsonDecode(e)['channelId'] == channelId) {
          storedDraft = jsonDecode(e)['draft'];
          spList.remove(e);
          _storageService.setStringList(
              StorageKeys.currentUserChannelIdDrafts, spList);
          return;
        }
      }
    }
  }

  void storeDraft(channelId, value, channelName, membersCount, public) {
    var keyMap = {
      'draft': value,
      'time': '${DateTime.now()}',
      'channelName': channelName,
      'channelId': channelId,
      'membersCount': membersCount,
      'public': public,
    };

    List<String>? spList =
        _storageService.getStringList(StorageKeys.currentUserChannelIdDrafts);

    if (value.length > 0 && spList != null) {
      spList.add(json.encode(keyMap));
      _storageService.setStringList(
          StorageKeys.currentUserChannelIdDrafts, spList);
    } else if (value.length > 0 && spList == null) {
      spList = [json.encode(keyMap)];
      _storageService.setStringList(
          StorageKeys.currentUserChannelIdDrafts, spList);
    }
  }

  //**draft implementation ends here

  // ignore: todo
  //TODO refactor this
  ScrollController scrollController = ScrollController();
  bool isExpanded = false;
  bool isVisible = false;
  bool isLoading = true;

  List<ChannelMembermodel> channelMembers = [];
  List<UserPost>? channelUserMessages = [];
  StreamSubscription? messageSubscription;
  StreamSubscription? notificationSubscription;
  String channelID = '';
  String channelCreator = '';

  saveItem(
      {String? channelID,
      String? channelName,
      String? messageID,
      String? message,
      String? lastSeen,
      String? userID,
      String? userImage,
      String? displayName}) async {
    var savedMessageMap = {
      'channel_id': channelID,
      'channel_name': channelName,
      'message_id': messageID,
      'message': message,
      'last_seen': lastSeen,
      'user_id': userID,
      'user_image': userImage,
      'display_name': displayName
    };
    if (message!.isNotEmpty) {
      var currentList = storage.getStringList(StorageKeys.savedItem) ?? [];
      currentList.add(messageID!);
      await storage.setStringList(StorageKeys.savedItem, currentList);
      await storage.setString(messageID, json.encode(savedMessageMap));
      log.i(savedMessageMap);
      final len = storage.getStringList(StorageKeys.savedItem);
      log.w(len!.length.toString());
    }
  }

  void onMessageFieldTap() {
    isVisible = true;
    notifyListeners();
  }

  getChannelCreator(String channelId) async {
    var response = await _channelsApiService.getChanelCreator(channelId);
    channelCreator = response['owner'];
    notifyListeners();
  }

  void updateCheckUser() {
    _checkUser = false;
    notifyListeners();
  }

  void initialise(String channelId) async {
    channelID = channelId;
    await joinChannel(channelId);
    fetchMessages(channelId);
    getChannelSocketId(channelId);
    fetchChannelMembers(channelId);
    listenToNewMessage(channelId);
    getChannelCreator(channelId);
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

  Future<bool> changePinnedState(UserPost? userPost) =>
      _channelsApiService.changeChannelMessagePinnedState(userPost!.channelId,
          userPost.id!, userPost.userId!, !userPost.pinned);

  Future joinChannel(String channelId) async {
    String? userId = storage.getString(StorageKeys.currentUserId);
    String? orgId = storage.getString(StorageKeys.currentOrgId);
    String? token = storage.getString(StorageKeys.currentSessionToken);
    storage.setString(StorageKeys.currentChannelId, channelId);
    // await _channelsApiService.joinChannel(channelId);
    try {
      final res = await _api
          .post('v1/$orgId/channels/$channelId/members/', token: token, body: {
        '_id': userId,
      });

      log.i(res?.data);
      //  channelMessages = res?.data["data"] ?? [];

      //  log.i(channelMessages);
      return res?.data ?? {};
    } on Exception catch (e) {
      log.e(e.toString());
      return {};
    }
  }

  void checkUserId() async {
    await Future.delayed(const Duration(milliseconds: 10));
    _checkUser =
        channelMembers.any((member) => member.name == _userService.userId);

    log.i(_checkUser);
    notifyListeners();
  }

  void getChannelSocketId(String channelId) async {
    final channelSockId =
        await _channelsApiService.getChannelSocketId(channelId);

    websocketConnect(channelSockId);
  }

  void fetchChannelMembers(String channelId) async {
    channelMembers =
        await _channelsApiService.getChannelMembers(channelId) ?? [];
    notifyListeners();
  }

  void fetchMessages(String channelId) async {
    List? channelMessages =
        await _channelsApiService.getChannelMessages(channelId);
    channelUserMessages = [];

    channelMessages.forEach((data) async {
      String userid = data["user_id"];

      channelUserMessages?.add(
        UserPost(
          id: data['_id'],
          displayName: userid,

          statusIcon: '⭐',

          moment: Moment.now().from(DateTime.parse(data['timestamp'])),
          message: data['content'],
          channelType: ChannelType.public,
          postEmojis: <PostEmojis>[],
          userThreadPosts: <UserThreadPost>[],
          channelName: channelId,
          userImage: 'assets/images/chimamanda.png',
          userId: userid,
          channelId: channelId,
          pinned: data['pinned'],

          postMediaFiles: (data['files'] as List)
              .map((e) => PostFiles(
                  id: "",
                  srcLink: e,
                  type: PostFileType.text,
                  size: null,
                  fileName: null))
              .toList(),

        ),
      );
    });
    isLoading = false;
    notifyListeners();
  }

  void sendMessage(String message, [List<File>? media]) async {
    try {
      String? userId = storage.getString(StorageKeys.currentUserId);
      List<String> urls = [];
      if (media != null) {
        for (int i = 0; i < media.length; i++) {
          var url = await _mediaService.uploadImage(media[i], pluginId);
          urls.add(url!);
        }
      }

      await _channelsApiService.sendChannelMessages(
          channelID, "$userId", message, urls);

      scrollController.jumpTo(scrollController.position.minScrollExtent);

      notifyListeners();
    } catch (e) {
      _snackbarService.showCustomSnackBar(
        duration: const Duration(seconds: 1),
        message: "Could not send message, please check your internet",
        variant: SnackbarType.failure,
      );
    }
  }

  void navigateToShareMessage(UserPost userPost) =>
      _navigationService.navigateTo(Routes.shareMessageView,
          arguments: ShareMessageViewArguments(userPost: userPost));

  void exitPage() => _navigationService.back();

  String time() {
    return "${DateTime.now().hour.toString()}:${DateTime.now().minute.toString()}";
  }

  Future? navigateToChannelInfoScreen(int numberOfMembers,
      ChannelModel channelDetail, String channelName) async {
    await NavigationService().navigateTo(Routes.channelInfoView,
        arguments: ChannelInfoViewArguments(
          numberOfMembers: numberOfMembers,
          channelName: channelName,
          channelMembers: channelMembers,
          channelDetail: channelDetail,
        ));
  }

  Future? navigateToAddPeople(String channelName, String channelId) async {
    await _navigationService.navigateTo(Routes.channelAddPeopleView,
        arguments: ChannelAddPeopleViewArguments(
            channelId: channelId, channelName: channelName));
    _snackbarService.showCustomSnackBar(
        duration: const Duration(milliseconds: 2048),
        message: "Members were added successfully",
        variant: SnackbarType.success);
    fetchChannelMembers(channelId);
  }

  void goBack(channelId, value, channelName, membersCount, public) {
    storeDraft(channelId, value, channelName, membersCount, public);
    _navigationService.back();
  }

  void exit() => _navigationService.back();

  void navigateToChannelEdit(String channelName, String channelId) {
    _navigationService.navigateTo(Routes.editChannelPageView,
        arguments: EditChannelPageViewArguments(
          channelName: channelName,
          channelId: channelId,
        ));
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

  @override
  void setFormStatus() {
    // TODO: implement setFormStatus
  }

  void scheduleMessage(double delay, String text, String channelID) async {
    delay = delay * 60; //Converting from hour to minutes

    int value = delay.toInt();
    String? userId = storage.getString(StorageKeys.currentUserId);
    Future.delayed(Duration(minutes: value), () async {
      _channelsApiService.sendChannelMessages(channelID, "$userId", text);

      notifyListeners();
    });
  }
}
