import 'package:flutter/material.dart';
import 'package:hng/general_widgets/custom_text.dart';
import 'package:hng/ui/shared/colors.dart';
import 'package:hng/ui/shared/dialogs/remind_me_dialog/remind_me_dialog_viewmodel.dart';
import 'package:hng/utilities/internalization/localization/app_localization.dart';
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
                title: CustomText(
                  text: local!.remindMe,
                  fontWeight: FontWeight.w700,
                  fontSize: 20,
                  color: AppColors.zuriTextBodyColor,
                ),
              ),
              ListTile(
                onTap: model.messageRemindertwentyMinutes,
                enabled: true,
                title: CustomText(
                  text: local.in20Minutes,
                  color: AppColors.zuriTextBodyColor,
                ),
                trailing: CustomText(
                  text: model.twentyMinutes.toString(),
                  color: AppColors.zuriTextBodyColor,
                ),
              ),
              ListTile(
                title: CustomText(
                  text: local.in1Hour,
                  color: AppColors.zuriTextBodyColor,
                ),
                trailing: CustomText(
                  text: model.oneHour,
                  color: AppColors.zuriTextBodyColor,
                ),
              ),
              ListTile(
                title: CustomText(
                  text: local.in3Hour,
                  color: AppColors.zuriTextBodyColor,
                ),
                trailing: CustomText(
                  text: model.threeHours,
                  color: AppColors.zuriTextBodyColor,
                ),
              ),
              ListTile(
                title: CustomText(
                  text: local.tomorrow,
                  color: AppColors.zuriTextBodyColor,
                ),
                trailing: CustomText(
                  text: model.tomorrow,
                  color: AppColors.zuriTextBodyColor,
                ),
              ),
              ListTile(
                title: CustomText(
                  text: local.nextWeek,
                  color: AppColors.zuriTextBodyColor,
                ),
                trailing: CustomText(
                  text: model.nextWeek,
                  color: AppColors.zuriTextBodyColor,
                ),
              ),
              ListTile(
                onTap: () async {
                  var selectedDate = await selectDateTime(context);
                  var selectedTime = await selectTime(context);
                  model.customReminder(selectedDate, selectedTime);
                },
                title: CustomText(
                  text: local.custom,
                  color: AppColors.zuriTextBodyColor,
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
