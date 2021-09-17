import 'package:hng/app/app.locator.dart';
import 'package:hng/app/app.router.dart';
import 'package:hng/utilities/enums.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class AddWorkSpaceViewModel extends BaseViewModel {
  final navigation = locator<NavigationService>();

  void navigateToJoinWorkspace() {
    navigation.navigateTo(Routes.createWorkSpace,
        arguments: CreateWorkSpaceArguments(
          method: WorkspaceSwitchMethod.Join,
        ));
  }
}
