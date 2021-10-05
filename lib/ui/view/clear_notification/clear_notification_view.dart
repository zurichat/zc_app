import 'package:flutter/material.dart';
import 'package:hng/constants/app_strings.dart';
import 'package:hng/ui/shared/styles.dart';
import 'package:hng/ui/shared/zuri_appbar.dart';
//import 'package:hng_task2/ui/views/clear_notification/widgets/clear_notification_viewmodel.dart';
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
    return ViewModelBuilder<ClearNotificationViewModel>.reactive(
        builder: (context, model, child) => Scaffold(
              appBar: 
              ZuriTopBar(
                leading: Icons.arrow_back_ios,
                leadingPress: () => model.navigateBack(),
                orgTitle: Text(
            ClearAfter,
            style: AppTextStyles.heading7,
          ),
              ),
              body: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      buildRadios(),
                    ]),
              ),
            ),
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
