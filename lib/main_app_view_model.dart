import 'package:flutter/widgets.dart';
import 'package:hng/app/app.locator.dart';
import 'package:hng/services/localization_service.dart';
import 'package:stacked/stacked.dart';

class AppModel extends ReactiveViewModel {
  final _localizationService = locator<LocalizationService>();

  get localizationsDelegates => _localizationService.localizationsDelegates;

  get appLocale => _localizationService.appLocale;

  void initialise() {
    throw Exception("Tester");
  }

  Locale? loadSupportedLocals(
          Locale? locale, Iterable<Locale> supportedLocales) =>
      _localizationService.loadSupportedLocals(locale, supportedLocales);

  @override
  // TODO: implement reactiveServices
  List<ReactiveServiceMixin> get reactiveServices => [_localizationService];
}
