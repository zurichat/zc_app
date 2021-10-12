import 'package:hng/app/app.locator.dart';
import 'package:hng/app/app.router.dart';
import 'package:hng/models/app_model.dart';
import 'package:hng/package/base/server-request/channels/channels_api_service.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class ThreadOptionsBottomSheetViewModel extends BaseViewModel {
  final _navigationService = locator<NavigationService>();

  final _channelsApiService = locator<ChannelsApiService>();
  String channelID = '';

  List<UserPost>? channelUserMessages = [];

  bool isLoading = true;

  void exitPage() {
    _navigationService.back();
  }

  void navigateToShareMessage(dynamic userPost) {
    _navigationService.navigateTo(Routes.shareMessage,
        arguments: ShareMessageArguments(userPost: userPost));
  }

  void initialise(String channelId) async {
    channelID = channelId;
  }
}
