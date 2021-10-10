import 'package:hng/app/app.logger.dart';
import 'package:hng/constants/app_strings.dart';
import 'package:hng/models/channel_members.dart';
import 'package:hng/models/channel_model.dart';
import 'package:hng/package/base/server-request/api/zuri_api.dart';
import 'package:hng/package/base/server-request/channels/channels_api_service.dart';
import 'package:hng/services/user_service.dart';
import 'package:hng/ui/view/channel/channel_members/channel_members_list.dart';
import 'package:hng/utilities/constants.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import '../../../../app/app.locator.dart';
import '../../../../app/app.router.dart';
import '../../../../services/local_storage_services.dart';
import '../../../../utilities/enums.dart';

class ChannelInfoViewModel extends BaseViewModel {
  final snackbar = locator<SnackbarService>();
  final _channelApi = locator<ChannelsApiService>();
  final _userService = locator<UserService>();
  final _apiService = ZuriApi(channelsBaseUrl);
  final _navigationService = locator<NavigationService>();
  final storage = locator<SharedPreferenceLocalStorage>();
  final _dialogService = locator<DialogService>();
  final log = getLogger('ChannelInfoViewModel');

  String? _channelName;

  String? _channelDescription;

  String get channelDescription {
    return _channelDescription ?? NoDescription;
  }

  void setChannelDescription(String channelDescription) {
    _channelDescription = channelDescription;
    log.i('pppp $channelDescription');
    notifyListeners();
  }

  String get channelName {
    return _channelName ?? UnnamedChannel;
  }

  void setChannelName(String channelName) {
    _channelName = channelName;
    log.i('pppp $channelDescription');
    notifyListeners();
  }

  void navigateToEditChannel() {
    _navigationService.navigateTo(Routes.editChannelPageView);
  }

  void navigateToPinnedMessages() {
    _navigationService.navigateTo(Routes.pinnedMessagesView);
  }

  navigateBack() {
    _navigationService.back();
  }

  void navigateToMembersList(
      List<ChannelMembermodel> members, ChannelModel channelDetail) {
    //NavigationService.navigateTo(Routes.cha)
    _navigationService.navigateToView(ChannelMembersList(
      channelMembers: members,
      channelDetail: channelDetail,
    ));
  }

  Future showDialog() async {
    await _dialogService.showCustomDialog(
      variant: DialogType
          .deleteChannel, // Which builder you'd like to call that was assigned in the builders function above.
      // title: 'This is a custom UI with Text as main button',
      // description: 'Sheck out the builder in the dialog_ui_register.dart file',
      // mainButtonTitle: 'Ok',
    );
  }

  getChannelInfo() async {
    const channel_id = '613f70bd6173056af01b4aba';
    const endpoint = '$ChannelInfoEndpoint$channel_id/';

    final response = await _apiService.get(endpoint);
    if (response?.statusCode == 200) {
      log.i(response?.data);
      String des = response?.data['description'];
      setChannelDescription(des);
      setChannelName(channelName);

      snackbar.showCustomSnackBar(
        duration: const Duration(seconds: 3),
        variant: SnackbarType.success,
        message: response?.data['message'] ?? UpdateSuccessful,
      );
    } else {
      snackbar.showCustomSnackBar(
        duration: const Duration(seconds: 3),
        variant: SnackbarType.failure,
        message: response?.data['message'] ?? ChannelUpdateError,
      );
    }
  }

  navigateToAddMembers() {
    _navigationService.navigateTo(Routes.addPeopleView);
  }

  Future<void> deleteChannel(ChannelModel channel) async {
    try {
      bool res = await _channelApi.deleteChannel(
          _userService.currentOrgId, channel.id);
      if (res) {
        snackbar.showCustomSnackBar(
          duration: const Duration(seconds: 3),
          variant: SnackbarType.success,
          message: 'Channels ${channel.name} deleted successful',
        );

        _navigationService.popRepeated(2);
      } else {
        snackbar.showCustomSnackBar(
          duration: const Duration(seconds: 3),
          variant: SnackbarType.failure,
          message: DeleteOrgError,
        );
      }
    } catch (e) {
      snackbar.showCustomSnackBar(
        duration: const Duration(seconds: 3),
        variant: SnackbarType.failure,
        message: e.toString(),
      );
    }
  }
}
