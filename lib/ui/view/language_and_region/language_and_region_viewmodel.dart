import 'package:hng/app/app.locator.dart';
import 'package:hng/app/app.logger.dart';
import 'package:hng/utilities/enums.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class LanguageAndRegionModelViewModel extends BaseViewModel {
  final log = getLogger('LanguageAndRegionModelViewModel');
  final _dialogService = locator<DialogService>();
  String? currentLanguage = "English (UK)";
  String? currentTimeZone = "(UTC+01:00) West Central Africa";
  bool automaticTimeZone = true;
  int currentValue = 1;

  List languages = [
    "Deutsch (Deutschland)",
    "English (UK)",
    "English (US)",
    "Espanol (Espana)",
    "Francais (France)",
    "Italiano (Italy)",
    "Portugues (Brazil)",
    "陈摩托何",
    "来 本 嗄",
  ];

  Future changeLanguage() async {
    final dialogResult = await _dialogService.showCustomDialog(
      variant: DialogType.selectLanguage,
      data: {"languages": languages, "currentValue": currentValue},
    );

    if (dialogResult != null && dialogResult.confirmed == true) {
      currentValue = dialogResult.data;
      currentLanguage = languages[currentValue];

      log.i(dialogResult.data);
      notifyListeners();
    }
  }

  void toggleAutomaticTimeZone(bool value) {
    automaticTimeZone = value;
    notifyListeners();
  }
}
