import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hng/ui/shared/shared.dart';

enum DialogAction { Cancel, Accept }

class Dialogs {
  static Future<DialogAction> showArchiveChannelAlertDialog(
      BuildContext context, String channelName) async {
    TextStyle actionsTextStyle = GoogleFonts.roboto(
      color: AppColors.greenColor,
      fontSize: 16.0,
      fontWeight: FontWeight.w500,
    );

//Buttons set up
    Widget cancelButton = TextButton(
      child: Text(
        'CANCEL',
        style: actionsTextStyle,
      ),
      onPressed: () {
        Navigator.of(context).pop(DialogAction.Cancel);
      },
    );
    Widget continueButton = TextButton(
      child: Text(
        'ARCHIVE',
        style: actionsTextStyle,
      ),
      onPressed: () {
        Navigator.of(context).pop(DialogAction.Accept);
      },
    );

    //Alert dialog set up
    final action = await showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text(
              "Archive $channelName ?",
              style: GoogleFonts.roboto(
                color: Color(0xff000000).withOpacity(0.87),
                fontSize: 20.0,
                fontWeight: FontWeight.w700,
              ),
            ),
            content: Text(
              "This will close the channel for anyone who has it open.",
              style: GoogleFonts.roboto(
                color: Color(0xff000000).withOpacity(0.54),
                fontSize: 16.0,
                fontWeight: FontWeight.w400,
              ),
            ),
            actions: [
              cancelButton,
              continueButton,
            ],
          );
        });
    return (action != null) ? action : DialogAction.Cancel;
  }
}
