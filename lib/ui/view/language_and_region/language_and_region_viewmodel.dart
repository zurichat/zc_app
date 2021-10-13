// ignore_for_file: avoid_print

import 'package:zurichat/constants/app_strings.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import '../../../app/app.locator.dart';
import '../../../app/app.logger.dart';
import '../../../utilities/enums.dart';

class LanguageAndRegionModelViewModel extends BaseViewModel {
  final log = getLogger('LanguageAndRegionModelViewModel');
  final _dialogService = locator<DialogService>();
  final _navigationService = locator<NavigationService>();
  String? currentLanguage = 'Espanol (Espana)';
  String? currentTimeZone = '(UTC+01:00) West Central Africa';
  bool automaticTimeZone = true;
  int currentValue = 1;

  goBack() => _navigationService.back();

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
  }

  void toggleAutomaticTimeZone(bool value) {
    automaticTimeZone = value;
    notifyListeners();
  }
}
