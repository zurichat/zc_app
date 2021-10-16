import 'package:zurichat/app/app.locator.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class DraftedMessagePageModel extends BaseViewModel {
  //String _title = 'Home View';
  //String get title => _title;
  final _navigationService = locator<NavigationService>();

  navigateBack() {
    _navigationService.back();
  }
}
