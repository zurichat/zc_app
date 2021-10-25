import 'dart:convert';

import 'package:zurichat/utilities/constants/app_strings.dart';
import 'package:zurichat/utilities/api_handlers/zuri_api.dart';
import 'package:zurichat/services/app_services/local_storage_services.dart';
import 'package:zurichat/services/in_review/user_service.dart';
import 'package:zurichat/utilities/constants/app_constants.dart';
import 'package:zurichat/utilities/constants/storage_keys.dart';
import 'package:intl/intl.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:zurichat/app/app.logger.dart';
import '../../../../app/app.locator.dart';
import '../../../../models/user_post.dart';
import '../../../../utilities/api_handlers/zuri_api.dart';
import '../../../../services/app_services/local_storage_services.dart';
import '../../../../services/in_review/user_service.dart';
import '../../../../utilities/constants/app_constants.dart';
import '../../../../utilities/enums.dart';

class ThreadDetailViewModel extends BaseViewModel {
  final _navigationService = locator<NavigationService>();
  final storage = locator<SharedPreferenceLocalStorage>();
  final log = getLogger("ThreadDetailViewModel");

  final _bottomSheetService = locator<BottomSheetService>();
  final _apiService = ZuriApi(channelsBaseUrl);
  final _userService = locator<UserService>();
  final storageService = locator<SharedPreferenceLocalStorage>();

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

  void exitPage(userPost, value) {
    _navigationService.back();
    storeDraft(userPost, value);
  }

  Future<void> sendThreadMessage(String message, String channelId) async {
    await _apiService.addReplyToMessage(
        channelMessageId, message, null, currentOrg, userId, channelId);
    fetchThreadMessages();
  }

  String get currentOrg => _userService.currentOrgId;

  String get userId => _userService.userId;

  String time(String timeStamp) {
    return DateFormat.Hm().format(DateTime.parse(timeStamp));
  }

  //draft implementations
  //TODO - routing to ThreadDetails needs more fixing, the required parameter userPost of class UserPost proves to difficult access from the draft view.
  //TODO - resolve image

  var storedDraft = '';

  void getDraft(userPost) {
    var currentOrgId = storageService.getString(StorageKeys.currentOrgId);
    var currentUserId = storageService.getString(StorageKeys.currentUserId);
    List<String>? spList =
        storageService.getStringList(StorageKeys.currentUserThreadIdDrafts);
    if (spList != null) {
      for (String e in spList) {
        if (jsonDecode(e)['userPostId'] == userPost.id &&
            jsonDecode(e)['userPostChannelName'] == userPost.channelName &&
            currentOrgId == jsonDecode(e)['currentOrgId'] &&
            currentUserId == jsonDecode(e)['currentUserId']) {
          storedDraft = jsonDecode(e)['draft'];
          spList.remove(e);
          storageService.setStringList(
              StorageKeys.currentUserThreadIdDrafts, spList);
          return;
        }
      }
    }
  }

  void storeDraft(userPost, value) {
    var currentOrgId = storageService.getString(StorageKeys.currentOrgId);
    var currentUserId = storageService.getString(StorageKeys.currentUserId);
    var keyMap = {
      'draft': value,
      'time': '${DateTime.now()}',
      'userPostId': userPost.id,
      'userPostChannelName': userPost.channelName,
      'userPostMessage': userPost.message,
      'userPostDisplayName': userPost.displayName,
      'currentOrgId': currentOrgId,
      'currentUserId': currentUserId,
    };

    List<String>? spList =
        storageService.getStringList(StorageKeys.currentUserThreadIdDrafts);

    if (value.length > 0 && spList != null) {
      spList.add(json.encode(keyMap));
      storageService.setStringList(
          StorageKeys.currentUserThreadIdDrafts, spList);
    } else if (value.length > 0 && spList == null) {
      spList = [json.encode(keyMap)];
      storageService.setStringList(
          StorageKeys.currentUserThreadIdDrafts, spList);
    }
  }
//**draft implementation ends here

}
