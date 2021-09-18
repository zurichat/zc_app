import 'package:hng/app/app.locator.dart';
import 'package:hng/ui/view/channel/channel_members/channel_members_list.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class ChannelInfoViewModel extends BaseViewModel {
  final navigator = locator<NavigationService>();

  void navigatoToMembersList() {
    navigator.navigateToView(ChannelMembersList());
  }
}
