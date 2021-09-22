import 'package:hng/app/app.locator.dart';
import 'package:hng/app/app.router.dart';
import 'package:hng/models/channel_members.dart';
import 'package:hng/models/channel_model.dart';
import 'package:hng/package/base/server-request/channels/channels_api_service.dart';
import 'package:hng/services/connectivity_service.dart';
import 'package:hng/services/local_storage_services.dart';
import 'package:hng/ui/view/channel/channel_list/channels_viewmodel.dart';
import 'package:hng/ui/view/channel/channel_members/channel_members_list.dart';
import 'package:hng/ui/view/channel/channel_members/channel_members_list_model.dart';
import 'package:hng/ui/shared/dialogs/delete_channel_dialog.dart';
import 'package:hng/utilities/enums.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import '../../../../app/app.locator.dart';
import '../../../../app/app.router.dart';

class ChannelInfoViewModel extends BaseViewModel {
  final _navigationService = locator<NavigationService>();



  navigateToMembersList(List<ChannelMembermodel> members, 
  
  ChannelModel channelDetail
  ) {
    //NavigationService.navigateTo(Routes.cha)
    _navigationService.navigateToView(ChannelMembersList(channelMembers: members,channelDetail:channelDetail,));
  }
  final _dialogService = locator<DialogService>();



  Future showDialog() async{

    await _dialogService.showCustomDialog(
      variant: DialogType.deleteChannel, // Which builder you'd like to call that was assigned in the builders function above.
      // title: 'This is a custom UI with Text as main button',
      // description: 'Sheck out the builder in the dialog_ui_register.dart file',
      // mainButtonTitle: 'Ok',
    );
  }

  void navigateToEditChannel() {
    _navigationService.navigateTo(Routes.editChannelPageView);
  }

}

