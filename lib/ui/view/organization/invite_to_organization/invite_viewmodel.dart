import 'package:hng/app/app.locator.dart';
import 'package:hng/app/app.router.dart';
import 'package:hng/constants/app_strings.dart';
import 'package:hng/utilities/enums.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class InviteViewModel extends BaseViewModel {
  final navigationService = locator<NavigationService>();
  final snackbar = locator<SnackbarService>();

  void navigateBack() {
    navigationService.back();
  }

  void navigateToContacts(){
    navigationService.navigateTo(Routes.importContacts);
  }

  void navigateToInvitationSent(){
    navigationService.navigateTo(Routes.invitationSent);
  }
}
