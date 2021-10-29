import 'package:hive/hive.dart';
import 'package:zurichat/app/app.locator.dart';
import 'package:zurichat/app/app.router.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:zurichat/models/plugin_model.dart';
import 'package:zurichat/app/app.logger.dart';

class PluginViewModel extends BaseViewModel {
  final navigationService = locator<NavigationService>();
  final snackbarService = locator<SnackbarService>();
  final log = getLogger("PluginViewModel");
  bool _editMode = false;
  bool _checked = false;
  List _pluginsList = <PluginModel>[];
  List get pluginsList => _pluginsList;

  getPlugins() async {
    var plugin = await Hive.openBox<PluginModel>("plugin");
    _pluginsList = plugin.values.toList();
    log.i("Getting plugins -------- ${_pluginsList.length}");
    notifyListeners();
  }

  bool get editMode => _editMode;

  bool get checked => _checked;

  bool get hasplugins => pluginsList.isNotEmpty ? true : false;

  void setMode(bool editMode) {
    _editMode = editMode;
    notifyListeners();
  }

  void navigateToWebviewPage(String name, String url) {
    navigationService.navigateTo(Routes.webViewPage,
        arguments: WebViewPageArguments(name: name, url: url));
  }

  void setChecked(bool checked) {
    _checked = checked;
    notifyListeners();
  }

  navigateToPlugins() => navigationService.navigateTo(Routes.addPluginView);

  navigateToHome() => navigationService.navigateTo(Routes.navBarView);

  navigateBack() => navigationService.back();
}
