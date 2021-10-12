import 'package:hng/app/app.locator.dart';
import 'package:hng/app/app.router.dart';
import 'package:hng/models/plugin_model.dart';
import 'package:hng/ui/nav_pages/plugin_page/widgets/icons.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class PluginViewModel extends BaseViewModel {
  final navigationService = locator<NavigationService>();
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

  navigateToAdd() => navigationService.navigateTo(Routes.addPluginView);

  navigateToEdit() => navigationService.navigateTo(Routes.editPluginView);

  navigateToPlugins() => navigationService.navigateTo(Routes.pluginPage);

  navigateToHome() => navigationService.navigateTo(Routes.navBarView);
}
