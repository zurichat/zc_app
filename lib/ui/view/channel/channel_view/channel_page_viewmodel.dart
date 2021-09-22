import 'package:hng/app/app.locator.dart';
import 'package:hng/app/app.router.dart';
import 'package:hng/ui/view/channel/channel_view/channel_page_view.form.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class ChannelPageViewModel extends FormViewModel {
  String? get message => editorValue!.trim();

  final _navigationService = locator<NavigationService>();

  navigateToChannelInfo() {
    _navigationService.navigateTo(Routes.channelInfoView);
  }

  navigateToAddPeople() {
    _navigationService.navigateTo(Routes.addPeopleView);
  }

  @override
  void setFormStatus() {}
}
