import 'package:stacked/stacked.dart';

import '../../../models/user_model.dart';

class ChannelAddPeopleViewModel extends BaseViewModel {
  bool get allMarked =>
      markedUsers.length == matchingUsers.length && matchingUsers.isNotEmpty;

  late List<UserModel> matchingUsers = users;
  late List<UserModel> markedUsers = [];

  final users = [
    UserModel(
      online: true,
      userName: 'Chimamanda',
      userimg: 'chimamanda.png',
      joinInfo: '',
      time: '',
    ),
    UserModel(
      online: false,
      userName: 'Naisu',
      userimg: 'naisu.png',
      joinInfo: '',
      time: '',
    ),
    UserModel(
      online: false,
      userName: 'Baptist',
      userimg: 'baptist.png',
      joinInfo: '',
      time: '',
    ),
    UserModel(
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
    if (marked!)
      markedUsers.add(matchingUsers[i]);
    else
      markedUsers.remove(matchingUsers[i]);
    notifyListeners();
  }

  void onMarkAll(bool? marked) {
    markedUsers = marked! ? matchingUsers : [];
    notifyListeners();
  }
}
