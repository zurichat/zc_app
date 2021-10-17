import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:zurichat/constants/app_strings.dart';

import 'shared.dart';

enum DialogAction { cancel, accept }

class Dialogs {
  static Future<DialogAction> showArchiveChannelAlertDialog(
      BuildContext context, String channelName) async {
    final actionsTextStyle = GoogleFonts.roboto(
      color: AppColors.zuriPrimaryColor,
      fontSize: 16.0,
      fontWeight: FontWeight.w500,
    );

//Buttons set up
    final cancelButton = TextButton(
      child: Text(
        Cancel,
        style: actionsTextStyle,
      ),
      onPressed: () {
        Navigator.of(context).pop(DialogAction.cancel);
      },
    );
    final continueButton = TextButton(
      child: Text(
        Archive,
        style: actionsTextStyle,
      ),
      onPressed: () {
        Navigator.of(context).pop(DialogAction.accept);
      },
    );

    //Alert dialog set up
    final action = await showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text(
              '$Archive $channelName ?',
              style: GoogleFonts.roboto(
                color: const Color(0xff000000).withOpacity(0.87),
                fontSize: 20.0,
                fontWeight: FontWeight.w700,
              ),
            ),
            content: Text(
              CloseChannelWarning,
              style: GoogleFonts.roboto(
                //TODO Change to Brand color
                color: const Color(0xff000000).withOpacity(0.54),
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
    return (action != null) ? action : DialogAction.cancel;
  }
}
