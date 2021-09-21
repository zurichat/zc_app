import 'package:hng/app/app.locator.dart';
import 'package:hng/app/app.logger.dart';
import 'package:hng/general_widgets/app_toast.dart';
import 'package:hng/models/channels_search_model.dart';
import 'package:hng/models/user_search_model.dart';
import 'package:hng/package/base/jump_to_request/jump_to_api.dart';
import 'package:hng/services/connectivity_service.dart';
import 'package:hng/services/local_storage_services.dart';
import 'package:hng/ui/nav_pages/home_page/home_page_viewmodel.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:hng/general_widgets/custom_user.dart';

class DmJumpToViewModel extends StreamViewModel {
  final navigation = locator<NavigationService>();
  final log = getLogger('DmJumpToViewModel');
  static final storageService = locator<SharedPreferenceLocalStorage>();
  final connectivityService = locator<ConnectivityService>();
  final api = locator<JumpToApi>();
  final homePageViewModel = locator<HomePageViewModel>();
  List<NewUser> userSearch = [];
  List<ChannelsSearch> joinedChannelsSearch = [];
  List<ChannelsSearch> allChannelsSearch = [];

  @override
  // Future futureToRun() => fetchUsers();

  @override
  Stream get stream => checkConnectivity();

  // @override void setFormStatus() {}

  navigateBack() {
    navigation.back();
  }

  void _onChanged() => (value) {
        if (value.isEmpty) {
          //   list.clear();
          //   list.addAll(recentDmsFromApi);
          // }else {
          //   list.clear();
          //   for (index in ListofDms) {
          //     if (index.text.toLowerCase().contains(value.toLowerCase())) {
          //       list.add(index);
          //     }
          //   }
        }
        notifyListeners();
      };

  //getters for the view
  get onChanged => _onChanged();

  Stream<bool> checkConnectivity() async* {
    yield await connectivityService.checkConnection();
  }

  Future<List<NewUser>?>? fetchUsers() async {
    try {
      setBusy(true);
      userSearch = (await api.fetchList());
      // joinedChannelsSearch = await api.joinedChannelsList();
      // allChannelsSearch = await api.allChannelsList();
      setBusy(false);
      notifyListeners();
      return userSearch;
    } catch (e) {
      log.e("Model Error - ${e.toString()}");
      AppToast.instance.error(null, 'Error Occured');
    }
  }

  var index;
  List<CustomUser> ListofDms = [
    CustomUser(
      image: 'assets/images/Rectangle 1931.png',
      text: 'Fierce',
    ),
    CustomUser(
      image: 'assets/images/Rectangle 1931 (1).png',
      text: 'Abd_Salam',
    ),
    CustomUser(
      image: 'assets/images/Rectangle 1931 (2).png',
      text: 'Souljaunt',
    ),
    CustomUser(
      image: 'assets/images/Rectangle 1931 (3).png',
      text: 'Princess',
    ),
    CustomUser(
      image: 'assets/images/Rectangle 1931 (4).png',
      text: 'Nudis',
    ),
    CustomUser(
      image: 'assets/images/Rectangle 1931 (5).png',
      text: 'Unknown',
    ),
    CustomUser(
      image: 'assets/images/Rectangle 1931.png',
      text: 'abcFierce',
    ),
    CustomUser(
      image: 'assets/images/Rectangle 1931 (1).png',
      text: 'deAbd_Salam',
    ),
    CustomUser(
      image: 'assets/images/Rectangle 1931 (2).png',
      text: 'fjSouljaunt',
    ),
    CustomUser(
      image: 'assets/images/Rectangle 1931 (3).png',
      text: 'hiPrincess',
    ),
    CustomUser(
      image: 'assets/images/Rectangle 1931 (4).png',
      text: 'jkNudis',
    ),
    CustomUser(
      image: 'assets/images/Rectangle 1931 (5).png',
      text: 'lmUnknown',
    ),
    CustomUser(
      image: 'assets/images/Rectangle 1931.png',
      text: 'noFierce',
    ),
    CustomUser(
      image: 'assets/images/Rectangle 1931 (1).png',
      text: 'noAbd_Salam',
    ),
    CustomUser(
      image: 'assets/images/Rectangle 1931 (2).png',
      text: 'Souljaunt',
    ),
    CustomUser(
      image: 'assets/images/Rectangle 1931 (3).png',
      text: 'noPrincess',
    ),
    CustomUser(
      image: 'assets/images/Rectangle 1931 (4).png',
      text: 'Nudis',
    ),
    CustomUser(
      image: 'assets/images/Rectangle 1931 (5).png',
      text: 'yesUnknown',
    ),
    CustomUser(
      image: 'assets/images/Rectangle 1931.png',
      text: 'itFierce',
    ),
    CustomUser(
      image: 'assets/images/Rectangle 1931 (1).png',
      text: 'yesAbd_Salam',
    ),
    CustomUser(
      image: 'assets/images/Rectangle 1931 (2).png',
      text: 'itSouljaunt',
    ),
    CustomUser(
      image: 'assets/images/Rectangle 1931 (3).png',
      text: 'carsPrincess',
    ),
    CustomUser(
      image: 'assets/images/Rectangle 1931 (4).png',
      text: 'carsNudis',
    ),
    CustomUser(
      image: 'assets/images/Rectangle 1931 (5).png',
      text: 'traUnknown',
    ),
    CustomUser(
      image: 'assets/images/Rectangle 1931.png',
      text: 'traFierce',
    ),
    CustomUser(
      image: 'assets/images/Rectangle 1931 (1).png',
      text: 'Abd_Salam',
    ),
    CustomUser(
      image: 'assets/images/Rectangle 1931 (2).png',
      text: 'traSouljaunt',
    ),
    CustomUser(
      image: 'assets/images/Rectangle 1931 (3).png',
      text: 'sowPrincesssssssssssssssssss',
    ),
    CustomUser(
      image: 'assets/images/Rectangle 1931 (4).png',
      text: 'cutNudis',
    ),
    CustomUser(
      image: 'assets/images/Rectangle 1931 (5).png',
      text: 'youUnknown',
    ),
  ];

  var recentDmsFromApi=[
    CustomUser(
      image: 'assets/images/Rectangle 1931 (4).png',
      text: 'cutNudis',
    ),
    CustomUser(
      image: 'assets/images/Rectangle 1931 (5).png',
      text: 'youUnknown',
    ),
  ];

  var list=[
    CustomUser(
      image: 'assets/images/Rectangle 1931 (4).png',
      text: 'cutNudis',
    ),
    CustomUser(
      image: 'assets/images/Rectangle 1931 (5).png',
      text: 'youUnknown',
    ),
  ];

  navigateBack() {
    navigation.back();
  }

  void _onChanged() => (value){

    if(value.isEmpty){
      list.clear();
      list.addAll(recentDmsFromApi);
    }else {
      list.clear();
      for (index in ListofDms) {
        if (index.text.toLowerCase().contains(value.toLowerCase())) {
          list.add(index);
        }
      }

    }
    notifyListeners();
  };

  //getters for the view
  get onChanged => _onChanged();
}


