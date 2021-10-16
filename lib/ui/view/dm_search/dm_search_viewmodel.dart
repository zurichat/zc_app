import 'package:zurichat/app/app.locator.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class DmSearchViewModel extends IndexTrackingViewModel {
  static final DmSearchViewModel instance = DmSearchViewModel._internal();
  final _navigationService = locator<NavigationService>();

  factory DmSearchViewModel() {
    return instance;
  }

  navigateBack() {
    _navigationService.back();
  }

  DmSearchViewModel._internal();

  init() {}
}
