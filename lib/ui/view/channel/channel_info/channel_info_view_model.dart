import 'package:hng/ui/shared/dialogs/delete_channel_dialog.dart';
import 'package:hng/utilities/enums.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import '../../../../app/app.locator.dart';
import '../../../../app/app.router.dart';

class ChannelInfoViewModel extends BaseViewModel {
  final _navigationService = locator<NavigationService>();

  final _dialogService = locator<DialogService>();



  Future showDialog() async{
    print("Testing call");

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

  void navigateToMembersList() {}
  // _navigationService.navigateTo(Routes.editChannelPage);
}

