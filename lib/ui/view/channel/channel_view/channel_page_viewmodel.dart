import 'package:hng/app/app.locator.dart';
import 'package:hng/app/app.router.dart';
import 'package:hng/models/channel_members.dart';
import 'package:hng/models/channel_model.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class ChannelPageViewModel extends BaseViewModel {

    final navigator = locator<NavigationService>();

   navigateToChannelInfoScreen(int numberOfMembers, List<ChannelMembermodel> channelMembers,ChannelModel channelDetail) {
    
    NavigationService().navigateTo(Routes.channelInfoView,arguments: ChannelInfoViewArguments(
      numberOfMembers: numberOfMembers, channelMembers: channelMembers,channelDetail: channelDetail));
   
  }


  void goBack() {
    NavigationService().back();
  }
}
