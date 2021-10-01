import 'package:stacked/stacked.dart';

class DraftViewModel extends BaseViewModel {
  final _title = 'Draft';
  String get title => _title;

  final _drafts = [
    {
      "title": "oyinkaUA",
      "subtitle": "why",
      "trailing": 'August 31 at 9:09 PM'
    },
    {
      "title": "'Abd_salam'",
      "subtitle":  'No wahala',
      "trailing": 'August 31 at 9:09 PM'
    },
    {
      "title": '#random chat',
      "subtitle": 'My oga',
      "trailing": 'August 31 at 9:09 PM'
    },
  ];
  List get draft => _drafts;
}
