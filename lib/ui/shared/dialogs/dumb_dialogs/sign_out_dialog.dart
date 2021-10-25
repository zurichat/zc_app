import 'package:flutter/material.dart';

import 'package:zurichat/utilities/constants/text_styles.dart';
import 'package:stacked_services/stacked_services.dart';

class SignOutDialog extends StatelessWidget {
  final DialogRequest request;
  final Function(DialogResponse) completer;

  const SignOutDialog(
      {Key? key, required this.request, required this.completer})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final String orgName = request.data!;
    return AlertDialog(
      title: Text(
        'Sign out of $orgName?',
        style: AppTextStyle.darkGreySize20Bold,
      ),
      content: Text(
        "You can sign back in anytime by tapping \n\"Add a workspace\"",
        style: AppTextStyle.darkGreySize14,
      ),
      actions: [
        TextButton(
          child: Text(
            'Cancel',
            style: AppTextStyle.darkGreySize16,
          ),
          onPressed: () {
            completer(DialogResponse(confirmed: false));
          },
        ),
        TextButton(
          child: Text(
            'Sign Out',
            style: AppTextStyle.darkGreySize16,
          ),
          onPressed: () {
            completer(DialogResponse(confirmed: true));
          },
        ),
      ],
    );
  }
}
