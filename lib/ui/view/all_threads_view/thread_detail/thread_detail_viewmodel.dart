import 'package:hng/app/app.locator.dart';
import 'package:hng/models/user_post.dart';
import 'package:hng/ui/view/all_threads_view/thread_detail/model/thread_detail_model.dart';
import 'package:hng/ui/view/all_threads_view/thread_detail/model/thread_replies.dart';
import 'package:hng/ui/view/dm_user/dummy_data/models/message.dart';
import 'package:hng/ui/view/threads/test_data.dart';
import 'package:hng/utilities/enums.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class ThreadDetailViewmodel extends BaseViewModel {
  final ThreadDetailModel data = ThreadDetailModel(
      userName: "richieoscar",
      threadTitle: "Messages",
      userImageUrl: "assets/images/1.png",
      date: "Sept 19 at 9:56am",
      message:
          "Please who is the team lead for mobile track? I have some questions please");

  final List<ThreadReplies> replies = ThreadReplies.replies();
  final _navigationService = locator<NavigationService>();
  bool _isVisible = false;
  bool get isVisible => _isVisible;

  void onMessageFieldTap() {
    _isVisible = true;
    notifyListeners();
  }

  void pop() {
    _navigationService.back();
  }

  void onMessageFocusChanged() {
    _isVisible = false;
    notifyListeners();
  }

  void addReply(ThreadReplies reply) {
    ThreadReplies.addReply(reply);
    notifyListeners();
  }

  String time() {
    return "${DateTime.now().hour.toString()}:${DateTime.now().minute.toString()}";
  }

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
}
