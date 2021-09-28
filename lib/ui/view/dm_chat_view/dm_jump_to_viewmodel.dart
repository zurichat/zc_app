import 'package:hng/package/base/server-request/api/zuri_api.dart';
import 'package:hng/services/user_service.dart';
import 'package:hng/utilities/storage_keys.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import '../../../app/app.locator.dart';
import '../../../app/app.logger.dart';
import '../../../general_widgets/app_toast.dart';
import '../../../models/channels_search_model.dart';
import '../../../models/user_search_model.dart';
import '../../../package/base/jump_to_request/jump_to_api.dart';
import '../../../services/connectivity_service.dart';
import '../../../services/local_storage_services.dart';

class DmJumpToViewModel extends FormViewModel {
  final navigation = locator<NavigationService>();
  final log = getLogger('DmJumpToViewModel');
  static final storageService = locator<SharedPreferenceLocalStorage>();
  final connectivityService = locator<ConnectivityService>();
  // final api = locator<JumpToApi>();
  final zuriApi = locator<ZuriApi>();
  List<NewUser> userSearch = [];
  List<ChannelsSearch> joinedChannelsSearch = [];
  List<ChannelsSearch> allChannelsSearch = [];
    static final _userService = locator<UserService>();

   String get currentOrgId => _userService.currentOrgId;

  String? get token => storageService.getString(StorageKeys.currentSessionToken);

  // @override
  // // Future futureToRun() => fetchUsers();

  // @override
  // Stream get stream => checkConnectivity();

  @override
  void setFormStatus() {}

  navigateBack() {
    navigation.back();
  }

  void _onChanged() => (value) {
        if (value.isNotEmpty) {
          allChannelsSearch = allChannelsSearch
              .where((channels) => (channels.name.toString().contains(
                    value.toLowerCase(),
                  )))
              .toList();
          notifyListeners();
        } else {
          allChannelsSearch = allChannelsSearch;
          notifyListeners();
        }
        notifyListeners();
      };

  //getters for the view
  get onChanged => _onChanged();

  Stream<bool> checkConnectivity() async* {
    yield await connectivityService.checkConnection();
  }

  Future fetchChannels() async {
    try {
      setBusy(true);
      allChannelsSearch = await zuriApi.allChannelsList(currentOrgId, token);
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
      userSearch = await zuriApi.fetchList(currentOrgId, token);
      setBusy(false);
      notifyListeners();
      return userSearch;
    } catch (e) {
      log.e("Model users Error - ${e.toString()}");
      AppToast.instance.error(null, 'Error Occured');
    }
  }
}