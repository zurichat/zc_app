import 'package:hng/app/app.locator.dart';
import 'package:hng/app/app.router.dart';
import 'package:hng/models/app_model.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class ThreadOptionsBottomSheetViewModel extends BaseViewModel {
  final _navigationService = locator<NavigationService>();

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
