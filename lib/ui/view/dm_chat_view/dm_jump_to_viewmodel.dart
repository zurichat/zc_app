import 'package:flutter/material.dart';
import 'package:hng/app/app.locator.dart';
import 'package:hng/app/app.logger.dart';
import 'package:hng/general_widgets/app_toast.dart';
import 'package:hng/models/channels_search_model.dart';
import 'package:hng/models/user_search_model.dart';
import 'package:hng/package/base/jump_to_request/jump_to_api.dart';
import 'package:hng/services/connectivity_service.dart';
import 'package:hng/services/local_storage_services.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class DmJumpToViewModel extends StreamViewModel {
  final navigation = locator<NavigationService>();
   final log = getLogger('DmJumpToViewModel');
  TextEditingController _controller = TextEditingController();
  static final storageService = locator<SharedPreferenceLocalStorage>();
  TextEditingController get controller => _controller;

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

  void _onChanged() => (value){

    if(value.isEmpty){
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
}
