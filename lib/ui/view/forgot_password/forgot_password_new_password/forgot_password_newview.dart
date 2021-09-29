import 'package:flutter/material.dart';
import 'package:hng/general_widgets/custom_textfield.dart';
import 'package:hng/ui/shared/colors.dart';
import 'package:hng/ui/shared/shared.dart';
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
        progressIndicator: CircularProgressIndicator(
          color: AppColors.zuriPrimaryColor,
        ),
        child: Scaffold(
          resizeToAvoidBottomInset: false,
          backgroundColor: AppColors.whiteColor,
          body: SafeArea(
            child: Padding(
              padding: EdgeInsets.fromLTRB(20.0, 20.0, 20.0, 0),
              child: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    SizedBox(
                      height: 6.0,
                    ),
                    Container(
                      alignment: Alignment.center,
                      child: Image.asset('assets/logo/zuri_chat_logo.png'),
                    ),
                    SizedBox(
                      height: 24.0,
                    ),
                    Center(
                      child: Text(
                        'Forgot Password',
                        style: AppTextStyles.body1Bold,
                      ),
                    ),
                    SizedBox(
                      height: 6.0,
                    ),
                    Center(
                      child: Text(
                        'Your new password must be different from ',
                        textAlign: TextAlign.center,
                      ),
                    ),
                    Center(
                      child: Text(
                        'previously used password',
                        textAlign: TextAlign.center,
                      ),
                    ),
                    SizedBox(
                      height: 49.0,
                    ),
                    Container(
                        margin: EdgeInsets.symmetric(vertical: 8.0),
                        child: Text(
                          'New Password',
                          style: AppTextStyles.body1Bold,
                        )),
                    Form(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CustomTextField(
                              keyboardType: TextInputType.visiblePassword,
                              inputAction: TextInputAction.next,
                              autoCorrect: false,
                              obscureText: true,
                              controller: newPasswordController,
                              hintText: 'Enter Password',
                              border: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(3.0)),
                              )),

                          ////Changes
                          Padding(
                            padding: const EdgeInsets.only(left: 16.0),
                            child: Visibility(
                              visible: model.inputError,
                              child: Column(
                                children: [
                                  UIHelper.verticalSpaceSmall,
                                  Text(
                                    'Password Must be at least 6 characters',
                                    style: AppTextStyles.body2Medium.copyWith(
                                      color: AppColors.redColor,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),

                          //Changes  ss
                          SizedBox(
                            height: 15.0,
                          ),
                          Container(
                            margin: EdgeInsets.symmetric(vertical: 8.0),
                            child: Text(
                              'Confirm Password',
                              style: AppTextStyles.body1Bold,
                            ),
                          ),
                          CustomTextField(
                              keyboardType: TextInputType.visiblePassword,
                              inputAction: TextInputAction.next,
                              autoCorrect: false,
                              obscureText: true,
                              controller: confirmPasswordController,
                              hintText: 'Confirm Password',
                              border: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(3.0)),
                              )),

                          ////Changes
                          Padding(
                            padding: const EdgeInsets.only(left: 16.0),
                            child: Visibility(
                              visible: model.inputError,
                              child: Column(
                                children: [
                                  UIHelper.verticalSpaceSmall,
                                  Text(
                                    'Passwords do not match',
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
                    SizedBox(
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
                            'Continue',
                            style: AppTextStyles.buttonText,
                          ),
                          style: ElevatedButton.styleFrom(
                            padding: EdgeInsets.only(top: 15.0, bottom: 15.0),
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
