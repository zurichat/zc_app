import 'dart:developer';

import 'package:hng/package/base/server-request/channels/channels_api_service.dart';
import 'package:hng/package/base/server-request/dms/dms_api_service.dart';
import 'package:hng/ui/nav_pages/home_page/home_item_model.dart';
import 'package:hng/utilities/enums.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import '../../../app/app.locator.dart';
import '../../../app/app.router.dart';
import '../../../services/connectivity_service.dart';

//final _navigationService = locator<NavigationService>();

class HomePageViewModel extends StreamViewModel {
  final connectivityService = locator<ConnectivityService>();
  final _dmApiService = locator<DMApiService>();
  final _channelsApiService = locator<ChannelsApiService>();

  final _navigationService = locator<NavigationService>();
  bool connectionStatus = false;

  ///This contains the list of data for both the channels and dms
  List<HomeItemModel> homePageList = [];
  List<HomeItemModel> unreads = [];
  List<HomeItemModel> joinedChannels = [];
  List<HomeItemModel> directMessages = [];

  @override
  void onError(error) {
    log('Error: $error');
  }

  @override
  void onSubscribed() {}

  Stream<bool> checkConnectivity() async* {
    yield await connectivityService.checkConnection();
  }

  @override
  Stream get stream => checkConnectivity();

  bool get status {
    stream.listen((event) {
      connectionStatus = event;
      notifyListeners();
    });
    return connectionStatus;
  }

  void navigateToJumpToScreen() {
    _navigationService.navigateTo(Routes.dmJumpToView);
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

  //This method is just to demo the side bar data that would
  //be received by the database
  getHomePageData() {
    homePageList = [
      HomeItemModel(type: HomeItemType.channels, name: 'annoucement'),
      HomeItemModel(
          type: HomeItemType.channels, unreadCount: 1, name: 'random'),
      HomeItemModel(
          type: HomeItemType.channels, unreadCount: 0, name: 'team-app'),
      HomeItemModel(
          type: HomeItemType.channels,
          unreadCount: 5,
          name: 'backend',
          public: false),
      HomeItemModel(
          type: HomeItemType.channels,
          unreadCount: 0,
          name: 'frontend',
          public: false),
      HomeItemModel(
          type: HomeItemType.channels, unreadCount: 4, name: 'work-flow'),
      HomeItemModel(
          type: HomeItemType.channels,
          unreadCount: 1,
          name: 'stage7',
          public: false),
      HomeItemModel(
          type: HomeItemType.channels, unreadCount: 3, name: 'random'),
      HomeItemModel(
          type: HomeItemType.channels, unreadCount: 0, name: 'general'),
      HomeItemModel(type: HomeItemType.dm, unreadCount: 0, name: 'Paul'),
      HomeItemModel(type: HomeItemType.dm, unreadCount: 0, name: 'Timi'),
      HomeItemModel(type: HomeItemType.dm, unreadCount: 0, name: 'Mayowa'),
      HomeItemModel(type: HomeItemType.dm, unreadCount: 1, name: 'Colins'),
      HomeItemModel(type: HomeItemType.dm, unreadCount: 0, name: 'Brain'),
      HomeItemModel(type: HomeItemType.dm, unreadCount: 0, name: 'Folks'),
      HomeItemModel(type: HomeItemType.dm, unreadCount: 0, name: 'DeveloperB'),
      HomeItemModel(type: HomeItemType.dm, unreadCount: 1, name: 'edward'),
    ];

    unreads.clear();
    directMessages.clear();
    joinedChannels.clear();

    setAllList();
    notifyListeners();
  }

  listenToChannelsChange() {
    _channelsApiService.onChange.stream.listen((event) {
      getDmAndChannelsList();
    });
  }

  getDmAndChannelsList() async {
    homePageList = [];
    setBusy(true);

    List? channelsList = await _channelsApiService.getActiveDms();
    channelsList.forEach((data) {
      homePageList.add(HomeItemModel(
        type: HomeItemType.channels,
        unreadCount: 0,
        name: data['name'],
        id: data['id'],
        public: data['private'] != "True",
        membersCount: data['members'],
      ));
    });

    //Todo: add channels implementation

    unreads.clear();
    directMessages.clear();
    joinedChannels.clear();
    setBusy(false);

    setAllList();
    notifyListeners();

    // //get dms data
    // List? dmList = await dmApiService.getActiveDms();
    // dmList.forEach((data) {
    //   dmApiService.getUser(data);
    //   // HomeItemModel(
    //   //   type: HomeItemType.dm,
    //   //   unreadCount: 0,
    //   //   name: 'alfred',
    //   // );
    // });
  }

  //
  //*Navigate to other routes
  void navigateToPref() {
    _navigationService.navigateTo(Routes.fileSearchView);
  }

  void navigateToNewChannel() {
    _navigationService.navigateTo(Routes.newChannel);
  }

  void navigateToChannelPage() {
    _navigationService.navigateTo(Routes.channelPageView);
  }

  void navigateToInfo() {
    _navigationService.navigateTo(Routes.channelInfoView);
  }

  void navigateToWorkspace() {
    _navigationService.navigateTo(Routes.workspaceView);
  }

  void navigateToDmUser() {
    _navigationService.navigateTo(Routes.dmUserView);
  }
}
