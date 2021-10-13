import 'package:flutter/material.dart';
import 'package:zurichat/constants/app_strings.dart';
import 'package:zurichat/ui/shared/colors.dart';
import 'package:zurichat/ui/shared/shared.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked/stacked_annotations.dart';

// GENERATED IMPORTS -- DO NOT SIMPLY EDIT.
import 'forgot_password_newview.form.dart';
import 'forgot_password_newviewmodel.dart';

@FormView(fields: [
  FormTextField(name: 'newPassword'),
  FormTextField(name: 'confirmPassword')
])
class ForgotPasswordNewView extends StatelessWidget
    with $ForgotPasswordNewView {
  ForgotPasswordNewView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<ForgotPasswordNewViewModel>.reactive(
      onModelReady: (model) => listenToFormUpdated(model),
      builder: (context, model, child) => ModalProgressHUD(
        inAsyncCall: model.isLoading,
        color: AppColors.whiteColor,
        progressIndicator: const CircularProgressIndicator(
          color: AppColors.zuriPrimaryColor,
        ),
        child: Scaffold(
          resizeToAvoidBottomInset: false,
          backgroundColor: AppColors.whiteColor,
          body: SafeArea(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(20.0, 20.0, 20.0, 0),
              child: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    const SizedBox(
                      height: 6.0,
                    ),
                    Container(
                      alignment: Alignment.center,
                      child: Image.asset(ZuriLogo),
                    ),
                    const SizedBox(
                      height: 24.0,
                    ),
                    Center(
                      child: Text(
                        ForgotPassword,
                        style: AppTextStyles.body1Bold,
                      ),
                    ),
                    const SizedBox(
                      height: 6.0,
                    ),
                    const Center(
                      child: Text(
                        NewPasswordHeader,
                        textAlign: TextAlign.center,
                      ),
                    ),
                    const SizedBox(
                      height: 49.0,
                    ),
                    Container(
                      margin: const EdgeInsets.symmetric(vertical: 8.0),
                      child: Text(
                        NewPassword,
                        style: AppTextStyles.body1Bold,
                      ),
                    ),
                    Form(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          TextField(
                            controller: newPasswordController,
                            keyboardType: TextInputType.visiblePassword,
                            obscureText: true,
                            textInputAction: TextInputAction.done,
                            autocorrect: true,
                            decoration: const InputDecoration(
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(3.0),
                                ),
                              ),
                              hintText: PasswordHintText,
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(5.0),
                                ),
                                borderSide: BorderSide(
                                  color: AppColors.zuriPrimaryColor,
                                ),
                              ),
                            ),
                            // onChanged: model.submitEmail,
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
                                    PasswordLengthWarning,
                                    style: AppTextStyles.body2Medium.copyWith(
                                      color: AppColors.redColor,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),

                          //Changes  ss
                          const SizedBox(
                            height: 15.0,
                          ),
                          Container(
                            margin: const EdgeInsets.symmetric(vertical: 8.0),
                            child: Text(
                              ConfirmPassword,
                              style: AppTextStyles.body1Bold,
                            ),
                          ),
                          TextField(
                            controller: confirmPasswordController,
                            keyboardType: TextInputType.visiblePassword,
                            obscureText: true,
                            textInputAction: TextInputAction.done,
                            autocorrect: true,
                            decoration: const InputDecoration(
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(3.0),
                                ),
                              ),
                              hintText: ConfirmPasswordHinText,
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(5.0),
                                ),
                                borderSide: BorderSide(
                                  color: AppColors.zuriPrimaryColor,
                                ),
                              ),
                            ),
                            //  onChanged: model.submitEmail,
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
                                    passwordsMustMatch,
                                    style: AppTextStyles.body2Medium.copyWith(
                                      color: AppColors.redColor,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),

                          //Changes  ss
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 30.0,
                    ),
                    Center(
                      child: FractionallySizedBox(
                        widthFactor: 1.0,
                        child: ElevatedButton(
                          onPressed: () {
                            // model.passwordVerification();
                            model.resetPassword();
                          },
                          child: Text(
                            Continue,
                            style: AppTextStyles.buttonText,
                          ),
                          style: ElevatedButton.styleFrom(
                            padding:
                                const EdgeInsets.only(top: 15.0, bottom: 15.0),
                            primary: AppColors.zuriPrimaryColor,
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
      ),
      viewModelBuilder: () => ForgotPasswordNewViewModel(),
    );
  }
}
