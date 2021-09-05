import 'package:flutter/material.dart';

import '../ui/shared/shared.dart';
import 'custom_text.dart';

class AppAlertDialog {
  Dialog feedback = Dialog();

  void appDialog(
    BuildContext context,
    String title,
    String hintText,
//      Function onPressed ,
  ) {
    feedback = Dialog(
      child: Container(
        padding: EdgeInsets.only(left: 18, right: 18, top: 24),
        height: MediaQuery.of(context).size.height / 3.5,
//      width: MediaQuery.of(context).size.width / 0.005,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomText(
              text: title,
              fontSize: MediaQuery.of(context).size.width / 22,
              fontWeight: FontWeight.bold,
            ),
            TextFormField(
              decoration: InputDecoration(
                contentPadding: EdgeInsets.all(8),
                hintText: hintText,
                hintStyle: TextStyle(
                  fontSize: MediaQuery.of(context).size.width / 26,
                  fontWeight: FontWeight.w400,
                ),
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: AppColors.borderColor),
                ),
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: AppColors.borderColor),
                ),
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.width / 60,
            ),
            CustomText(
              text: "we will respond via email to feedback questions.",
              fontSize: MediaQuery.of(context).size.width / 32,
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
                    child: CustomText(
                      text: "CANCEL",
                      color: AppColors.greenColor,
                      fontSize: MediaQuery.of(context).size.width / 28,
                      fontWeight: FontWeight.bold,
                    ),
                    onTap: () => Navigator.pop(context),
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width / 25,
                  ),
                  GestureDetector(
//                  onTap: () => onPressed ,
                    child: CustomText(
                      text: "SEND",
                      color: AppColors.greenColor,
                      fontSize: MediaQuery.of(context).size.width / 28,
                      fontWeight: FontWeight.bold,
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
