import 'package:hng/app/app.locator.dart';
import 'package:hng/models/pinned_message_model.dart';
import 'package:hng/package/base/server-request/channels/channels_api_service.dart';
import 'package:hng/services/local_storage_services.dart';
import 'package:hng/utilities/storage_keys.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class PinnedMessagesViewModel extends BaseViewModel {
  final _storageService = locator<SharedPreferenceLocalStorage>();
  final _channelsApiService = locator<ChannelsApiService>();
  final _navigationService = locator<NavigationService>();

  String? get channelId =>
      _storageService.getString(StorageKeys.currentChannelId);

  late List<PinnedMessage> pinnedMessages = [];

  void navigateBack() => _navigationService.back();

  void fetchPinnedMessages() async {
    setBusy(true);

    pinnedMessages = [
      ...(await _channelsApiService.getChannelPinnedMessages(channelId!))
          .reversed
    ];

    setBusy(false);
  }
}
