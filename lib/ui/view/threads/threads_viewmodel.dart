import 'package:hng/app/app.locator.dart';
import 'package:hng/models/user_post.dart';
import 'package:hng/utilities/enums.dart';

import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import 'test_data.dart';

class ThreadsViewModel extends BaseViewModel {
  final _navigationService = locator<NavigationService>();

  List<UserPost> userPosts = userPost;
  final _bottomSheetService = locator<BottomSheetService>();

  //Delete this random number stuff
  //this was created to give the emojis unique ids which  would be handled by the backend
  int randomVarBank = 1000;

  void initialise() {
    //refresh page

    notifyListeners();
  }

  Future addEmojis(int? postId) async {
    var emoji;
    var sheetResponse = await _bottomSheetService.showCustomSheet(
      variant: BottomSheetType.emojiPicker,
      isScrollControlled: true,
    );

    if (sheetResponse!.confirmed == true) {
      emoji = sheetResponse.data.emoji;
      print(emoji);
      var testvar = userPosts.where((e) {
        if (e.id == postId) {
          e.addReaction(PostEmojis(
              id: randomVarBank, postEmoji: emoji, postEmojiCount: 1));
          //TODO remove this
          randomVarBank += 1;
          notifyListeners();
        }

        return false;
      });
      print(testvar);
    }
  }

  void checkReact(int? emojiId) {
    var testvar = userPosts.where((p) {
      var testvar1 = p.postEmojis!.where((e) {
        if (e.id == emojiId) {
          e.hasReacted ? unReact(p, e) : react(e);
        }

        return false;
      });
      print(testvar1);
      return false;
    });
    print(testvar);
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

  Future refreshThreadsPage() async {
    await Future.delayed(
      Duration(seconds: 5),
    );
  }

  void exitPage() {
    _navigationService.back();
  }
}
