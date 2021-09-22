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

  Future<List<ChannelsSearch>?>? fetchChannels() async {
    try {
      setBusy(true);
      allChannelsSearch = await api.allChannelsList();
      setBusy(false);
      notifyListeners();
      return allChannelsSearch;
    } catch (e) {
      log.e("Model channels error - $e");
    }
  }

  Future<List<NewUser>?>? fetchUsers() async {
    try {
      setBusy(true);
      userSearch = (await api.fetchList());
      setBusy(false);
      notifyListeners();
      return userSearch;
    } catch (e) {
      log.e("Model users Error - ${e.toString()}");
      AppToast.instance.error(null, 'Error Occured');
    }
  }
}
