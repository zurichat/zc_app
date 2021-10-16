import 'package:flutter/material.dart';
import 'package:zurichat/ui/shared/dialogs/remind_me_dialog/remind_me_dialog_viewmodel.dart';
import 'package:zurichat/ui/shared/text_styles.dart';
import 'package:zurichat/utilities/internalization/localization/app_localization.dart';
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
    final local = AppLocalization.of(context);
    return ViewModelBuilder<RemindMeDialogViewModel>.reactive(
      builder: (context, model, child) => AlertDialog(
        content: Container(
          padding: EdgeInsets.symmetric(
              horizontal: size.width * .01, vertical: size.height * .02),
          decoration: BoxDecoration(
              color: Colors.white, borderRadius: BorderRadius.circular(15)),
          width: size.width * .9,
          height: size.height * .50,
          child: ListView(
            children: [
              ListTile(
                title: Text(
                  local!.remindMe,
                  style: AppTextStyle.darkGreySize18Bold,
                ),
              ),
              ListTile(
                onTap: model.messageRemindertwentyMinutes,
                enabled: true,
                title: Text(
                  local.in20Minutes,
                  style: AppTextStyle.darkGreySize16,
                ),
                trailing: Text(
                  model.twentyMinutes.toString(),
                  style: AppTextStyle.darkGreySize16,
                ),
              ),
              ListTile(
                title: Text(
                  local.in1Hour,
                  style: AppTextStyle.darkGreySize16,
                ),
                trailing: Text(
                  model.oneHour,
                  style: AppTextStyle.darkGreySize16,
                ),
              ),
              ListTile(
                title: Text(
                  local.in3Hour,
                  style: AppTextStyle.darkGreySize16,
                ),
                trailing: Text(
                  model.threeHours,
                  style: AppTextStyle.darkGreySize16,
                ),
              ),
              ListTile(
                title: Text(
                  local.tomorrow,
                  style: AppTextStyle.darkGreySize16,
                ),
                trailing: Text(
                  model.tomorrow,
                  style: AppTextStyle.darkGreySize16,
                ),
              ),
              ListTile(
                title: Text(
                  local.nextWeek,
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
                  local.custom,
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
