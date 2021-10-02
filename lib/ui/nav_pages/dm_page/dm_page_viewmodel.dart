import 'package:hng/package/base/server-request/api/zuri_api.dart';
import 'package:hng/services/user_service.dart';
import 'package:hng/ui/shared/shared.dart';
import '../../../app/app.locator.dart';
import '../../../app/app.router.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class DmPageViewModel extends BaseViewModel {
  final navigationService = locator<NavigationService>();
  final apiService = ZuriApi(dmsBaseUrl);
  final userService = locator<UserService>();

  List<DmListItem> dmPageList = [];
  void init() {
    getDmList();
  }

  Future<List<DmListItem>> getDmList() async {
    await Future.delayed(const Duration(seconds: 2));
    final res = List.generate(20, (index) => index);
    //  await apiService.getActiveRooms(
    //     userService.currentOrgId, userService.userId, userService.authToken);
    // res.forEach((el) async {
    //   final data = await apiService.fetchRoomMessages(
    //       userService.currentOrgId, el["_id"]);
    //   dmPageList = res
    //       .map((e) => DmListItem(
    //             id: 'e["_id"]',
    //             name: 'e["room_name"]',
    //             userIds: [],//e["room_user_ids"],
    //             unread: 0,
    //             lastMessage: 'data?.data?[""]',
    //           ))
    //       .toList();
    // });
    dmPageList = res
        .map((e) => DmListItem(
              id: 'e["_id"]',
              name: 'e["room_name"]',
              userIds: [], //e["room_user_ids"],
              unread: 0,
              lastMessage: 'data?.data?[""]',
            ))
        .toList();
    notifyListeners();
    return dmPageList;
  }

  Stream<List<DmListItem>> dmListStream() async* {
    while (true) {
      await Future.delayed(const Duration(milliseconds: 300));
      yield await getDmList();
    }
  }

  void navigateToDmUserView() {
    navigationService.navigateTo(Routes.dmUserView);
  }

  void navigateToJumpToScreen() {
    navigationService.navigateTo(Routes.dmJumpToView);
  }
}

class DmListItem {
  final String id;
  final String name;
  final List<String> userIds;
  final int? unread;
  final String lastMessage;
  DmListItem(
      {required this.id,
      required this.name,
      required this.userIds,
      required this.unread,
      required this.lastMessage});
}
