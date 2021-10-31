import 'package:zurichat/app/app.locator.dart';
import 'package:zurichat/app/app.router.dart';
import 'package:zurichat/models/plugin_model.dart';
import 'package:zurichat/ui/nav_pages/plugin_page/widgets/icons.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class PluginViewModel extends BaseViewModel {
  final navigationService = locator<NavigationService>();
  final snackbarService = locator<SnackbarService>();
  //TODO
  // final local = AppLocalization.of(context);
  bool _editMode = false;
  bool _checked = false;

  List<PluginModel> plugins = [
    PluginModel(
        icon: icons[0], name: "Todo Plugin", url: "https://www.zuri.chat/todo"),
    PluginModel(
        icon: icons[1], name: "Sales Plugin", url: "https://sales.zuri.chat/"),
    PluginModel(
        icon: icons[2],
        name: "Notice Board Plugin",
        url: "https://zuri.chat/noticeboard"),
    PluginModel(
        icon: icons[3], name: "Goals Plugin", url: "https://zuri.chat/goals"),
    PluginModel(
        icon: icons[4], name: "Music Plugin", url: "https://zuri.chat/music"),
    PluginModel(
        icon: icons[5], name: "Chess Plugin", url: "https://chess.zuri.chat/"),
  ];

  bool get editMode => _editMode;

  bool get checked => _checked;

  bool get hasplugins => plugins.isNotEmpty ? true : false;

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

  navigateToPlugins() =>
      snackbarService.showSnackbar(message: "No new plugins available");

  navigateToHome() => navigationService.navigateTo(Routes.navBarView);

  navigateBack() => navigationService.back();
}
