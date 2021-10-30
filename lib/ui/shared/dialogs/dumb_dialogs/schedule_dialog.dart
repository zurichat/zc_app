import 'package:flutter/material.dart';
import 'package:zurichat/utilities/constants/colors.dart';
import 'package:zurichat/ui/view/dm_user/dm_user_viewmodel.dart';
import 'package:stacked_services/stacked_services.dart';

class ScheduleMess extends StatelessWidget {
  final DialogRequest request;
  final Function(DialogResponse) completer;

  const ScheduleMess({Key? key, required this.request, required this.completer})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    DmUserViewModel model = DmUserViewModel();
    return AlertDialog(
      title: const Text('Schedule message'),
      actions: <Widget>[
        Center(
          child: Column(children: [
            TextButton(
              onPressed: () async {
                await model.scheduleMessage(5, '30 minutes from now');
                model.exit();
                FocusScope.of(context).requestFocus(FocusNode());
              },
              child: const Text(
                '30 minutes from now',
                style: TextStyle(color: AppColors.blackColor),
              ),
            ),
            TextButton(
              onPressed: () {
                model.exit();
                model.scheduleMessage(0.5, '1 hour from now');
                FocusScope.of(context).requestFocus(FocusNode());
              },
              child: const Text(
                '1 hour from now',
                style: TextStyle(color: AppColors.blackColor),
              ),
            ),
            TextButton(
              onPressed: () {
                model.exit();
                model.scheduleMessage(0.5, 'messageText');
                FocusScope.of(context).requestFocus(FocusNode());
              },
              child: const Text(
                '2 hours from now',
                style: TextStyle(color: AppColors.blackColor),
              ),
            ),
            TextButton(
              onPressed: () {
                model.exit();
                model.scheduleMessage(0.5, 'messageText');
                FocusScope.of(context).requestFocus(FocusNode());
              },
              child: const Text(
                '6 hours from now',
                style: TextStyle(color: AppColors.blackColor),
              ),
            ),
          ]),
        )
      ],
    );
  }
}
