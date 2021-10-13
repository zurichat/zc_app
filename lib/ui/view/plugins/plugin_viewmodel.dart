import 'package:zurichat/app/app.locator.dart';
import 'package:zurichat/app/app.router.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class PluginViewModel extends BaseViewModel {
  final _navigationService = locator<NavigationService>();
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

  navigateToAdd() => _navigationService.navigateTo(Routes.addPluginView);

  navigateToEdit() => _navigationService.navigateTo(Routes.editPluginView);

  navigateToPlugins() => _navigationService.navigateTo(Routes.pluginView);

  navigateToHome() => _navigationService.navigateTo(Routes.navBarView);
}
