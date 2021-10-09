import 'package:flutter/material.dart';
import 'package:hng/ui/shared/colors.dart';
import 'package:hng/ui/view/channel/channel_view/channel_page_viewmodel.dart';
import 'package:stacked_services/stacked_services.dart';

class ScheduleMessChannel extends StatelessWidget {
  final DialogRequest request;
  final Function(DialogResponse) completer;

  const ScheduleMessChannel({
    Key? key,
    required this.request,
    required this.completer,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String channelID = request.data['channelID'],
        message = request.data['message'];
    ChannelPageViewModel model = ChannelPageViewModel();
    return AlertDialog(
      title: const Text('Schedule message'),
      actions: <Widget>[
        Center(
          child: Column(children: [
            TextButton(
              onPressed: () {
                model.scheduleMessage(0.5, message, channelID);
                model.goBack();
                FocusScope.of(context).requestFocus(FocusNode());
              },
              child: const Text(
                '30 minutes from now',
                style: TextStyle(color: AppColors.blackColor),
              ),
            ),
            TextButton(
              onPressed: () {
                model.goBack();
                model.scheduleMessage(1, message, channelID);
                FocusScope.of(context).requestFocus(FocusNode());
              },
              child: const Text(
                '1 hour from now',
                style: TextStyle(color: AppColors.blackColor),
              ),
            ),
            TextButton(
              onPressed: () {
                model.goBack();
                model.scheduleMessage(2, message, channelID);
                FocusScope.of(context).requestFocus(FocusNode());
              },
              child: const Text(
                '2 hours from now',
                style: TextStyle(color: AppColors.blackColor),
              ),
            ),
            TextButton(
              onPressed: () {
                model.goBack();
                model.scheduleMessage(6, message, channelID);
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
