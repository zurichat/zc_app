import 'package:flutter/material.dart';
import 'package:zurichat/utilities/constants/app_strings.dart';
import 'package:zurichat/utilities/constants/colors.dart';
import 'package:zurichat/ui/shared/shared.dart';
import 'package:zurichat/utilities/constants/text_styles.dart';
import 'package:zurichat/ui/shared/dumb_widgets/zuri_loader.dart';
import 'package:zurichat/utilities/internationalization/app_localization.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked/stacked_annotations.dart';

// GENERATED IMPORTS -- DO NOT SIMPLY EDIT.
import 'forgot_password_email_view.form.dart';
import 'forgot_password_email_viewmodel.dart';

@FormView(fields: [FormTextField(name: 'forgotEmail')])
class ForgotPasswordEmailView extends StatelessWidget
    with $ForgotPasswordEmailView {
  //bool isWrong = false;
  ForgotPasswordEmailView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final local = AppLocalization.of(context);
    final bool _dark = Theme.of(context).brightness == Brightness.dark;

    return ViewModelBuilder<ForgotPasswordEmailViewModel>.reactive(
      onModelReady: (model) => listenToFormUpdated(model),
      viewModelBuilder: () => ForgotPasswordEmailViewModel(),
      builder: (context, model, child) => ModalProgressHUD(
        inAsyncCall: model.isLoading,
        color: AppColors.whiteColor,
        progressIndicator: const ZuriLoader(),
        child: Scaffold(
          resizeToAvoidBottomInset: false,
          body: SafeArea(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(20.0, 20.0, 20.0, 0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  UIHelper.verticalSpaceLarge,
                  Center(
                    child: Image.asset(
                      ZuriLogo,
                      height: 50,
                      width: 50,
                    ),
                  ),
                  UIHelper.customVerticalSpace(24),
                  Center(
                    child: Text(
                      local!.forgotPassword,
                      style: _dark
                          ? AppTextStyle.whiteSize20Bold
                          : AppTextStyle.darkGreySize20Bold,
                    ),
                  ),
                  const SizedBox(
                    height: 6.0,
                  ),
                  Center(
                    child: Text(
                      local.forgotPasswordHeader,
                      textAlign: TextAlign.center,
                    ),
                  ),
                  const SizedBox(
                    height: 49.0,
                  ),
                  Container(
                    margin: const EdgeInsets.symmetric(vertical: 8.0),
                    child: Text(
                      local.emailAddress,
                      style: _dark
                          ? AppTextStyle.whiteSize16Bold
                          : AppTextStyle.darkGreySize16Bold,
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Form(
                        child: TextField(
                          controller: forgotEmailController,
                          keyboardType: TextInputType.emailAddress,
                          obscureText: false,
                          textInputAction: TextInputAction.done,
                          autocorrect: true,
                          decoration: const InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.all(
                                Radius.circular(3.0),
                              ),
                            ),
                            hintText: EmailHintText,
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.all(
                                Radius.circular(5.0),
                              ),
                              borderSide: BorderSide(
                                color: AppColors.zuriPrimaryColor,
                              ),
                            ),
                          ),
                        ),
                      ),

                      ////Changes
                      Padding(
                        padding: const EdgeInsets.only(left: 16.0),
                        child: Visibility(
                          visible: model.inputError,
                          child: Column(
                            children: [
                              UIHelper.verticalSpaceSmall,
                              Text(
                                local.invalidEmail,
                                style: AppTextStyle.errorSize14,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  //Changes  ss
                  const SizedBox(
                    height: 30.0,
                  ),
                  Center(
                    child: FractionallySizedBox(
                      widthFactor: 1.0,
                      child: ElevatedButton(
                        onPressed: () {
                          // model.submitEmail();
                          model.validateEmailIsRegistered();
                        },
                        child: Text(
                          local.continueButton,
                          style: AppTextStyle.whiteSize16,
                        ),
                        style: ElevatedButton.styleFrom(
                          padding:
                              const EdgeInsets.only(top: 15.0, bottom: 15.0),
                          primary: AppColors.zuriPrimaryColor,
                        ),
                      ),
                    ),
                  ),
                  UIHelper.customVerticalSpace(24),
                  Center(
                    child: GestureDetector(
                      onTap: () {
                        model.navigateToSignIn();
                      },
                      child: RichText(
                        text: TextSpan(
                          children: [
                            TextSpan(
                              text: local.backTo,
                              style: Theme.of(context).textTheme.bodyText1,
                            ),
                            TextSpan(
                              text: local.signIn,
                              style: AppTextStyle.greenSize14,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
