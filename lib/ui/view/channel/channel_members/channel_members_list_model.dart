import 'package:hng/app/app.locator.dart';
import 'package:hng/models/static_user_model.dart';

import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class ChannelMembersModel extends BaseViewModel {
  final _navigationService = locator<NavigationService>();

  bool get allMarked =>
      markedUsers.length == matchingUsers.length && matchingUsers.isNotEmpty;

  late List<StaticUserModel> matchingUsers = users;
  late List<StaticUserModel> markedUsers = [];

  final users = [
    StaticUserModel(
      online: true,
      userName: 'Chimamanda',
      userimg: 'chimamanda.png',
      joinInfo: '',
      time: '',
    ),
    StaticUserModel(
      online: false,
      userName: 'Naisu',
      userimg: 'naisu.png',
      joinInfo: '',
      time: '',
    ),
    StaticUserModel(
      online: false,
      userName: 'Baptist',
      userimg: 'baptist.png',
      joinInfo: '',
      time: '',
    ),
    StaticUserModel(
      online: true,
      userName: 'Gringo',
      userimg: 'gringo.png',
      joinInfo: '',
      time: '',
    ),
  ];

  void onSearchUser(String input) {
    matchingUsers = [
      ...users.where(
          (user) => user.userName.toLowerCase().contains(input.toLowerCase()))
    ];
    notifyListeners();
  }

  void onMarkOne(bool? marked, int i) {
    if (marked!) {
      markedUsers.add(matchingUsers[i]);
    } else {
      markedUsers.remove(matchingUsers[i]);
    }
    notifyListeners();
  }

  void onMarkAll(bool? marked) {
    markedUsers = marked! ? matchingUsers : [];
    notifyListeners();
  }

  void goBack() {
    _navigationService.back();
    /*
    navigator = locator<NavigationService>();
    It's still navigation service that was used.
    The test kills returning a null value if NavigationService is used directly inside of 
    */
  }
}
