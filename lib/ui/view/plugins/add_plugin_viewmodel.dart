import 'package:hive/hive.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:zurichat/app/app.locator.dart';
import 'package:zurichat/models/plugin_model.dart';
import 'package:zurichat/services/app_services/local_storage_services.dart';

import 'package:zurichat/app/app.logger.dart';
import 'package:zurichat/utilities/enums.dart';

class AddPluginViewModel extends BaseViewModel {
  final _navigationService = locator<NavigationService>();
  final storageService = locator<SharedPreferenceLocalStorage>();
  final snackbar = locator<SnackbarService>();

  final log = getLogger("AddPluginViewModel");

  goBack() {
    setState();
    return _navigationService.back();
  }

  List<Map> addedPlugins = [];

  bool _editMode = false;
  final bool _checked = false;
  late bool hiveCheck = false;

  void addPlugin(PluginModel pluginModel) async {
    var plugin = await Hive.openBox<PluginModel>("plugin");
    plugin.add(pluginModel);
    log.i(plugin.length);
    notifyListeners();
  }

  // void initPlugin() {
  //   var plugin = Hive.box("plugin");
  //   hiveCheck = plugin.get('isCheck');
  //   log.i(hiveCheck);
  // }

  void removePlugin(int index) async {
    var plugin = await Hive.openBox<PluginModel>("plugin");
    plugin.deleteAt(index);
    log.i(plugin.length);
    notifyListeners();
  }

  setState() {
    notifyListeners();
  }

  List<PluginModel> plugins = [
    PluginModel(
        icon: 'assets/icons/svg_icons/todo-pencil.svg',
        name: "Todo Plugin",
        url: "https://www.zuri.chat/todo",
        isCheck: false),
    PluginModel(
        icon: 'assets/icons/svg_icons/sales.svg',
        name: "Sales Plugin",
        url: "https://sales.zuri.chat/",
        isCheck: false),
    PluginModel(
        icon: 'assets/icons/svg_icons/notice-board.svg',
        name: "Notice Board Plugin",
        url: "https://zuri.chat/noticeboard",
        isCheck: false),
    PluginModel(
        icon: 'assets/icons/svg_icons/zap.svg',
        name: "Goals Plugin",
        url: "https://zuri.chat/goals",
        isCheck: false),
    PluginModel(
        icon: 'assets/icons/svg_icons/music.svg',
        name: "Music Plugin",
        url: "https://zuri.chat/music",
        isCheck: false),
    PluginModel(
        icon: 'assets/icons/svg_icons/chess.svg',
        name: "Chess Plugin",
        url: "https://chess.zuri.chat/",
        isCheck: false),
  ];

  bool get editMode => _editMode;

  bool get checked => _checked;

  bool get hasplugins => plugins.isNotEmpty ? true : false;
  List _pluginsList = <PluginModel>[];
  List get pluginsList => _pluginsList;

  void setMode(bool editMode) {
    _editMode = editMode;
    notifyListeners();
  }

  getPlugins() async {
    var plugin = await Hive.openBox<PluginModel>("plugin");
    _pluginsList = plugin.values.toList();
    notifyListeners();
    log.i("Getting plugins -------- ${_pluginsList.length}");
    notifyListeners();
  }

  void setChecked(bool checked, int index, bool viewValue) async {
    // if (plugins[index].isCheck) {
    //   hiveCheck = true;
    //   notifyListeners();
    // }
    viewValue = checked;
    plugins[index].isCheck = checked;

    if (plugins[index].isCheck) {
      addPlugin(plugins[index]);
      snackbar.showCustomSnackBar(
          variant: SnackbarType.success,
          message: '${plugins[index].name} is added successfully');
    } else {
      removePlugin(index);
      snackbar.showCustomSnackBar(
          variant: SnackbarType.success,
          message: '${plugins[index].name} is removed successfully');
    }
    log.wtf("${plugins[index].name} is ${plugins[index].isCheck}");
    log.v("The added plugins are $addedPlugins");
    notifyListeners();
  }
}
