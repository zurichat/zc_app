import 'package:flutter/material.dart';
import 'package:hng/ui/shared/dialogs/remind_me_dialog/remind_me_dialog_viewmodel.dart';
import 'package:hng/ui/shared/text_styles.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class ReminderDialog extends StatelessWidget {
  final DialogRequest request;
  final Function(DialogResponse) completer;
  const ReminderDialog(
      {Key? key, required this.request, required this.completer})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return ViewModelBuilder<RemindMeDialogViewModel>.reactive(
      builder: (context, model, child) => AlertDialog(
        content: Container(
          padding: EdgeInsets.symmetric(
              horizontal: size.width * .02, vertical: size.height * .02),
          decoration: BoxDecoration(
              color: Colors.white, borderRadius: BorderRadius.circular(15)),
          width: size.width * .9,
          height: size.height * .37,
          child: Column(
            children: [
              ListTile(
                title: Text(
                  'Remind me',
                  style: AppTextStyle.darkGreySize18Bold,
                ),
              ),
              ListTile(
                onTap: model.messageRemindertwentyMinutes,
                enabled: true,
                title: Text(
                  'in 20 minutes',
                  style: AppTextStyle.darkGreySize16,
                ),
                trailing: Text(
                  model.twentyMinutes.toString(),
                  style: AppTextStyle.darkGreySize16,
                ),
              ),
              ListTile(
                title: Text(
                  'in 1 hour',
                  style: AppTextStyle.darkGreySize16,
                ),
                trailing: Text(
                  model.oneHour,
                  style: AppTextStyle.darkGreySize16,
                ),
              ),
              ListTile(
                title: Text(
                  'in 3 hours',
                  style: AppTextStyle.darkGreySize16,
                ),
                trailing: Text(
                  model.threeHours,
                  style: AppTextStyle.darkGreySize16,
                ),
              ),
              ListTile(
                title: Text(
                  'Tomorrow',
                  style: AppTextStyle.darkGreySize16,
                ),
                trailing: Text(
                  model.tomorrow,
                  style: AppTextStyle.darkGreySize16,
                ),
              ),
              ListTile(
                title: Text(
                  'Next week',
                  style: AppTextStyle.darkGreySize16,
                ),
                trailing: Text(
                  model.nextWeek,
                  style: AppTextStyle.darkGreySize16,
                ),
              ),
              ListTile(
                onTap: () async {
                  var selectedDate = await selectDateTime(context);
                  var selectedTime = await selectTime(context);
                  model.customReminder(selectedDate, selectedTime);
                },
                title: Text(
                  'Custom',
                  style: AppTextStyle.darkGreySize16,
                ),
              ),
            ],
          ),
        ),
      ),
      viewModelBuilder: () => RemindMeDialogViewModel(),
    );
  }

  Future<dynamic> selectDateTime(context) {
    var selectedDate = showDatePicker(
      context: context,
      initialDate: DateTime.now().add(const Duration(seconds: 1)),
      firstDate: DateTime.now(),
      lastDate: DateTime(2100),
    );
    return selectedDate;
  }

  Future<dynamic> selectTime(context) {
    final now = DateTime.now();
    var selectedTime = showTimePicker(
      context: context,
      initialTime: TimeOfDay(hour: now.hour, minute: now.minute),
    );
    return selectedTime;
  }
}
