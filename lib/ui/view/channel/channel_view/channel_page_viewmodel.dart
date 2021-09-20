import 'package:hng/app/app.locator.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class ChannelPageViewModel extends BaseViewModel {}

final _navigationService = locator<NavigationService>();

void closePage(){
  _navigationService.back();
}

