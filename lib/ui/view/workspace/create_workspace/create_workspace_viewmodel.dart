import 'package:hng/app/app.locator.dart';
import 'package:hng/app/app.router.dart';
import 'package:hng/utilities/enums.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class CreateWorkSpaceViewModel extends BaseViewModel {
  final navigation = locator<NavigationService>();
  String _userEmail = 'Johndoe@gmail.com';
  String _anotherEmail = 'Use another email address';

  String get userEmail => _userEmail;
  String get anotherEmail => _anotherEmail;

  void onEmailTap(WorkspaceSwitchMethod method) {
    switch (method) {
      case WorkspaceSwitchMethod.SignIn:
        navigateToWorkSpaceUrl();
        break;
      case WorkspaceSwitchMethod.Create:
        // TODO: Handle this case.
        break;
      case WorkspaceSwitchMethod.Join:
        navigateToWorkSpaceUrl();
        break;
    }
  }

  void navigateToWorkSpaceUrl() {
    navigation.navigateTo(Routes.workspaceUrlView);
  }
}
