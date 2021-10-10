import 'dart:convert';

import 'package:hng/constants/app_strings.dart';
import 'package:hng/package/base/server-request/api/zuri_api.dart';
import 'package:hng/services/local_storage_services.dart';
import 'package:hng/services/user_service.dart';
import 'package:hng/utilities/constants.dart';
import 'package:hng/utilities/storage_keys.dart';
import 'package:intl/intl.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:hng/app/app.logger.dart';
import '../../../../app/app.locator.dart';
import '../../../../models/user_post.dart';
import '../../../../utilities/enums.dart';

class ThreadDetailViewModel extends BaseViewModel {
  final _navigationService = locator<NavigationService>();
  final storage = locator<SharedPreferenceLocalStorage>();
  final log = getLogger("ThreadDetailViewModel");

  final _bottomSheetService = locator<BottomSheetService>();
  final _apiService = ZuriApi(channelsBaseUrl);
  final _userService = locator<UserService>();

  List<UserThreadPost> channelThreadMessages = [];
  late String channelMessageId;

  bool _isVisible = false;
  bool get isVisible => _isVisible;

  void onMessageFieldTap() {
    _isVisible = true;
    notifyListeners();
  }

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

  void showThreadOptions() async {
    await _bottomSheetService.showCustomSheet(
      variant: BottomSheetType.threadOptions,
      isScrollControlled: true,
    );
  }

  void onMessageFocusChanged() {
    _isVisible = false;
    notifyListeners();
  }

  void initialise(String messageId) {
    channelMessageId = messageId;
    fetchThreadMessages();
    setBusy(true);
  }

  void fetchThreadMessages() async {
    List? threadMessages =
        await _apiService.getRepliesToMessages(channelMessageId, currentOrg);

    channelThreadMessages.clear();
    threadMessages.forEach((message) async {
      String userId = message["user_id"];

      channelThreadMessages.add(UserThreadPost(
          channelId: "345",
          id: message["_id"],
          displayName: userId,
          message: message["content"],
          postEmojis: <PostEmojis>[],
          userId: userId,
          postDate: time(message["timestamp"]),
          statusIcon: "7️⃣",
          userImage: Chimamanda));
    });
    setBusy(false);
    notifyListeners();
  }

  Future<void> sendThreadMessage(String message, String channelId) async {
    await _apiService.addReplyToMessage(
        channelMessageId, message, null, currentOrg, userId, channelId);
    fetchThreadMessages();
  }

  String get currentOrg => _userService.currentOrgId;

  String get userId => _userService.userId;

  void exitPage() {
    _navigationService.back();
  }

  String time(String timeStamp) {
    return DateFormat.Hm().format(DateTime.parse(timeStamp));
  }
}
