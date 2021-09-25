import '../../../../app/app.locator.dart';
import '../../../../app/app.router.dart';
import 'channel_page_view.form.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class ChannelPageViewModel extends FormViewModel {
  String? get message => editorValue!.trim();

  final _navigationService = locator<NavigationService>();

  Future navigateToChannelInfo() async {
    await _navigationService.navigateTo(Routes.channelInfoView);
  }

  Future navigateToAddPeople() async {
    await _navigationService.navigateTo(Routes.addPeopleView);
  }

  navigateToChannelEdit() {
    _navigationService.navigateTo(Routes.editChannelPageView);
  }

  @override
  void setFormStatus() {}
}
