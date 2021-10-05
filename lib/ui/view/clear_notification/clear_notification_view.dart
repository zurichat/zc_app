import 'package:flutter/material.dart';
import 'package:hng/constants/app_strings.dart';
//import 'package:hng_task2/ui/views/clear_notification/widgets/clear_notification_viewmodel.dart';
import 'package:stacked/stacked.dart';

import 'clear_notification_viewmodel.dart';

class ClearNotificationView extends StatefulWidget {
  const ClearNotificationView({Key? key}) : super(key: key);
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

  @override
  _ClearNotificationViewState createState() => _ClearNotificationViewState();
}

class _ClearNotificationViewState extends State<ClearNotificationView> {
  String selectedValue = ClearNotificationView.values.toString();

  final selectedColor = Colors.blue;

  final unselectedColor = Colors.black;

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<ClearNotificationViewModel>.reactive(
        builder: (context, model, child) => Scaffold(
              appBar: AppBar(
                backgroundColor: Colors.white,
                leading: IconButton(
                  icon: const Icon(Icons.arrow_back, color: Colors.black),
                  onPressed: () => Navigator.of(context).pop(),
                ),
                title: const Text(
                  'Clear after...',
                  style: TextStyle(color: Colors.black),
                ),
                centerTitle: false,
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
            //final selected = this.selectedValue == value;
            //final color = unselectedColor;

            return RadioListTile<String>(
              value: value,
              groupValue: selectedValue,
              title: Text(
                value,
                style: const TextStyle(color: Colors.black),
              ),
              activeColor: selectedColor,
              onChanged: (value) => setState(() => selectedValue = value!),
            );
          },
        ).toList(),
      );
}
