import 'package:stacked/stacked.dart';

class ChannelPageViewModel extends IndexTrackingViewModel {
  static final ChannelPageViewModel instance = ChannelPageViewModel._internal();

  factory ChannelPageViewModel() {
    return instance;
  }

  ChannelPageViewModel._internal();

  init() {}
}
