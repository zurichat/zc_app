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

class DmJumpToViewModel extends FormViewModel {
  @override
  // Future futureToRun() => fetchUsers();

  @override
  void setFormStatus() {}

  final log = getLogger('DmJumpToViewModel');
  TextEditingController _controller = TextEditingController();
  static final storageService = locator<SharedPreferenceLocalStorage>();
  TextEditingController get controller => _controller;

  final navigation = locator<NavigationService>();
  final connectivityService = locator<ConnectivityService>();
  final api = locator<JumpToApi>();
  List<UserSearch> userSearch = [];
  List<ChannelsSearch> joinedChannelsSearch = [];
  List<ChannelsSearch> allChannelsSearch = [];

  Future fetchUsers() async {
    try {
      if (!await connectivityService.checkConnection()) {
        AppToast.instance.message(null, 'Check your internet connection');
        return;
      }
      setBusy(true);
      userSearch = await api.fetchListOfMembers();
      // joinedChannelsSearch = await api.joinedChannelsList();
      // allChannelsSearch = await api.allChannelsList();
      setBusy(false);
      return userSearch;
    } catch (e) {
      log.e("Model Error - ${e.toString()}");
      AppToast.instance.error(null, 'Error Occured');
    }
  }
}
