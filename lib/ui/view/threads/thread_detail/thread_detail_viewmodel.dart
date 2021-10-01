import 'package:flutter/widgets.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import '../../../../app/app.locator.dart';
import '../../../../models/user_post.dart';
import '../../../../package/base/server-request/api/zuri_api.dart';
import '../../../../services/local_storage_services.dart';
import '../../../../services/user_service.dart';
import '../../../../utilities/constants.dart';

import 'package:hng/app/app.logger.dart';
import '../../../../utilities/enums.dart';
import '../../../../utilities/storage_keys.dart';

class ThreadDetailViewModel extends BaseViewModel {
  final _navigationService = locator<NavigationService>();
  final _bottomSheetService = locator<BottomSheetService>();
  final storageService = locator<SharedPreferenceLocalStorage>();
  final log = getLogger('ThreadDetailViewModel');
  // final _channelsApiService = locator<ChannelsApiService>();
  final _userService = locator<UserService>();
  final _api = ZuriApi(channelsBaseUrl);

  bool _isVisible = false;
  bool isLoading = true;
  bool shouldLoad = false;
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
    final orgId = _userService.currentOrgId;
    List? threadReplies = await _api.getRepliesToMessages(post?.id, orgId);
    messsageRepliesList = [];
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
    loading(false);

    scrollController.jumpTo(scrollController.position.maxScrollExtent);
  }

  void onMessageFocusChanged() {
    _isVisible = false;
    notifyListeners();
  }

  void addReply(
      {String? reply, String? channelMessageId, channelId, files}) async {
    final orgId = _userService.currentOrgId;
    final userId = _userService.userId;
    final channelId = storageService.getString(StorageKeys.currentChannelId);
    final res = await _api.addReplyToMessage(
      channelMessageId,
      reply,
      files,
      orgId,
      userId,
      channelId,
    );
    if (res == true) {
      log.i('Reply successfully added');
    } else {
      log.e('Reply not successfully added');
    }
  }

  // ignore: always_declare_return_types
  listenForChanges(UserPost? post) async {
    _api.controller.stream.listen(
      (event) async {
        shouldLoadd(false);
        await getRepliesToMessages(post);
      },
    );
  }

  void exitPage() {
    _navigationService.back();
  }

  String time(timestamp) {
    return '''${DateTime.parse(timestamp).hour.toString()}'''
        ''':${DateTime.parse(timestamp).minute.toString()}''';
  }

  void loading(status) {
    isLoading = status;
    notifyListeners();
  }

  void shouldLoadd(status) {
    notifyListeners();
  }
}
