import 'package:flutter/material.dart';
import 'package:hng/ui/shared/colors.dart';
import 'package:hng/ui/view/dm_user/dm_user_viewmodel.dart';
import 'package:stacked_services/stacked_services.dart';

class ScheduleMess extends StatelessWidget {
  final DialogRequest request;
  final Function(DialogResponse) completer;

  const ScheduleMess({Key? key, required this.request, required this.completer})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    //final String orgName = request.data!;
    return AlertDialog(
      title: const Text('Schedule message'),
      actions: <Widget>[
        Center(
          child: Column(children: [
            TextButton(
              onPressed: () async {
                DmUserViewModel model = DmUserViewModel();

                await model.scheduleMessage(5, '30 minutes from now');
                model.exit();
                FocusScope.of(context).requestFocus(FocusNode());

                // messageController.clear();
              },
              child: const Text(
                '30 minutes from now',
                style: TextStyle(color: AppColors.blackColor),
              ),
            ),
            TextButton(
              onPressed: () {
                DmUserViewModel model = DmUserViewModel();
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
                DmUserViewModel model = DmUserViewModel();
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
                DmUserViewModel model = DmUserViewModel();
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
