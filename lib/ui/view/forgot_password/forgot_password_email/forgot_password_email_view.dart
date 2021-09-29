import 'package:flutter/material.dart';
import 'package:hng/general_widgets/custom_textfield.dart';
import 'package:hng/constants/app_strings.dart';
import 'package:hng/ui/shared/colors.dart';
import 'package:hng/ui/shared/shared.dart';
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
    return ViewModelBuilder<ForgotPasswordEmailViewModel>.reactive(
      onModelReady: (model) => listenToFormUpdated(model),
      viewModelBuilder: () => ForgotPasswordEmailViewModel(),
      builder: (context, model, child) => ModalProgressHUD(
        inAsyncCall: model.isLoading,
        color: AppColors.whiteColor,
        progressIndicator: CircularProgressIndicator(
          color: AppColors.zuriPrimaryColor,
        ),
        child: Scaffold(
          resizeToAvoidBottomInset: false,
          backgroundColor: AppColors.whiteColor,
          body: SafeArea(
            child: Padding(
              padding: EdgeInsets.fromLTRB(20.0, 20.0, 20.0, 0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  SizedBox(
                    height: 6.0,
                  ),
                  Container(
                    alignment: Alignment.center,
                    child: Image.asset(ZuriLogo),
                  ),
                  SizedBox(
                    height: 24.0,
                  ),
                  Center(
                    child: Text(
                      ForgotPassword,
                      style: AppTextStyles.heading9,
                    ),
                  ),
                  SizedBox(
                    height: 6.0,
                  ),
                  Center(
                    child: Text(
                      Header,
                      textAlign: TextAlign.center,
                    ),
                  ),
                  SizedBox(
                    height: 49.0,
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(vertical: 8.0),
                    child: Text(
                      EmailAddress,
                      style: AppTextStyles.body1Bold,
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustomTextField(
                          keyboardType: TextInputType.emailAddress,
                          inputAction: TextInputAction.next,
                          autoCorrect: false,
                          obscureText: false,
                          controller: forgotEmailController,
                           hintText: EmailHintText,


                          border: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(3.0)),
                          ),
                          ),
                          // onChanged: model.submitEmail,
                  
                      ////Changes
                      Padding(
                        padding: const EdgeInsets.only(left: 16.0),
                        child: Visibility(
                          visible: model.inputError,
                          child: Column(
                            children: [
                              UIHelper.verticalSpaceSmall,
                              Text(
                                InvalidEmail,
                                style: AppTextStyles.body2Medium.copyWith(
                                  color: AppColors.redColor,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  //Changes  ss
                  SizedBox(
                    height: 30.0,
                  ),
                  Center(
                    child: FractionallySizedBox(
                      widthFactor: 1.0,
                      child: ElevatedButton(
                        onPressed: () {
                          // ignore: unnecessary_statements
                          // model.submitEmail();
                          model.validateEmailIsRegistered();
                        },
                        child: Text(
                          Continue,
                          style: AppTextStyles.buttonText,
                        ),
                        style: ElevatedButton.styleFrom(
                          padding: EdgeInsets.only(top: 15.0, bottom: 15.0),
                          primary: AppColors.zuriPrimaryColor,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 10),
                  Center(
                    child: GestureDetector(
                      onTap: () {
                        model.navigateToSignIn();
                      },
                      child: RichText(
                        text: TextSpan(
                          children: [
                            TextSpan(
                              text: BackTo,
                              style: AppTextStyles.normalText.copyWith(
                                color: AppColors.blackColor,
                              ),
                            ),
                            TextSpan(
                              text: SignIn,
                              style: AppTextStyles.body2Bold.copyWith(
                                color: AppColors.zuriPrimaryColor,
                              ),
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
