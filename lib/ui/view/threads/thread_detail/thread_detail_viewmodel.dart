import 'package:hng/package/base/server-request/threads/threads_api_service.dart';
import 'package:intl/intl.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../../../app/app.locator.dart';
import '../../../../models/user_post.dart';
import '../../../../utilities/enums.dart';

class ThreadDetailViewModel extends BaseViewModel {
  final _navigationService = locator<NavigationService>();
  final _bottomSheetService = locator<BottomSheetService>();
  final _threadsApiService = locator<ThreadsApiService>();


  List<UserThreadPost> channelThreadMessages = [];
  late String channelMessageId;

  bool _isVisible = false;
  bool get isVisible => _isVisible;

  void onMessageFieldTap() {
    _isVisible = true;
    notifyListeners();
  }

  void showThreadOptions() async {
    // ignore: unused_local_variable
    final sheetResponse = await _bottomSheetService.showCustomSheet(
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
    List? threadMessages = await _threadsApiService
        .getThreadMessages(channelMessageId);

    channelThreadMessages.clear();
    threadMessages.forEach((message) async {
      String userId = message["user_id"];

      channelThreadMessages.add(
          UserThreadPost(
              id: message["_id"],
              displayName: userId,
              message: message["content"],
              postEmojis: <PostEmojis>[],
              userId: userId,
              postDate: time(message["timestamp"]),
              statusIcon: "7️⃣",
              userImage: "assets/images/chimamanda.png"
          )
      );

    });
    setBusy(false);
    notifyListeners();
  }

  Future<void> sendThreadMessage(String message, String channelId) async {
    await _threadsApiService.sendThreadMessage(messageId: channelMessageId, message: message, channelId: channelId);
    fetchThreadMessages();
  }
  
  


  void exitPage() {
    _navigationService.back();
  }

  String time(String timeStamp) {
    return DateFormat.Hm().format(DateTime.parse(timeStamp));
  }
}
