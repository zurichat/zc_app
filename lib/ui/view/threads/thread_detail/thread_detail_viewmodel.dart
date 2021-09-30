import 'package:flutter/widgets.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import '../../../../package/base/server-request/channels/channels_api_service.dart';

import '../../../../app/app.locator.dart';
import '../../../../models/user_post.dart';
import '../../../../utilities/enums.dart';

class ThreadDetailViewModel extends BaseViewModel {
  final _navigationService = locator<NavigationService>();
  final _bottomSheetService = locator<BottomSheetService>();
  final _channelsApiService = locator<ChannelsApiService>();

  bool _isVisible = false;
  bool isLoading = true;
  bool get isVisible => _isVisible;

  List<UserThreadPost>? messsageRepliesList = [];

  ScrollController scrollController = ScrollController();
  initialize(UserPost post) async {
    await getRepliesToMessages(post);
  }

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

  Future<void> getRepliesToMessages(UserPost? post) async {
    List? threadReplies =
        await _channelsApiService.getRepliesToMessages(post?.id);

    threadReplies.forEach(
      (reply) {
        messsageRepliesList!.add(
          UserThreadPost(
            id: reply['_id'],
            displayName: reply['user_id'],
            message: reply['content'],
            postEmojis: reply['emojis'],
            userId: reply['user_id'],
            userImage: 'assets/images/user.png',
            postDate: time(
              reply['timestamp'],
            ),
          ),
        );
      },
    );
    isLoading = false;
    notifyListeners();
  }

  void onMessageFocusChanged() {
    _isVisible = false;
    notifyListeners();
  }

  void addReply({String? reply, String? channelMessageId, channelId}) async {
    final res =
        await _channelsApiService.addReplyToMessage(channelMessageId, reply);
  }

  void exitPage() {
    _navigationService.back();
  }

  String time(timestamp) {
    return '''${DateTime.parse(timestamp).hour.toString()}'''
        ''':${DateTime.parse(timestamp).minute.toString()}''';
  }
}
