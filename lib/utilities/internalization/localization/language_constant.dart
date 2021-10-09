import 'package:flutter/material.dart';
import 'package:hng/utilities/internalization/localization/app_localization.dart';
import 'package:shared_preferences/shared_preferences.dart';

const String LANGUAGE_CODE = 'languageCode';

//languages code
const String ENGLISH = 'en';
const String SPANISH = 'es';
const String FRANCAIS = 'fr';
const String ITALY = 'it';
const String DEUTSCH = 'nl';
const String PORTUGUES = 'pt';
const String CHINESE = 'zh';

Future<Locale> setLocale(String languageCode) async {
  SharedPreferences _prefs = await SharedPreferences.getInstance();
  await _prefs.setString(LANGUAGE_CODE, languageCode);
  return _locale(languageCode);
}

Future<Locale> getLocale() async {
  SharedPreferences _prefs = await SharedPreferences.getInstance();
  String languageCode = _prefs.getString(LANGUAGE_CODE) ?? "en";
  return _locale(languageCode);
}

Locale _locale(String languageCode) {
  switch (languageCode) {
    case ENGLISH:
      return const Locale(ENGLISH, 'en');
    case SPANISH:
      return const Locale(SPANISH, "es");
    case FRANCAIS:
      return const Locale(FRANCAIS, "fr");
    case ITALY:
      return const Locale(ITALY, "it");
    case DEUTSCH:
      return const Locale(DEUTSCH, "nl");
    case PORTUGUES:
      return const Locale(PORTUGUES, "pt");
    case CHINESE:
      return const Locale(CHINESE, "zh");
    default:
      return const Locale(ENGLISH, 'en');
  }
}

String? getTranslated(BuildContext context, String key) {
  return AppLocalization.of(context)?.translate(key);
}
