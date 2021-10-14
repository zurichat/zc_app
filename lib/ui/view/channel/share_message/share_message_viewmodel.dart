import 'package:hng/app/app.locator.dart';
import 'package:hng/utilities/enums.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'share_message_view.form.dart';

class ShareMessageViewModel extends FormViewModel {
  final _navigationService = locator<NavigationService>();
  final _snackBarService = locator<SnackbarService>();

  void sendMessage(String sharedMessage) async {
    if (messageValue != '') {
      var result = {'message': '$messageValue', 'sharedMessage': sharedMessage};
      _navigationService.back(result: result);
    } else {
      _snackBarService.showCustomSnackBar(
        duration: const Duration(seconds: 3),
        variant: SnackbarType.failure,
        message: 'Enter a message!',
      );
    }
  }

  void close() => _navigationService.back();

  @override
  void setFormStatus() {}
}
