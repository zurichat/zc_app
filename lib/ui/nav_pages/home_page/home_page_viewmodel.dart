import 'dart:developer';

import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import '../../../app/app.locator.dart';
import '../../../app/app.router.dart';
import '../../../package/base/server-request/channels/channels_api_service.dart';
import '../../../services/connectivity_service.dart';
import '../../../utilities/enums.dart';
import 'home_item_model.dart';

class HomePageViewModel extends StreamViewModel {
  final connectivityService = locator<ConnectivityService>();
  // final _dmApiService = locator<DMApiService>();
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



 

  void navigateToUserSearchView() {
    _navigationService.navigateTo(Routes.userSearchView);
  }

}
