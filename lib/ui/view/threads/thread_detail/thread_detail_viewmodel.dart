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

  //Note that the receiverID has to be unique to a dm_user_view
  //instance, attached to a particular user.

  var storedDraft='';
  void getDraft(UserPost? userPost){
    if(userPost != null){
      var draft = storageService.getString(userPost.id.toString());
      if (draft != null) {
        storedDraft = json.decode(draft)['draft'];
        storageService.clearData(userPost.id.toString());
      }
    }
  }

  void storeDraft(UserPost? userPost, value){
    var _keyMap = {
      'draft': value,
      'time' : '${DateTime.now()}',
      'userPostName' : 'userPostName',
      'userPost' : userPost,
    };

    if(value.length > 0){
      if(userPost != null){
        storageService.setStringList(
            StorageKeys.currentUserThreadDrafts, [userPost.id.toString()]);
        storageService.setString(userPost.id.toString(), json.encode(_keyMap));
      }
    }
  }
//draft implementation ends here



}
