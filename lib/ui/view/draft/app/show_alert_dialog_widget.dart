import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:hng/ui/shared/shared.dart';

showAlertDialog(BuildContext context, model, index) {
  // set up the ok button
  Widget okButton = TextButton(
      onPressed: () {
        model.goBack();
        model.onDismissed(index);
      },
      child: const Text(
        'Ok',
        style: TextStyle(
          color: AppColors.appBarGreen,
          fontWeight: FontWeight.bold,
          fontSize: 15,
        ),
      ));

  // set up the cancel button
  Widget cancelButton = TextButton(
    onPressed: () {
      model.goBack();
    },
    child: const Text(
      'Cancel',
      style: TextStyle(
        color: AppColors.appBarGreen,
        fontWeight: FontWeight.bold,
        fontSize: 15,
      ),
    ),
  );

  // set up the AlertDialog
  AlertDialog alert = AlertDialog(
    title: const Center(
        child: Text(
        "Delete Draft",
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: AppColors.appBarGreen
          ),
    )),
    content: const Text("Are you sure you want to delete this draft?"),
    actions: [cancelButton, okButton],
    actionsAlignment: MainAxisAlignment.spaceBetween,
  );

  // show the dialog
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return alert;
    },
  );
}
