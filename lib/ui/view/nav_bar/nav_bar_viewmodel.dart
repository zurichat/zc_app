import 'package:stacked/stacked.dart';

class NavBarViewModel extends IndexTrackingViewModel {
  static final NavBarViewModel instance = NavBarViewModel._internal();

  factory NavBarViewModel() {
    return instance;
  }

  NavBarViewModel._internal();

  init() {}
}
