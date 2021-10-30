import 'package:zurichat/app/app.locator.dart';
import 'package:zurichat/app/app.router.dart';
import 'package:zurichat/utilities/constants/app_strings.dart';
import 'package:zurichat/models/channel_members.dart';
import 'package:zurichat/models/channel_model.dart';
import 'package:zurichat/services/messaging_services/channels_api_service.dart';
import 'package:zurichat/services/app_services/connectivity_service.dart';
import 'package:zurichat/services/app_services/local_storage_services.dart';
import 'package:zurichat/utilities/enums.dart';
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
  final List<ChannelMembermodel> _membersList = [];
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
          message: noInternet,
        );

        return;
      }
      setBusy(true);
      _channelsList = await api.fetchChannel();
      setBusy(false);
    } catch (e) {
      snackbar.showCustomSnackBar(
        duration: const Duration(seconds: 3),
        variant: SnackbarType.failure,
        message: errorOccurred,
      );
    }
  }

  void navigateToChannelPage(String? channelName, String? channelId,
      int? membersCount, bool? public) async {
    try {
      if (!await connectivityService.checkConnection()) {
        snackbar.showCustomSnackBar(
          duration: const Duration(seconds: 3),
          variant: SnackbarType.failure,
          message: noInternet,
        );

        return;
      }
      setBusy(true);
      // _channel= await api.getChannelPage(id);
      // _membersList= await api.getChannelMembers(id);
      setBusy(false);
      navigation.navigateTo(Routes.channelPageView,
          arguments: ChannelPageViewArguments(
            channelName: channelName,
            channelId: channelId,
            membersCount: membersCount,
            public: public,
          ));
    } catch (e) {
      snackbar.showCustomSnackBar(
        duration: const Duration(seconds: 3),
        variant: SnackbarType.failure,
        message: errorOccurred,
      );
    }
  }
}
