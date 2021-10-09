// ignore_for_file: avoid_print

import 'package:hng/constants/app_strings.dart';
import 'package:hng/services/local_storage_services.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import '../../../app/app.locator.dart';
import '../../../app/app.logger.dart';
import '../../../utilities/enums.dart';

class LanguageAndRegionModelViewModel extends BaseViewModel {
  final log = getLogger('LanguageAndRegionModelViewModel');
  final _dialogService = locator<DialogService>();
  String? currentLanguage = 'Espanol (Espana)';
  String? currentTimeZone = '(UTC+01:00) West Central Africa';
  bool automaticTimeZone = true;
  int currentValue = 1;
  int _localeVal = SharedPreferenceLocalStorage.localeVal;

  get currentLocale => SharedPreferenceLocalStorage.localeVal;

  String get localeString {
    String localeString = "en";
    switch (_localeVal) {
      case 0:
        localeString = "en";
        break;
      case 1:
        localeString = "nl";
        break;
      case 2:
        localeString = "es";
        break;
      case 3:
        localeString = "fr";
        break;
      case 4:
        localeString = "it";
        break;
      case 5:
        localeString = "pt";
        break;
      case 6:
        localeString = "zh";
        break;
    }
    print(localeString);

    return localeString;
  }

  set localeVal(int value) {
    _localeVal = SharedPreferenceLocalStorage.localeVal = value;
    // notifyListeners();
  }

  List languages = [
    EnglishUS,
    Deutsch,
    Espanol,
    Francais,
    Italiano,
    Portugues,
    Chinese,
  ];

  Future changeLanguage() async {
    final dialogResult = await _dialogService.showCustomDialog(
      variant: DialogType.selectLanguage,
      data: {'languages': languages, 'currentValue': currentValue},
    );

    if (dialogResult != null && dialogResult.confirmed == true) {
      currentValue = dialogResult.data;
      currentLanguage = languages[currentValue];

      log.i(dialogResult.data);
      notifyListeners();
    }
    // print(currentLanguage);
  }

  setLanguage(Type value) {
    SharedPreferenceLocalStorage.localeVal = languages.indexOf(Value);
    localeVal = SharedPreferenceLocalStorage.localeVal;
    notifyListeners();
  }

  void toggleAutomaticTimeZone(bool value) {
    automaticTimeZone = value;
    notifyListeners();
  }
}
