// ignore_for_file: avoid_print

import 'package:hng/constants/app_strings.dart';
import 'package:hng/ui/shared/shared.dart';
import 'package:hng/utilities/internalization/local_setup.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import '../../../app/app.locator.dart';
import '../../../app/app.logger.dart';
import '../../../utilities/enums.dart';

class LanguageAndRegionModelViewModel extends BaseViewModel {
  final log = getLogger('LanguageAndRegionModelViewModel');
  final _dialogService = locator<DialogService>();
  final _navigationService = locator<NavigationService>();
  String? currentLanguage = appLocale.toString();
  String? currentTimeZone = '(UTC+01:00) West Central Africa';
  bool automaticTimeZone = true;
  int currentValue = 0;

  goBack() => _navigationService.back();

  List languages = [
    EnglishUS,
    DeutschDE,
    ArabicSA,
    Mandarin,
  ];

  Future changeLanguage() async {
    final dialogResult = await _dialogService.showCustomDialog(
      variant: DialogType.selectLanguage,
      data: {'languages': languages, 'currentValue': currentValue},
    );

    if (dialogResult != null && dialogResult.confirmed == true) {
      currentValue = dialogResult.data;
      currentLanguage = languages[currentValue];
      appLocale = supportedLocalesList.elementAt(currentValue);
      log.i(dialogResult.data);
      notifyListeners();
    }
  }

  void toggleAutomaticTimeZone(bool value) {
    automaticTimeZone = value;
    notifyListeners();
  }
}
