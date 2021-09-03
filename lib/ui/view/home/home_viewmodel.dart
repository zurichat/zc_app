import 'package:stacked/stacked.dart';

class HomeViewModel extends IndexTrackingViewModel {
  static final HomeViewModel instance = HomeViewModel._internal();

  factory HomeViewModel() {
    return instance;
  }

  HomeViewModel._internal();

  init() {}
}
