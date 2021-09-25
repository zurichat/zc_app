import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import '../../../../app/app.locator.dart';
import '../../../../app/app.router.dart';
import '../../../../models/user_post.dart';
import '../../../../utilities/enums.dart';

class ThreadCardViewModel extends BaseViewModel {
  final _navigationService = locator<NavigationService>();
  final _bottomSheetService = locator<BottomSheetService>();

  //TODO Delete this random number stuff
  //this was created to give the emojis unique ids which  would be handled by the backend
  int randomVarBank = 1000;

  Future navigateToThread(UserPost? userPost) async {
    _navigationService.navigateTo(Routes.threadDetailView,
        arguments: ThreadDetailViewArguments(userPost: userPost));
  }

  Future viewProfile() async {
    var sheetResponse = await _bottomSheetService.showCustomSheet(
      variant: BottomSheetType.user,
      isScrollControlled: true,
    );
  }

  Future addEmojis(UserPost? userPost) async {
    var emoji;
    var sheetResponse = await _bottomSheetService.showCustomSheet(
      variant: BottomSheetType.emojiPicker,
      isScrollControlled: true,
    );

    if (sheetResponse!.confirmed == true) {
      emoji = sheetResponse.data.emoji;
      print(emoji);

      userPost!.addReaction(
          PostEmojis(id: randomVarBank, postEmoji: emoji, postEmojiCount: 1));
      //TODO remove this
      randomVarBank += 1;
      notifyListeners();
    }
  }

  void checkReact(UserPost? userPost, int? emojiId) {
    var testvar = userPost!.postEmojis!.where((e) {
      if (e.id == emojiId) {
        e.hasReacted ? unReact(userPost, e) : react(e);
      }

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
}
