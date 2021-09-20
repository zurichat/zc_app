import 'package:hng/app/app.router.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class PluginViewModel extends BaseViewModel {
  bool _editMode = false;
  bool _checked = false;

  bool get editMode {
    return _editMode;
  }

  bool get checked {
    return _checked;
  }

  void setMode(bool editMode) {
    _editMode = editMode;
    notifyListeners();
  }

  void setChecked(bool checked) {
    _checked = checked;
    notifyListeners();
  }

  nToAdd() {
    NavigationService().navigateTo(Routes.addPluginView);
  }

  nToEdit() {
    NavigationService().navigateTo(Routes.editPluginView);
  }

  nToPlugins() {
    NavigationService().navigateTo(Routes.pluginView);
  }

  nToHome() {
    NavigationService().navigateTo(Routes.navBarView);
  }
}
