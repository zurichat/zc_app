import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:flutter/widgets.dart';
import 'package:simple_moment/simple_moment.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:zurichat/app/app.locator.dart';
import 'package:zurichat/app/app.logger.dart';
import 'package:zurichat/app/app.router.dart';
import 'package:zurichat/models/channel_members.dart';
import 'package:zurichat/models/channel_model.dart';
import 'package:zurichat/models/user_post.dart';
import 'package:zurichat/services/app_services/local_storage_services.dart';
import 'package:zurichat/services/app_services/media_service.dart';
import 'package:zurichat/services/app_services/notification_service.dart';
import 'package:zurichat/services/in_review/user_service.dart';
import 'package:zurichat/services/messaging_services/centrifuge_rtc_service.dart';
import 'package:zurichat/services/messaging_services/channels_api_service.dart';
import 'package:zurichat/ui/shared/shared.dart';
import 'package:zurichat/utilities/api_handlers/zuri_api.dart';
import 'package:zurichat/utilities/constants/app_strings.dart';
import 'package:zurichat/utilities/constants/storage_keys.dart';
import 'package:zurichat/utilities/enums.dart';

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
  //TODO LUGIN ID - I GUESS THIS PLUGIN ID IS FOR UPLOADING PICTURES
  String pluginId = '6165f520375a4616090b8275';
  final snackbar = locator<SnackbarService>();

  //DRAFT IMPLEMENTATION
  var storedDraft = '';
  void getDraft(channelId) {
    var currentOrgId = _storageService.getString(StorageKeys.currentOrgId);
    var currentUserId = _storageService.getString(StorageKeys.currentUserId);

    List<String>? spList =
        _storageService.getStringList(StorageKeys.currentUserChannelIdDrafts);
    if (spList != null) {
      for (String e in spList) {
        if (jsonDecode(e)['channelId'] == channelId &&
            currentOrgId == jsonDecode(e)['currentOrgId'] &&
            currentUserId == jsonDecode(e)['currentUserId']) {
          storedDraft = jsonDecode(e)['draft'];
          spList.remove(e);
          _storageService.setStringList(
              StorageKeys.currentUserChannelIdDrafts, spList);
          return;
        }
      }
    }
  }

  // STORE MESSAGES IN DRAFTS
  void storeDraft(channelId, value, channelName, membersCount, public) {
    var currentOrgId = _storageService.getString(StorageKeys.currentOrgId);
    var currentUserId = _storageService.getString(StorageKeys.currentUserId);

    var keyMap = {
      'draft': value,
      'time': '${DateTime.now()}',
      'channelName': channelName,
      'channelId': channelId,
      'membersCount': membersCount,
      'public': public,
      'currentOrgId': currentOrgId,
      'currentUserId': currentUserId,
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

  List<ChannelMember> channelMembers = [];
  List<UserPost>? channelUserMessages = [];
  StreamSubscription? messageSubscription;
  StreamSubscription? notificationSubscription;
  String channelID = '';
  String channelCreator = '';

  //ADD TO SAVED ITEMS
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
      log.wtf(len!.length.toString());
    }
  }

  void onMessageFieldTap() {
    isVisible = true;
    notifyListeners();
  }

  // THE CHANNEL CREATOR
  getChannelCreator(String channelId) async {
    var response = await _channelsApiService.getChanelCreator(channelId);
    channelCreator = response['owner'];
    notifyListeners();
  }

  void updateCheckUser() {
    _checkUser = false;
    notifyListeners();
  }

  ///INITIALIZATION WHICH INCLUDES JOINING CHANNEL, FETCHING MESSAGES,
  ///LISTENING TO NEW MESSAGES, GETTING THE CHANNEL SOCKET ID AND GETTING THE CHANNEL CREATOR
  void initialise(String channelId) async {
    storage.setString(StorageKeys.currentChannelId, channelId);
    channelID = channelId;

    //TODO: join channel wasn't done
    await joinChannel(channelId);

    fetchMessages(channelId);
    getChannelSocketId(channelId);
    //TODO: this was returning the error
    //fetchChannelMembers(channelId);
    listenToNewMessage(channelId);
    getChannelCreator(channelId);
  }

  //BOTTOM SHEET TO SHOW THREAD OPTIONS
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

  // FUNCTION TO CHECK THE PINNED STATE OF A MESSAGE
  Future<bool> changePinnedState(UserPost? userPost) {
    return _channelsApiService.changeChannelMessagePinnedState(
        userPost!.channelId, userPost.id!, userPost.userId!, !userPost.pinned);
  }

  // FUNCTION FOR JOIN CHANNEL
  Future joinChannel(String channelId) async {
    String? userId = storage.getString(StorageKeys.currentUserId);
    String? orgId = storage.getString(StorageKeys.currentOrgId);
    String? token = storage.getString(StorageKeys.currentSessionToken);
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

  // FUNCTION TO CHECK A USER ID
  void checkUserId() async {
    await Future.delayed(const Duration(milliseconds: 10));
    _checkUser =
        channelMembers.any((member) => member.name == _userService.userId);

    log.i(_checkUser);
    notifyListeners();
  }

  // FUNCTION TO CHECK A CHANNEL SOCKET ID
  void getChannelSocketId(String channelId) async {
    final channelSockId =
        await _channelsApiService.getChannelSocketId(channelId);

    websocketConnect(channelSockId);
  }

  //FUNCTION TO FETCH CHANNEL MEMBERS
  void fetchChannelMembers(String channelId) async {
    channelMembers =
        await _channelsApiService.getChannelMembers(channelId) ?? [];
    notifyListeners();
  }

  String messageEventCheck(Map message) {
    if (message['content'] == 'event') {
      if (message['event']['action'] == 'join:channel') {
        return "${message['user_id']} has joined the channel";
      }
      return "...";
    } else {
      return message['content'];
    }
  }

  // FUNCTION TO DELETE A CHANNEL
  Future<void> deleteChannel(ChannelModel channel) async {
    try {
      bool res = await _channelsApiService.deleteChannel(
          _userService.currentOrgId, channel.id);
      if (res) {
        snackbar.showCustomSnackBar(
          duration: const Duration(seconds: 3),
          variant: SnackbarType.success,
          message: 'Channels ${channel.name} deleted successful',
        );

        _navigationService.back();
      } else {
        snackbar.showCustomSnackBar(
          duration: const Duration(seconds: 3),
          variant: SnackbarType.failure,
          message: DeleteOrgError,
        );
      }
    } catch (e) {
      snackbar.showCustomSnackBar(
        duration: const Duration(seconds: 3),
        variant: SnackbarType.failure,
        message: e.toString(),
      );
    }
  }

  // FUNCTION TO FETCH MESSAGES
  void fetchMessages(String channelId) async {
    List? channelMessages =
        await _channelsApiService.getChannelMessages(channelId);
    channelUserMessages = [];

    log.wtf(channelMessages[0].toString());

    channelMessages.forEach((data) async {
      String userid = data["user_id"];

      channelUserMessages?.add(
        UserPost(
          id: data['_id'],
          displayName:
              _userService.userId == userid ? _userService.userEmail : userid,
          statusIcon: '⭐',
          moment: Moment.now().from(DateTime.parse(data['timestamp'])),
          message: messageEventCheck(data),
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

  // FUNCTION TO DELETE A MESSAGE
  void deleteMessage(String channelId, String messageId) async {
    String? userId = storage.getString(StorageKeys.currentUserId);
    String? orgId = storage.getString(StorageKeys.currentOrgId);
    await _channelsApiService.deleteChannelMessage(
        orgId!, channelId, messageId, userId!);

    fetchMessages(channelId);
    scrollController.jumpTo(scrollController.position.minScrollExtent);
    _navigationService.back();
    notifyListeners();
  }

  //FUNCTION TO SEND A MESSAGE - BOTH TEXT AND MEDIA
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
      fetchChannelMembers(channelID);
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
    _navigationService.back();
    storeDraft(channelId, value, channelName, membersCount, public);
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

  // FUNCTION TO LISTEM TO NEW MESSAGES
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

  //  A DISPOSE FUNCTION
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

  // FUNCTION TO SHCEDULE A MESSAGE
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
