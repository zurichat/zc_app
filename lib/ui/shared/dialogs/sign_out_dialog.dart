import 'package:flutter/material.dart';
import 'package:hng/general_widgets/custom_text.dart';
import 'package:hng/ui/shared/colors.dart';
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
      title: CustomText(
        text: 'Sign out of $orgName?',
        fontWeight: FontWeight.w700,
        fontSize: 20,
      ),
      content: const CustomText(
        text: "You can sign back in anytime by tapping \n\"Add a workspace\"",
        maxLines: 2,
        fontWeight: FontWeight.w400,
        fontSize: 14,
      ),
      actions: <Widget>[
        TextButton(
          child: const CustomText(
            text: 'Cancel',
            fontWeight: FontWeight.w700,
            fontSize: 16,
            color: AppColors.zuriPrimaryColor,
          ),
          onPressed: () {
            completer(DialogResponse(confirmed: false));
          },
        ),
        TextButton(
          child: const CustomText(
            text: 'Sign Out',
            fontWeight: FontWeight.w700,
            fontSize: 16,
            color: AppColors.zuriPrimaryColor,
          ),
          onPressed: () {
            completer(DialogResponse(confirmed: true));
          },
        ),
      ],
    );
  }
}
