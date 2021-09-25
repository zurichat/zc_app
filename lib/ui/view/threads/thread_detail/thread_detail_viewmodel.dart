import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import '../../../../app/app.locator.dart';
import '../../../../models/user_post.dart';
import '../../../../utilities/enums.dart';

class ThreadDetailViewModel extends BaseViewModel {
  final _navigationService = locator<NavigationService>();
  final _bottomSheetService = locator<BottomSheetService>();

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

  void addReply(UserPost userPost, String? reply) {
    userPost.addReply(
      UserThreadPost(
        id: 25,
        displayName: 'richieoscar',
        userImage: 'assets/images/1.png',
        lastSeen: '4 hours ago',
        postDate: '20:23',
        message: reply,
      ),
    );
    notifyListeners();
  }

  void exitPage() {
    _navigationService.back();
  }

  String time() {
    return '${DateTime.now().hour.toString()}:${DateTime.now().minute.toString()}';
  }
}
