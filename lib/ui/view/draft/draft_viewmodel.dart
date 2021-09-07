import 'package:hng/ui/shared/shared.dart';
import 'package:hng/ui/shared/styles.dart';
import 'package:stacked/stacked.dart';
import 'package:flutter/material.dart';

class DraftViewModel extends BaseViewModel {
  String _title = 'Draft';
  String get title => _title;

  List _drafts = [
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
        style: AppTextStyles.body2,
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
        style: AppTextStyles.body2,
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
        style: AppTextStyles.body2,
      ),
    ),
  ];
  List get draft => _drafts;
}
