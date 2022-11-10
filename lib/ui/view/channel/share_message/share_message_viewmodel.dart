import 'package:zurichat/app/app.locator.dart';
import 'package:zurichat/app/app.router.dart';
import 'package:zurichat/utilities/constants/app_strings.dart';
import 'package:zurichat/services/messaging_services/channels_api_service.dart';
import 'package:zurichat/services/app_services/local_storage_services.dart';
import 'package:zurichat/ui/nav_pages/home_page/home_item_model.dart';
import 'package:zurichat/utilities/enums.dart';
import 'package:zurichat/utilities/constants/storage_keys.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class ShareMessageViewModel extends FutureViewModel<List<HomeItemModel>> {
  final _navigationService = locator<NavigationService>();
  final _snackBarService = locator<SnackbarService>();
  final _channelsApiService = locator<ChannelsApiService>();
  final _storage = locator<SharedPreferenceLocalStorage>();

  String shareMessage = '';
  late HomeItemModel homeItemModel;

  void onChanged(HomeItemModel? homeItemModel) {
    this.homeItemModel = homeItemModel!;
    notifyListeners();
  }

  void sendMessage(String sharedMessage) async {
    var userID = _storage.getString(StorageKeys.currentUserId);
    if (shareMessage != '') {
      var newMessage = '$shareMessage: $sharedMessage';
      await _channelsApiService
          .sendChannelMessages(homeItemModel.id!, userID!, newMessage, []);
      _navigationService.popRepeated(2);
      _navigationService.navigateTo(Routes.channelPageView,
          arguments: ChannelPageViewArguments(
              channelName: homeItemModel.name,
              channelId: homeItemModel.id,
              membersCount: homeItemModel.membersCount,
              public: homeItemModel.public));
    } else {
      showSnackBar(EnterMessage);
    }
  }

  void showSnackBar(String message) => _snackBarService.showCustomSnackBar(
        duration: const Duration(seconds: 3),
        variant: SnackbarType.failure,
        message: message,
      );

  void close() => _navigationService.back();

  @override
  Future<List<HomeItemModel>> futureToRun() async {
    List<HomeItemModel> channelList = [];
    var data = await _channelsApiService.getActiveChannels();
    data.forEach(
      (element) => channelList.add(
        HomeItemModel(
          type: HomeItemType.channels,
          unreadCount: 0,
          name: element['name'],
          id: element['_id'],
          public: !element['private'],
          membersCount: element['members'],
        ),
      ),
    );
    homeItemModel = channelList.first;
    return channelList;
  }
}
