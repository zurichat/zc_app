import 'package:zurichat/app/app.locator.dart';
import 'package:zurichat/app/app.router.dart';
import 'package:zurichat/constants/app_strings.dart';
import 'package:zurichat/models/organization_member_model.dart';
import 'package:zurichat/models/user_post.dart';
import 'package:zurichat/package/base/server-request/channels/channels_api_service.dart';
import 'package:zurichat/package/base/server-request/organization_request/organization_api_service.dart';
import 'package:zurichat/services/local_storage_services.dart';
import 'package:zurichat/ui/nav_pages/home_page/home_item_model.dart';
import 'package:zurichat/utilities/enums.dart';
import 'package:zurichat/utilities/storage_keys.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class ShareMessageViewModel extends FutureViewModel<List<HomeItemModel>> {
  final _navigationService = locator<NavigationService>();
  final _snackBarService = locator<SnackbarService>();
  final _channelsApiService = locator<ChannelsApiService>();
  final _organizationApiService = locator<OrganizationApiService>();
  final _storage = locator<SharedPreferenceLocalStorage>();
  List<OrganizationMemberModel> usersList = [];
  String message = '';
  late UserPost userPost;
  late HomeItemModel homeItemModel;

  void onChanged(HomeItemModel? homeItemModel) {
    this.homeItemModel = homeItemModel!;
    notifyListeners();
  }

  void sendMessage(String sharedMessage) async {
    var userID = _storage.getString(StorageKeys.currentUserId);
    if (message != '') {
      var map =
          "{message:$message,shared_message:$sharedMessage,shared_user_display_image:${userPost.userImage},user_shared_from:${userPost.displayName},channel_shared_from:${userPost.channelName}}";

      await _channelsApiService
          .sendChannelMessages(homeItemModel.id!, userID!, map.toString(), []);
      _navigationService.popRepeated(2);
      _navigationService.navigateTo(
        Routes.channelPageView,
        arguments: ChannelPageViewArguments(
            channelName: homeItemModel.name,
            channelId: homeItemModel.id,
            membersCount: homeItemModel.membersCount,
            public: homeItemModel.public),
      );
      showSnackBar(Success, SnackbarType.success);
    } else {
      showSnackBar(EnterMessage, SnackbarType.failure);
    }
  }

  void showSnackBar(String message, SnackbarType snackBarType) =>
      _snackBarService.showCustomSnackBar(
          duration: const Duration(seconds: 3),
          variant: snackBarType,
          message: message);

  void close() => _navigationService.back();

  @override
  Future<List<HomeItemModel>> futureToRun() async {
    List<HomeItemModel> channelList = [];
    var channels = await _channelsApiService.getActiveChannels();
    channels.forEach(
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
    getUsers();
    homeItemModel = channelList.first;
    return channelList;
  }

  void getUsers() async {
    var orgID = _storage.getString(StorageKeys.currentOrgId);
    var users = await _organizationApiService.getOrganizationMemberList(orgID!);
    usersList = users.data;
  }
}
