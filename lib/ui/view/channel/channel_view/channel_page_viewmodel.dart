import 'package:hng/app/app.locator.dart';
import 'package:hng/app/app.router.dart';
import 'package:hng/models/channel_members.dart';
import 'package:hng/models/channel_model.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import '../../../../app/app.locator.dart';
import '../../../../app/app.router.dart';
import 'channel_page_view.form.dart';


class ChannelPageViewModel extends FormViewModel {
  String? get message => editorValue!.trim();

  final _navigationService = locator<NavigationService>();

  void navigateToChannelInfoScreen(int numberOfMembers, List<ChannelMembermodel> channelMembers,
   
   ChannelModel channelDetail) {
    
    _navigationService.navigateTo(Routes.channelInfoView,arguments: ChannelInfoViewArguments(
      numberOfMembers: numberOfMembers, channelMembers: channelMembers,channelDetail: channelDetail));
  }

  Future navigateToAddPeople() async {
    await _navigationService.navigateTo(Routes.addPeopleView);
  }

  void goBack() {
    NavigationService().back();
  
}
  navigateToChannelEdit() {
    _navigationService.navigateTo(Routes.editChannelPageView);
  }

  @override
  void setFormStatus() {}
}


