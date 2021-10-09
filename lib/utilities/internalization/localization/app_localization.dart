import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hng/constants/local_keys.dart';
import 'package:hng/utilities/internalization/local_setup.dart';

class AppLocalization {
  ///TODO: Remove late
  late Map<String, String> _sentences;
  final Locale locale;

  AppLocalization(this.locale);

  static AppLocalization? of(BuildContext context) {
    return Localizations.of<AppLocalization>(context, AppLocalization);
  }

  Future<bool> load() async {
    final path = 'assets/language/${locale.languageCode}.json';
    final data = await rootBundle.loadString(path);
    final Map<String, dynamic> _result = json.decode(data);

    _sentences = <String, String>{};
    _result.forEach((String key, dynamic value) {
      _sentences[key] = value.toString();
    });

    return true;
  }

  String translate(String key) {
    return _sentences[key]!;
  }

  /// static member to have simple access to the delegate from Material App
  static const LocalizationsDelegate<AppLocalization> delegate =
      AppLocalizationDelegate();

  /// List of available local strings that the app can use
  /// translated from the corresponding .json language files
  String get threads => translate(LocalKeys.Threads);
  String get unreads => translate(LocalKeys.Unreads);
  String get channels => translate(LocalKeys.Channels);
  String get directMessages => translate(LocalKeys.DirectMessages);
  String get homeNavBar => translate(LocalKeys.HomeNavBar);
  String get pluginsNavBar => translate(LocalKeys.PluginsNavBar);
  String get dmNavBar => translate(LocalKeys.DmNavBar);
  String get youNavBar => translate(LocalKeys.YouNavBar);
}

class AppLocalizationDelegate extends LocalizationsDelegate<AppLocalization> {
  const AppLocalizationDelegate();
  @override
  bool isSupported(Locale locale) {
    return supportedLocalCodes.contains(locale.languageCode);
  }

  @override
  Future<AppLocalization> load(Locale locale) async {
    final localization = AppLocalization(locale);
    await localization.load();
    return localization;
  }

  @override
  bool shouldReload(LocalizationsDelegate<AppLocalization> old) => false;
}

class FallbackCupertinoLocalizationsDelegate
    extends LocalizationsDelegate<CupertinoLocalizations> {
  const FallbackCupertinoLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) {
    return supportedLocalCodes.contains(locale.languageCode);
  }

  @override
  Future<CupertinoLocalizations> load(Locale locale) {
    return DefaultCupertinoLocalizations.load(locale);
  }

  @override
  bool shouldReload(FallbackCupertinoLocalizationsDelegate old) => false;
}
