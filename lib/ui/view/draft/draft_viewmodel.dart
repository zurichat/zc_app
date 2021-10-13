import 'package:zurichat/constants/app_strings.dart';
import 'package:stacked/stacked.dart';

import 'drafts.dart';

class DraftViewModel extends BaseViewModel {
  final _title = Draft;
  String get title => _title;

  List draft = drafts;
}
