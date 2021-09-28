import 'package:hng/models/channel_members.dart';
import 'package:hng/models/channel_model.dart';
import 'package:hng/ui/view/channel/channel_members/channel_members_list.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import '../../../../app/app.locator.dart';
import '../../../../app/app.router.dart';
import '../../../../package/base/server-request/api/http_api.dart';
import '../../../../services/local_storage_services.dart';
import '../../../../utilities/constants.dart';
import '../../../../utilities/enums.dart';

class ChannelInfoViewModel extends BaseViewModel {
  final snackbar = locator<SnackbarService>();
  final _apiService = HttpApiService(channelsBaseUrl);
  final _navigationService = locator<NavigationService>();
  final storage = locator<SharedPreferenceLocalStorage>();
  final _dialogService = locator<DialogService>();

  String? _channelDescription;

  String get channelDescription {
    return _channelDescription ?? 'No description Added';
  }

  void setChannelDescription(String channelDescription) {
    _channelDescription = channelDescription;
    print('pppp $channelDescription');
    notifyListeners();
  }

  void navigateToEditChannel() {
    _navigationService.navigateTo(Routes.editChannelPageView);
  }

  //void navigateToAddPeopleChannel() {
    //_navigationService.navigateTo(Routes.addPeopleView);
  //}

  navigateToMembersList(
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
    const endpoint = 'v1/1/channels/$channel_id/';

    final response = await _apiService.get(endpoint);
    if (response?.statusCode == 200) {
      print(response?.data);
      String des = response?.data['description'];
      print('sacas $des');
      setChannelDescription(des);

      snackbar.showCustomSnackBar(
        duration: const Duration(seconds: 3),
        variant: SnackbarType.success,
        message: response?.data['message'] ?? 'Update succesful',
      );
    } else {
      snackbar.showCustomSnackBar(
        duration: const Duration(seconds: 3),
        variant: SnackbarType.failure,
        message: response?.data['message'] ??
            'Error encountered during channel update.',
      );
    }
  }
}

