import 'package:zurichat/app/app.locator.dart';
import 'package:zurichat/services/app_services/local_storage_services.dart';
import 'package:zurichat/ui/shared/shared.dart';
import 'package:zurichat/utilities/constants/storage_keys.dart';
import 'package:intl/intl.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:stacked/stacked.dart';
import '../../utilities/internationalization/app_localization.dart';
import 'package:zurichat/app/app.logger.dart';
import 'package:observable_ish/observable_ish.dart';

/// List of languages codes that the app will support
/// https://en.wikipedia.org/wiki/List_of_ISO_639-1_codes
///
class LocalizationService with ReactiveServiceMixin {
  // ignore: prefer_final_fields
  RxValue<Locale> _appLocale = RxValue<Locale>(const Locale('en', 'GB'));

  LocalizationService() {
    listenToReactiveValues([_appLocale]);
  }

  Locale? get appLocale => _appLocale.value;

  static const _supportedLocalCodes = ['en', 'de', 'ar', 'zh'];
  get supportedLocalCodes => _supportedLocalCodes;

  List<LocalizationsDelegate> get localizationsDelegates {
    return [
      const AppLocalizationDelegate(),
      const FallbackCupertinoLocalizationsDelegate(),
      GlobalMaterialLocalizations.delegate,
      GlobalWidgetsLocalizations.delegate,
      GlobalCupertinoLocalizations.delegate,
    ];
  }

  final log = getLogger('Localizations Service');
  final _storageService = locator<SharedPreferenceLocalStorage>();
  static const String currentLanguageKey = StorageKeys.currentLanguageIndex;
  List<Locale>? localesList = supportedLocalesList as List<Locale>;

  final supportedLocales = _supportedLocalCodes
      .map<Locale>((code) => Locale.fromSubtags(languageCode: code))
      .toList();

  void storeCurrentLocale(Locale locale) {
    int x = localesList!.indexOf(locale);
    _storageService.setInt(currentLanguageKey, x);

    _appLocale.value = locale;
  }

  /// A callback provided by [MaterialApp] that lets you
  /// specify which locales you plan to support by returning them.
  Locale loadSupportedLocals(
      Locale? locale, Iterable<Locale> supportedLocales) {
    int? curLangIndex =
        _storageService.getInt(StorageKeys.currentLanguageIndex) ?? -1;

    if (curLangIndex > 1) {
      Locale? storedLocale = localesList![curLangIndex];
      storeCurrentLocale(storedLocale);
      return storedLocale;
    }

    if (locale == null) {
      Intl.defaultLocale = supportedLocales.first.languageCode;
      storeCurrentLocale(supportedLocales.first);
      return supportedLocales.first;
    }

    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode &&
          supportedLocale.countryCode == locale.countryCode) {
        Intl.defaultLocale = supportedLocale.languageCode;
        storeCurrentLocale(supportedLocale);
        return supportedLocale;
      }
    }

    Intl.defaultLocale = supportedLocales.first.languageCode;
    storeCurrentLocale(supportedLocales.first);
    return supportedLocales.first;
  }

  /// Internationalized apps that require translations for one of the
  /// locales listed in [GlobalMaterialLocalizations] should specify
  /// this parameter and list the [supportedLocales] that the
  /// application can handle.

}
