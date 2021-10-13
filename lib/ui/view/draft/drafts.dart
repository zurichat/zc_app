import 'package:flutter/material.dart';
import 'package:hng/constants/app_strings.dart';

import 'package:hng/ui/shared/text_styles.dart';

final drafts = [
  ListTile(
    title: Text(
      OyinkanUA,
      style: AppTextStyle.bigBlackText,
    ),
    subtitle: Text(
      Why,
      style: AppTextStyle.darkGreySize16Bold,
    ),
    trailing: Text(
      SampleDate,
      style: AppTextStyle.lightGreySize14,
    ),
  ),
  ListTile(
    title: Text(
      AbdSalam,
      style: AppTextStyle.bigBlackText,
    ),
    subtitle: Text(
      NoWahala,
      style: AppTextStyle.darkGreySize16Bold,
    ),
    trailing: Text(
      SampleDate,
      style: AppTextStyle.lightGreySize14,
    ),
  ),
  ListTile(
    title: Text(
      TeamSocrates,
      style: AppTextStyle.bigBlackText,
    ),
    subtitle: Text(
      Yeah,
      style: AppTextStyle.darkGreySize16Bold,
    ),
    trailing: Text(
      SampleDate,
      style: AppTextStyle.lightGreySize14,
    ),
  ),
];
