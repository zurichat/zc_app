import 'package:flutter/material.dart';
import 'package:hng/ui/shared/dialogs/remind_me_dialog/remind_me_dialog.dart';
import 'package:stacked/stacked.dart';

class ThreadOptionsBottomSheetViewModel extends BaseViewModel {
  remindMe(context) async {
    return await showDialog(
        context: context,
        builder: (context) {
          return const ReminderDialog();
        });
  }
}


// WidgetsBinding.instance.addPostFrameCallback((_){

//   // Add Your Code here.

// });