import 'dart:async';
import 'dart:developer';
import 'package:hng/app/app.locator.dart';
import 'package:hng/app/app.router.dart';
import 'package:hng/constants/app_strings.dart';
import 'package:hng/models/channel_members.dart';
import 'package:hng/models/channel_model.dart';
import 'package:hng/package/base/server-request/api/zuri_api.dart';
import 'package:hng/package/base/server-request/channels/channels_api_service.dart';
import 'package:hng/package/base/server-request/dms/dms_api_service.dart';
import 'package:hng/services/centrifuge_service.dart';
import 'package:hng/services/connectivity_service.dart';
import 'package:hng/services/local_storage_services.dart';
import 'package:hng/services/notification_service.dart';
import 'package:hng/services/user_service.dart';
import 'package:hng/ui/nav_pages/home_page/home_item_model.dart';
import 'package:hng/ui/nav_pages/home_page/widgets/home_list_items.dart';
import 'package:hng/utilities/constants.dart';
import 'package:hng/utilities/enums.dart';
import 'package:hng/utilities/storage_keys.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

bool connectionStatus = false;

class HomePageViewModel extends StreamViewModel {
  final _navigationService = locator<NavigationService>();
  final userService = locator<UserService>();
  final connectivityService = locator<ConnectivityService>();
  final dmApiService = locator<DMApiService>();
  final zuriApi = ZuriApi(channelsBaseUrl);
  final channelsApiService = locator<ChannelsApiService>();
  final storageService = locator<SharedPreferenceLocalStorage>();
  final _centrifugeService = locator<CentrifugeService>();
  final _notificationService = locator<NotificationService>();

  String? get token =>
      storageService.getString(StorageKeys.currentSessionToken);

  final navigation = locator<NavigationService>();
  final snackbar = locator<SnackbarService>();
  // final _channelsApiService = locator<ChannelsApiService>();
  bool connectionStatus = false;

  List<ChannelModel> _channelsList = [];
  ChannelModel? _channel;
  List<ChannelModel> get channelsList => _channelsList;
  ChannelModel get channel => _channel!;
  List<ChannelMembermodel> _membersList = [];
  List get membersList => _membersList;

  ///This contains the list of data for both the channels and dms
  List<HomeItemModel> homePageList = [];
  List<HomeItemModel> unreads = [];
  List<HomeItemModel> joinedChannels = [];
  List<HomeItemModel> directMessages = [];

  String get orgName => userService.currentOrgName;
  String get orgId => userService.currentOrgId;

  StreamSubscription? notificationSub;

  @override
  Stream get stream => checkConnectivity();

  void nToPref() {
    _navigationService.navigateTo(Routes.fileSearchView);
  }

  navigateToInfo() {
    _navigationService.navigateTo(Routes.channelInfoView);
  }

  navigateToOrganization() {
    _navigationService.navigateTo(Routes.organizationView);
  }

  navigateToDmUser() {
    _navigationService.navigateTo(Routes.dmUserView);
  }

  navigateToThreads() async {
    await _navigationService.navigateTo(Routes.threadsView);
  }

  void navigateToJumpToScreen() {
    _navigationService.navigateTo(Routes.dmJumpToView);
  }

  void navigateToStartDMScreen() {
    _navigationService.navigateTo(Routes.startDmView);
  }

  @override
  void onError(error) {
    log('Error: $error');
  }

  @override
  void onSubscribed() {}

  getNewChannelStream() {
    channelsApiService.controller.stream.listen((event) {
      getDmAndChannelsList();
    });
  }

  Stream<bool> checkConnectivity() async* {
    yield await connectivityService.checkConnection();
  }

  bool get status {
    stream.listen((event) {
      connectionStatus = event;
      notifyListeners();
    });
    return connectionStatus;
  }

  ///This sets all the expanded list items
  ///into unreads, channels and dms
  setAllList() {
    homePageList.forEach((e) {
      if (e.unreadCount != null && e.unreadCount != 0) {
        unreads.add(e);
      } else if (e.type == HomeItemType.channels) {
        joinedChannels.add(e);
      } else if (e.type == HomeItemType.dm) {
        directMessages.add(e);
      }
    });
  }

  //
  //*Navigate to other routes
  void navigateToPref() {
    _navigationService.navigateTo(Routes.fileSearchView);
  }

  void navigateToUserSearchView() {
    _navigationService.navigateTo(Routes.userSearchView);
  }

  getDmAndChannelsList() async {
    homePageList = [];
    setBusy(true);

    List? channelsList = await channelsApiService.getActiveDms();

    channelsList.forEach(
      (data) {
        listenToChannelMessage(data['_id']);
        homePageList.add(
          HomeItemModel(
            type: HomeItemType.channels,
            unreadCount: 0,
            name: data['name'],
            id: data['_id'],
            public: data['private'] != "True",
            membersCount: data['members'],
          ),
        );
      },
    );

    //Todo: add channels implementation

    unreads.clear();
    directMessages.clear();
    joinedChannels.clear();

    setAllList();
    notifyListeners();
    print('All channels $homePageList');

    setBusy(false);
  }

  void listenToChannelMessage(String channelId) async {
    String channelSockId =
        await channelsApiService.getChannelSocketId(channelId);

    _centrifugeService.subscribe(channelSockId);
  }

  // listenToChannelsChange() {
  // _channelsApiService.onChange.stream.listen((event) {
  //   getDmAndChannelsList();
  // });

  navigateToChannelPage(String? channelname, String? channelId,
      int? membersCount, bool? public) async {
    try {
      if (!await connectivityService.checkConnection()) {
        snackbar.showCustomSnackBar(
          duration: const Duration(seconds: 3),
          variant: SnackbarType.failure,
          message: NoInternet,
        );

        return;
      }
      setBusy(true);
      // _channel= await api.getChannelPage(id);
      // _membersList= await api.getChannelMembers(id);
      setBusy(false);

      _moderateNavigation();
      navigation.navigateTo(Routes.channelPageView,
          arguments: ChannelPageViewArguments(
            channelname: channelname,
            channelId: channelId,
            membersCount: membersCount,
            public: public,
          ));
    } catch (e) {
      print(e.toString());
      snackbar.showCustomSnackBar(
        duration: const Duration(seconds: 3),
        variant: SnackbarType.failure,
        message: ErrorOccurred,
      );
    }
  }

  //Used for handling notification
  _moderateNavigation() {
    if (_navigationService.previousRoute != Routes.navBarView)
      _navigationService
          .popUntil((route) => route.settings.name == Routes.navBarView);
  }

  void listenToNotificationTap() {
    notificationSub = _notificationService.onNotificationTap.listen((payload) {
      navigateToChannelPage(
        payload.name,
        payload.roomId,
        payload.membersCount,
        payload.public,
      );
    });
  }

  void navigateToAllChannelsScreen() {
    NavigationService().navigateTo(Routes.channelList);
  }

  void onJumpToScreen() {
    navigationService.navigateTo(Routes.dmJumpToView);
  }

  @override
  void dispose() {
    notificationSub?.cancel();
    super.dispose();
  }

  // void navigateToDmUser() {
  //   _navigationService.navigateTo(Routes.dmUserView);
  // }
}
