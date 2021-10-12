import 'package:hng/app/app.locator.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class DirectMessageViewModel extends BaseViewModel {
  final _navigationService = locator<NavigationService>();

  navigateBack() {
    _navigationService.back();
  }















//   String _id = id;
//   String _memId =
//   String orgId = storage.getString(StorageKeys.currentOrgId).toString();
//   String endpoint = 'v1/$orgId/channels/$_channelId/';
//
//   final des = {
//     'description': descriptionValue,
//     "name": "NewTest",
//     "private": false,
//     "archived": false,
//     'topic': topicValue,
//     "starred": false
//   };
//   final response = await _apiService.put(endpoint, body: des, token: token);
//
//   if (response?.statusCode == 200) {
//   snackbar.showCustomSnackBar(
//   duration: const Duration(seconds: 3),
//   variant: SnackbarType.success,
//   message: response?.data['message'] ?? UpdateSuccessful,
//   );
//   // Return to channel info
//   navigateBack();
//   } else {
//   snackbar.showCustomSnackBar(
//   duration: const Duration(seconds: 3),
//   variant: SnackbarType.failure,
//   message: response?.data['message'] ?? ChannelUpdateError,
//   );
//   }
// }
}
