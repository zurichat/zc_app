// ignore_for_file: avoid_print

import 'package:hng/constants/app_strings.dart';
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

  List languages = [
    Deutsch,
    EnglishUK,
    EnglishUS,
    Espanol,
    Francais,
    Italiano,
    Portugues,
    Chinese,
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

      log.i(dialogResult.data);
      notifyListeners();   
    }
    //  print(currentLanguage);
  }
  

  void toggleAutomaticTimeZone(bool value) {
    automaticTimeZone = value;
    notifyListeners();
  }
}
