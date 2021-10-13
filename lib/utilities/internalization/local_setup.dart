import 'package:hng/app/app.locator.dart';
import 'package:hng/services/local_storage_services.dart';
import 'package:hng/utilities/storage_keys.dart';
import 'package:intl/intl.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'localization/app_localization.dart';
import 'package:hng/app/app.logger.dart';

/// List of languages codes that the app will support
/// https://en.wikipedia.org/wiki/List_of_ISO_639-1_codes
const supportedLocalCodes = ['en', 'de', 'ar', 'zh'];
Locale? appLocale;

final log = getLogger('Localizations Local Setup');
final _storageService = locator<SharedPreferenceLocalStorage>();
const String localKey = StorageKeys.currentUserLocale;
final supportedLocales = supportedLocalCodes
    .map<Locale>((code) => Locale.fromSubtags(languageCode: code))
    .toList();

void _storeCurrentLocale(Locale locale) {
  _storageService.setString(localKey, locale.toString());
}

/// A callback provided by [MaterialApp] that lets you
/// specify which locales you plan to support by returning them.
Locale loadSupportedLocals(Locale? locale, Iterable<Locale> supportedLocales) {
  if (locale == null) {
    Intl.defaultLocale = supportedLocales.first.languageCode;
    _storeCurrentLocale(supportedLocales.first);
    return supportedLocales.first;
  }

  for (var supportedLocale in supportedLocales) {
    if (supportedLocale.languageCode == locale.languageCode &&
        supportedLocale.countryCode == locale.countryCode) {
      Intl.defaultLocale = supportedLocale.languageCode;
      _storeCurrentLocale(supportedLocale);
      return supportedLocale;
    }
  }

  Intl.defaultLocale = supportedLocales.first.languageCode;
  _storeCurrentLocale(supportedLocales.first);
  return supportedLocales.first;
}

/// Internationalized apps that require translations for one of the
/// locales listed in [GlobalMaterialLocalizations] should specify
/// this parameter and list the [supportedLocales] that the
/// application can handle.
List<LocalizationsDelegate> get localizationsDelegates {
  return [
    const AppLocalizationDelegate(),
    const FallbackCupertinoLocalizationsDelegate(),
    GlobalMaterialLocalizations.delegate,
    GlobalWidgetsLocalizations.delegate,
    GlobalCupertinoLocalizations.delegate,
  ];
}
