import 'package:stacked/stacked.dart';

class DmSearchViewModel extends IndexTrackingViewModel {
  static final DmSearchViewModel instance = DmSearchViewModel._internal();

  factory DmSearchViewModel() {
    return instance;
  }

  DmSearchViewModel._internal();

  init() {}
}
