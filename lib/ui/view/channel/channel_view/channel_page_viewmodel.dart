import 'package:hng/app/app.locator.dart';
import 'package:hng/app/app.router.dart';
import 'package:hng/models/channel_members.dart';
import 'package:hng/models/channel_model.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import '../../../../app/app.locator.dart';
import '../../../../app/app.router.dart';
import 'widgets/message_tile.dart';
// import 'channel_page_view.form.dart';

class ChannelPageViewModel extends FormViewModel {
  // String? get message => editorValue!.trim();

  final _navigationService = locator<NavigationService>();

  late List<Widget> channelPageContents;

  navigateToChannelInfoScreen(int numberOfMembers, List<ChannelMembermodel> channelMembers,
   
   ChannelModel channelDetail) {
    
    NavigationService().navigateTo(Routes.channelInfoView,arguments: ChannelInfoViewArguments(
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

  void addMessageTile(MessageTile tile) {
    channelPageContents.add(tile);
    notifyListeners();
  }

  void initializeWith(List<Widget> topWidgets) {
    channelPageContents = topWidgets;
  }

  void fetchMessages() async {
  }
}
