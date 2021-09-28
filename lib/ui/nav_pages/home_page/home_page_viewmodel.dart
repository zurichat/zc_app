import 'dart:developer';

import 'package:hng/app/app.locator.dart';
import 'package:hng/app/app.router.dart';
import 'package:hng/models/channel_members.dart';
import 'package:hng/models/channel_model.dart';
import 'package:hng/package/base/server-request/channels/channels_api_service.dart';
import 'package:hng/package/base/server-request/dms/dms_api_service.dart';
import 'package:hng/services/connectivity_service.dart';
import 'package:hng/services/user_service.dart';
import 'package:hng/ui/nav_pages/home_page/home_item_model.dart';
import 'package:hng/ui/nav_pages/home_page/widgets/home_list_items.dart';
import 'package:hng/utilities/enums.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

bool connectionStatus = false;

class HomePageViewModel extends StreamViewModel {
  final _navigationService = locator<NavigationService>();
  final userService = locator<UserService>();
  final connectivityService = locator<ConnectivityService>();
  final dmApiService = locator<DMApiService>();
  final channelsApiService = locator<ChannelsApiService>();

  final navigation = locator<NavigationService>();
  final snackbar = locator<SnackbarService>();
  final api = ChannelsApiService();
  // final _dmApiService = locator<DMApiService>();
  final _channelsApiService = locator<ChannelsApiService>();
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
    _channelsApiService.controller.stream.listen((event) {
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
    setBusy(false);
  }

  // listenToChannelsChange() {
  // _channelsApiService.onChange.stream.listen((event) {
  //   getDmAndChannelsList();
  // });

  // void navigateToChannelPage() {
  //   _navigationService.navigateTo(Routes.channelPageView);
  // }

  // void navigateToInfo() {
  //   _navigationService.navigateTo(Routes.channelInfoView);
  // }

  // void navigateToWorkspace() {
  //   _navigationService.navigateTo(Routes.workspaceView);
  // }

  //   void navigateToChannelScreen() {
  //   NavigationService().navigateTo(Routes.channelPageView,arguments:
  //   ChannelPageViewArguments(channelDetail: homePageList,

  //   ));
  // }

  navigateToChannelPage(String? channelname, String? channelId,
      int? membersCount, bool? public) async {
    try {
      if (!await connectivityService.checkConnection()) {
        snackbar.showCustomSnackBar(
          duration: const Duration(seconds: 3),
          variant: SnackbarType.failure,
          message: 'Check your internet connection',
        );

        return;
      }
      setBusy(true);
      // _channel= await api.getChannelPage(id);
      // _membersList= await api.getChannelMembers(id);
      setBusy(false);
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
        message: 'Error Occurred',
      );
    }
  }

  void navigateToAllChannelsScreen() {
    NavigationService().navigateTo(Routes.channelList);
  }

  onJumpToScreen() {
    navigationService.navigateTo(Routes.dmJumpToView);
  }

  // void navigateToDmUser() {
  //   _navigationService.navigateTo(Routes.dmUserView);
  // }
}
