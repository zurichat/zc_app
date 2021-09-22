import 'package:hng/app/app.locator.dart';
import 'package:hng/app/app.router.dart';
import 'package:hng/models/user_post.dart';
import 'package:hng/utilities/enums.dart';

import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import '../test_data.dart';

class ThreadsViewModel extends BaseViewModel {
  final _navigationService = locator<NavigationService>();

  List<UserPost> userPosts = userPost;
  

  void initialise() {
    //refresh page

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

  Future navigateToThread() async {
    _navigationService.navigateTo(Routes.threadDetailView);
  }
}
