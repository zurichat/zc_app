import 'package:hng/app/app.locator.dart';
import 'package:hng/app/app.router.dart';
import 'package:hng/models/channel_members.dart';
import 'package:hng/models/channel_model.dart';
import 'package:hng/ui/view/channel/channel_view/widgets/message_tile.dart';
// import 'package:hng/ui/view/channel/channel_view/channel_page_view.form.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class ChannelPageViewModel extends FormViewModel {
  // String? get message => editorValue!.trim();

  final _navigationService = locator<NavigationService>();

  late List channelPageContents;

  void navigateToChannelInfoScreen(int numberOfMembers,
      List<ChannelMembermodel> channelMembers, ChannelModel channelDetail) {
    NavigationService().navigateTo(Routes.channelInfoView,
        arguments: ChannelInfoViewArguments(
            numberOfMembers: numberOfMembers,
            channelMembers: channelMembers,
            channelDetail: channelDetail));
  }

  Future navigateToAddPeople() async {
    await _navigationService.navigateTo(Routes.addPeopleView);
  }

  void goBack() {
    NavigationService().back();
  }

  void navigateToChannelEdit() {
    _navigationService.navigateTo(Routes.editChannelPageView);
  }

  @override
  void setFormStatus() {}

  void addMessageTile(MessageTile tile) {
    channelPageContents.add(tile);
    notifyListeners();
  }

  void initializeWith(List topWidgets) {
    channelPageContents = topWidgets;
  }

  void fetchMessages() async {}
}
