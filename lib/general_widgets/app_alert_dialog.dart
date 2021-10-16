import 'package:flutter/material.dart';
import 'package:zurichat/ui/shared/text_styles.dart';

import '../ui/shared/shared.dart';

class AppAlertDialog {
  Dialog feedback = const Dialog();

  void appDialog(
    BuildContext context,
    String title,
    String hintText,
//      Function onPressed ,
  ) {
    feedback = Dialog(
      child: Container(
        padding: const EdgeInsets.only(left: 18, right: 18, top: 24),
        height: MediaQuery.of(context).size.height / 3.5,
//      width: MediaQuery.of(context).size.width / 0.005,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: AppTextStyle.darkGreySize14,
            ),
            TextFormField(
              decoration: InputDecoration(
                contentPadding: const EdgeInsets.all(8),
                hintText: hintText,
                hintStyle: TextStyle(
                  fontSize: MediaQuery.of(context).size.width / 26,
                  fontWeight: FontWeight.w400,
                ),
                enabledBorder: const UnderlineInputBorder(
                  borderSide: BorderSide(color: AppColors.borderColor),
                ),
                focusedBorder: const UnderlineInputBorder(
                  borderSide: BorderSide(color: AppColors.borderColor),
                ),
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.width / 60,
            ),
            Text(
              'we will respond via email to feedback questions.',
              style: AppTextStyle.darkGreySize14,
            ),
            SizedBox(
              height: MediaQuery.of(context).size.width / 60,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  GestureDetector(
                    child: Text(
                      'CANCEL',
                      style: AppTextStyle.greenSize16,
                    ),
                    onTap: () => Navigator.pop(context),
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width / 25,
                  ),
                  GestureDetector(
//                  onTap: () => onPressed ,
                    child: Text(
                      'CANCEL',
                      style: AppTextStyle.greenSize16,
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
    showDialog(context: context, builder: (BuildContext context) => feedback);
  }
}
