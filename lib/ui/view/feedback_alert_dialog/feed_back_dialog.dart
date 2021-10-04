import 'package:flutter/material.dart';
import 'package:hng/constants/app_strings.dart';

import '../../../general_widgets/app_alert_dialog.dart';

class FeedBackDialogCall extends StatelessWidget {
  const FeedBackDialogCall({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ElevatedButton(
        onPressed: () => AppAlertDialog().appDialog(
          context,
          ComposeFeedback,
          FeedbackHint,
        ),
        child: const Text(Alert),
      ),
    );
  }
}
