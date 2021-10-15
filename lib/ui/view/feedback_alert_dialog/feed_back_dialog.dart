import 'package:flutter/material.dart';
import 'package:hng/constants/app_strings.dart';
import 'package:hng/utilities/internalization/localization/app_localization.dart';

import '../../../general_widgets/app_alert_dialog.dart';

class FeedBackDialogCall extends StatelessWidget {
  const FeedBackDialogCall({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final local = AppLocalization.of(context);
    return Scaffold(
      body: ElevatedButton(
        onPressed: () => AppAlertDialog().appDialog(
          context,
          local!.composeFeedback,
          local.feedbackHint,
        ),
        child: const Text(Alert),
      ),
    );
  }
}
