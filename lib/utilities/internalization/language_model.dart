import 'package:hng/constants/app_strings.dart';

class LanguageModel {
  final int id;
  final String name;
  final String languageCode;

  LanguageModel(this.id, this.name, this.languageCode);

  List<LanguageModel> languageList() {
    return <LanguageModel>[
      LanguageModel(1, Deutsch, "nl"),
      LanguageModel(2, EnglishUS, "en"),
      LanguageModel(3, Espanol, "es"),
      LanguageModel(4, Francais, "fr"),
      LanguageModel(5,  Italiano, "it"),
      LanguageModel(6, Portugues, "pt"),
      LanguageModel(7, Chinese, "zh"),
    
    ];
  }
}
