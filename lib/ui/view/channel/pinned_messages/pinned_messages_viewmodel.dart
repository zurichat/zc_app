import 'package:zurichat/app/app.locator.dart';
import 'package:zurichat/models/pinned_message_model.dart';
import 'package:zurichat/package/base/server-request/channels/channels_api_service.dart';
import 'package:zurichat/services/local_storage_services.dart';
import 'package:zurichat/utilities/storage_keys.dart';
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
