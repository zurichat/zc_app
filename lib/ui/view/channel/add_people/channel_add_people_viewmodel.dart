import 'package:hng/app/app.locator.dart';
import 'package:hng/models/static_user_model.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class ChannelAddPeopleViewModel extends BaseViewModel {
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

  navigateBack() => _navigationService.popRepeated(1);
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
