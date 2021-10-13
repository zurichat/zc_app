import 'dart:convert';

import 'package:hng/package/base/server-request/channels/channels_api_service.dart';
import 'package:hng/services/local_storage_services.dart';
import 'package:hng/utilities/storage_keys.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import '../../../../app/app.locator.dart';
import '../../../../app/app.router.dart';
import '../../../../models/user_post.dart';
import '../../../../utilities/enums.dart';
import 'package:hng/app/app.logger.dart';

class ThreadCardViewModel extends BaseViewModel {
  final _navigationService = locator<NavigationService>();
  final _bottomSheetService = locator<BottomSheetService>();
  final _channelsApiService = locator<ChannelsApiService>();
  final _storage = locator<SharedPreferenceLocalStorage>();
  final log = getLogger("ThreadCardViewModel");

  //TODO Delete this random number stuff
  //this was created to give the emojis unique ids which  would be handled by the backend
  int randomVarBank = 1000;

  goBack() => _navigationService.back();

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
      var currentList = _storage.getStringList(StorageKeys.savedItem) ?? [];
      currentList.add(messageID!);
      await _storage.setStringList(StorageKeys.savedItem, currentList);
      await _storage.setString(messageID, json.encode(savedMessageMap));
      log.i(savedMessageMap);
      final len = _storage.getStringList(StorageKeys.savedItem);
      log.w(len!.length.toString());
    }
  }

  Future<bool> changePinnedState(UserPost? userPost) =>
      _channelsApiService.changeChannelMessagePinnedState(userPost!.channelId,
          userPost.id!, userPost.userId!, !userPost.pinned);

  Future navigateToThread(UserPost? userPost) async {
    _navigationService.navigateTo(
      Routes.threadDetailView,
      arguments: ThreadDetailViewArguments(userPost: userPost),
    );
  }

  Future viewProfile() async {
    await _bottomSheetService.showCustomSheet(
      variant: BottomSheetType.user,
      isScrollControlled: true,
    );
  }

  Future addEmojis(UserPost? userPost) async {
    String? emoji;
    var sheetResponse = await _bottomSheetService.showCustomSheet(
      variant: BottomSheetType.emojiPicker,
      isScrollControlled: true,
    );

    if (sheetResponse!.confirmed == true) {
      emoji = sheetResponse.data.emoji;

      userPost!.addReaction(
          PostEmojis(id: randomVarBank, postEmoji: emoji, postEmojiCount: 1));

      //TODO remove this
      randomVarBank += 1;
      notifyListeners();
    }
  }

  void checkReact(UserPost? userPost, int? emojiId) {
    userPost!.postEmojis!.where((e) {
      if (e.id == emojiId) {
        e.hasReacted ? unReact(userPost, e) : react(e);
      }

      return false;
    });
  }

  void react(PostEmojis emoji) {
    emoji.postEmojiCount += 1;
    emoji.hasReacted = true;
    notifyListeners();
  }

  void unReact(UserPost post, PostEmojis emoji) {
    if ((emoji.postEmojiCount) <= 1) {
      emoji.postEmojiCount -= 1;
      post.postEmojis!.remove(emoji);
    } else {
      emoji.postEmojiCount -= 1;
      emoji.hasReacted = false;
    }

    notifyListeners();
  }
}
