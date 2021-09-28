import 'package:hng/app/app.locator.dart';
import 'package:hng/app/app.router.dart';
import 'package:hng/models/channel_members.dart';
import 'package:hng/models/channel_model.dart';
//import 'package:hng/package/base/server-request/api/http_api.dart';
import 'package:hng/package/base/server-request/channels/channels_api_service.dart';
import 'package:hng/services/connectivity_service.dart';
import 'package:hng/services/local_storage_services.dart';
import 'package:hng/utilities/enums.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class ChannelListViewModel extends BaseViewModel {
  final navigation = locator<NavigationService>();
  final snackbar = locator<SnackbarService>();
  final connectivityService = locator<ConnectivityService>();
  final storageService = locator<SharedPreferenceLocalStorage>();
  final api = ChannelsApiService();
  List<ChannelModel> _channelsList = [];
  ChannelModel? _channel;
  List<ChannelModel> get channelsList => _channelsList;
  ChannelModel get channel => _channel!;
  List<ChannelMembermodel> _membersList = [];
  List get membersList => _membersList;

  void initViewModel() {
    fetchChannels();
  }

  Future fetchChannels() async {
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
      _channelsList = await api.fetchChannel();
      print("chan $_channelsList");
      setBusy(false);
    } catch (e) {
      print(e.toString());
      snackbar.showCustomSnackBar(
        duration: const Duration(seconds: 3),
        variant: SnackbarType.failure,
        message: 'Error Occured',
      );
    }
  }

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
        message: 'Error Occured',
      );
    }
  }
}
