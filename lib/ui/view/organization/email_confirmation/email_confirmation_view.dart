import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:zurichat/ui/shared/colors.dart';
import 'package:zurichat/ui/shared/text_styles.dart';
import 'package:zurichat/utilities/internalization/localization/app_localization.dart';
import 'package:stacked/stacked.dart';

import 'email_confirmation_viewmodel.dart';

class EmailConfirmationView extends StatelessWidget {
  const EmailConfirmationView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final local = AppLocalization.of(context);
    return ViewModelBuilder<EmailConfirmationViewModel>.reactive(
        viewModelBuilder: () => EmailConfirmationViewModel(),
        builder: (context, viewModel, child) {
          return Center(
            child: Container(
              padding: const EdgeInsets.all(10),
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(local!.checkYourMail,
                        style: AppTextStyle.darkGreySize16Bold),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(local.confirmEmailText,
                        textAlign: TextAlign.center,
                        style: AppTextStyle.darkGreySize14),
                    const SizedBox(
                      height: 10,
                    ),
                    TextButton(
                      child: Text(local.openEmailApp,
                          style: AppTextStyle.darkGreySize16Bold),
                      style: TextButton.styleFrom(
                        primary: AppColors.whiteColor,
                        backgroundColor: HexColor('#00B87C'),
                        onSurface: HexColor('#00B87C'),
                      ),
                      onPressed: () {
                        viewModel.openEmailApp();
                      },
                    )
                  ]),
            ),
          );
        });
  }
}
