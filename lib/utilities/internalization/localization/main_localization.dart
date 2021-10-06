import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class MainLocalization {
  final Locale locale;

  MainLocalization(this.locale);

  static MainLocalization? of(BuildContext context) {
    return Localizations.of<MainLocalization>(context, MainLocalization);
  }

  ///TODO: Remove late
  late Map<String, String> _localizedValues;

  Future<void> load() async {
    String jsonStringValues = await rootBundle.loadString(
        'lib/utilities/internalization/language/${locale.languageCode}.json');
    Map<String, dynamic> mappedJson = json.decode(jsonStringValues);
    _localizedValues =
        mappedJson.map((key, value) => MapEntry(key, value.toString()));
  }

  String? translate(String key) {
    return _localizedValues[key];
  }

  // static member to have simple access to the delegate from Material App
  static const LocalizationsDelegate<MainLocalization> delegate =
      _MainLocalizationsDelegate();
}

class _MainLocalizationsDelegate
    extends LocalizationsDelegate<MainLocalization> {
  const _MainLocalizationsDelegate();
  @override
  bool isSupported(Locale locale) {
    return ['nl', 'en', 'es', 'fr', 'it', 'pt', 'zh']
        .contains(locale.languageCode);
  }

  @override
  Future<MainLocalization> load(Locale locale) async {
    MainLocalization localization = MainLocalization(locale);
    await localization.load();
    return localization;
  }

  @override
  bool shouldReload(LocalizationsDelegate<MainLocalization> old) => false;
}
