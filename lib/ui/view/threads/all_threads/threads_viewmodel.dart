import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import '../../../../app/app.locator.dart';
import '../../../../app/app.router.dart';
import '../../../../models/user_post.dart';
import '../test_data.dart';

class ThreadsViewModel extends BaseViewModel {
  final _navigationService = locator<NavigationService>();

  List<UserPost> userPosts = userPost;

  void initialise() {
    refreshThreadsPage();

    notifyListeners();
  }

  Future<void> refreshThreadsPage() async {
    notifyListeners();
    await Future.delayed(
      const Duration(seconds: 5),
    );
  }

  void exitPage() {
    _navigationService.back();
  }

  Future<void> navigateToThread(UserPost? userPost) async {
    _navigationService.navigateTo(Routes.threadDetailView,
        arguments: ThreadDetailViewArguments(userPost: userPost));
  }
}
