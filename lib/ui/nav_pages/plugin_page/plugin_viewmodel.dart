import 'package:hng/app/app.locator.dart';
import 'package:hng/app/app.router.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
 
class PluginViewModel extends BaseViewModel {
  final navigationService = locator<NavigationService>();
  bool _editMode = false;
  bool _checked = false;

  bool get editMode => _editMode;

  bool get checked => _checked;

  void setMode(bool editMode) {
    _editMode = editMode;
    notifyListeners();
  }

  void setChecked(bool checked) {
    _checked = checked;
    notifyListeners();
  }

  navigateToAdd() => navigationService.navigateTo(Routes.addPluginView);

  navigateToEdit() => navigationService.navigateTo(Routes.editPluginView);

  navigateToPlugins() => navigationService.navigateTo(Routes.pluginView);

  navigateToHome() => navigationService.navigateTo(Routes.navBarView);
}
