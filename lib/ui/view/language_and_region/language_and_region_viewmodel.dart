// ignore_for_file: avoid_print

import 'package:flutter/widgets.dart';
import 'package:zurichat/utilities/constants/app_strings.dart';
import 'package:zurichat/main.dart';
import 'package:zurichat/services/app_services/localization_service.dart';
import 'package:zurichat/ui/shared/shared.dart';
import 'package:zurichat/utilities/extensions/locale_extension.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import '../../../app/app.locator.dart';
import '../../../app/app.logger.dart';
import '../../../utilities/enums.dart';

class LanguageAndRegionModelViewModel extends BaseViewModel {
  final log = getLogger('LanguageAndRegionModelViewModel');
  final _dialogService = locator<DialogService>();
  final _localizationService = locator<LocalizationService>();
  final _navigationService = locator<NavigationService>();
  String? currentLanguage = '';
  String? currentTimeZone = '(UTC+01:00) West Central Africa';
  bool automaticTimeZone = true;
  int currentValue = 0;

  goBack() => _navigationService.back();

  void initialise() {
    currentLanguage = _localizationService.appLocale?.getLanguageName();
  }

  List languages = [
    EnglishUS,
    DeutschDE,
    ArabicSA,
    Mandarin,
    Spanish,
    Japanese,
    Hebrew,
    Italian,
    PortugueseBrazil
  ];

  Future changeLanguage(BuildContext context) async {
    List locales = supportedLocalesList as List;
    currentValue = locales.indexOf(_localizationService.appLocale);
    final dialogResult = await _dialogService.showCustomDialog(
      variant: DialogType.selectLanguage,
      data: {'languages': languages, 'currentValue': currentValue},
    );

    if (dialogResult != null && dialogResult.confirmed == true) {
      currentValue = dialogResult.data;
      currentLanguage = languages[currentValue];
      Locale? selectedLocale = supportedLocalesList.elementAt(currentValue);
      _localizationService.storeCurrentLocale(selectedLocale);
      MyApp.setLocale(context, selectedLocale);

      log.i(dialogResult.data);
      notifyListeners();
    }
  }

  void toggleAutomaticTimeZone(bool value) {
    automaticTimeZone = value;
    notifyListeners();
  }
}
