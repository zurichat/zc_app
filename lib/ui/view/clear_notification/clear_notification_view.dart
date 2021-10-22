import 'package:flutter/material.dart';
import 'package:zurichat/constants/app_strings.dart';

import 'package:zurichat/ui/shared/text_styles.dart';
import 'package:zurichat/ui/shared/zuri_appbar.dart';
import 'package:zurichat/utilities/internalization/localization/app_localization.dart';
import 'package:stacked/stacked.dart';

import 'clear_notification_viewmodel.dart';

class ClearNotificationView extends StatelessWidget {
  ClearNotificationView({Key? key}) : super(key: key);
  static const values = <String>[
    DontClear,
    ThirtyMins,
    OneHour,
    FourHours,
    Today,
    ThisWeek,
    ChooseDate,
    ClearAfter,
  ];
  String selectedValue = ClearNotificationView.values.toString();

  final selectedColor = Colors.blue;

  final unselectedColor = Colors.black;

  @override
  Widget build(BuildContext context) {
    final local = AppLocalization.of(context);
    return ViewModelBuilder<ClearNotificationViewModel>.reactive(
        builder: (context, model, child) {
          return Scaffold(
            appBar: ZuriAppBar(
              leading: Icons.arrow_back_ios,
              leadingPress: () => model.navigateBack(),
              orgTitle: Text(
                local!.clearAfter,
                style: AppTextStyle.darkGreySize20Bold,
              ),
            ),
            body: Padding(
              padding: const EdgeInsets.all(20.0),
              child:
                  Column(mainAxisAlignment: MainAxisAlignment.start, children: [
                buildRadios(),
              ]),
            ),
          );
        },
        viewModelBuilder: () => ClearNotificationViewModel());
  }

  Widget buildRadios() => Column(
        children: ClearNotificationView.values.map(
          (value) {
            return RadioListTile<String>(
              value: value,
              groupValue: selectedValue,
              title: Text(
                value,
                style: const TextStyle(color: Colors.black),
              ),
              activeColor: selectedColor,
              onChanged: (value) {},
            );
          },
        ).toList(),
      );
}
