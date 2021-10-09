import 'dart:convert';

import 'package:hng/constants/app_strings.dart';
import 'package:hng/package/base/server-request/api/zuri_api.dart';
import 'package:hng/services/user_service.dart';
import 'package:hng/utilities/constants.dart';
import 'package:hng/utilities/storage_keys.dart';
import 'package:intl/intl.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import '../../../../app/app.locator.dart';
import '../../../../models/user_post.dart';
import '../../../../package/base/server-request/api/zuri_api.dart';
import '../../../../services/local_storage_services.dart';
import '../../../../services/user_service.dart';
import '../../../../utilities/constants.dart';
import '../../../../utilities/enums.dart';

class ThreadDetailViewModel extends BaseViewModel {
  final _navigationService = locator<NavigationService>();
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
    storeDraft(userPost, value);
    _navigationService.back();
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

  void getDraft(userPost){
    List<String>? spList = storageService.getStringList(StorageKeys.currentUserThreadIdDrafts);
    if (spList != null){
      for ( String encodedStoredDraft in spList) {
        if(jsonDecode(encodedStoredDraft)['userPostId'] == userPost.id &&
            jsonDecode(encodedStoredDraft)['userPostChannelName'] == userPost.channelName &&
            jsonDecode(encodedStoredDraft)['userPostChannelId'] == userPost.channelId
    ){
          storedDraft = jsonDecode(encodedStoredDraft)['draft'];
          spList.remove(encodedStoredDraft);
          storageService.setStringList(StorageKeys.currentUserThreadIdDrafts, spList);
          return;
        }
      }
    }
  }

  void storeDraft(userPost, value){
    List<List<String>> emojis = [];
    List<String> emoji;

    if(userPost.postEmojis != null){
      for(PostEmojis postEmoji in userPost.postEmojis ){
        emoji = [
          postEmoji.id.toString(),
          postEmoji.postEmoji!,
          postEmoji.postEmojiCount.toString(),
          postEmoji.hasReacted.toString()
        ];
        emojis.add(emoji);
      }
    }

    var keyMap = {
      'draft': value,
      'time' : '${DateTime.now()}',
      'userPostId' : userPost.id,
      'userPostChannelName' : userPost.channelName,
      'userPostMessage' : userPost.message,
      'userPostDisplayName' : userPost.displayName,
      'userPostChannelId' : userPost.channelId,
      'userPostChannelType': userPost.channelType.toString(),
      'userPostPostEmojis' : emojis
    };

    List<String>? spList = storageService.getStringList(StorageKeys.currentUserThreadIdDrafts);

    if(value.length > 0 && spList != null){
      spList.add(json.encode(keyMap));
      storageService.setStringList(StorageKeys.currentUserThreadIdDrafts, spList);
    }else if (value.length > 0 && spList == null){
      spList = [json.encode(keyMap)];
      storageService.setStringList(StorageKeys.currentUserThreadIdDrafts, spList);
    }
  }
  //**draft implementation ends here

}
