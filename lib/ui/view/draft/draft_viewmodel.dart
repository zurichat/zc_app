import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import '../../shared/shared.dart';
import '../../shared/styles.dart';

class DraftViewModel extends BaseViewModel {
  final _title = 'Draft';
  String get title => _title;

  final _drafts = [
    ListTile(
      title: Text(
        'OyinkanUA',
        style: AppTextStyles.heading6,
      ),
      subtitle: Text(
        'Why',
        style: AppTextStyles.body1Bold,
      ),
      trailing: Text(
        'August 31 at 9:09 PM',
        style: AppTextStyles.body2Bold,
      ),
    ),
    ListTile(
      title: Text(
        'Abd_salam',
        style: AppTextStyles.heading6,
      ),
      subtitle: Text(
        'No wahala',
        style: AppTextStyles.body1Bold,
      ),
      trailing: Text(
        'August 31 at 9:09 PM',
        style: AppTextStyles.body2Bold,
      ),
    ),
    ListTile(
      title: Text(
        '#random chat',
        style: AppTextStyles.heading6,
      ),
      subtitle: Text(
        'My oga',
        style: AppTextStyles.body1Bold,
      ),
      trailing: Text(
        'August 31 at 9:09 PM',
        style: AppTextStyles.body2Bold,
      ),
    ),
  ];
  List get draft => _drafts;
}
