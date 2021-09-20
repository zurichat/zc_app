import 'package:flutter/material.dart';
import 'package:hng/general_widgets/custom_textfield.dart';
import 'package:hng/ui/shared/colors.dart';
import 'package:hng/ui/shared/shared.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked/stacked_annotations.dart';

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
      builder: (context, model, child) => Scaffold(
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
                      style: TextStyle(
                          fontWeight: FontWeight.w500, fontSize: 20.0),
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
                        style: TextStyle(
                            fontWeight: FontWeight.w700, fontSize: 16.0),
                      )),
                  Form(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        TextField(
                          controller: newPasswordController,
                          keyboardType: TextInputType.emailAddress,
                          obscureText: true,
                          textInputAction: TextInputAction.done,
                          autocorrect: true,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(3.0))),
                            hintText: 'Enter Password',
                            focusedBorder: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(5.0)),
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
                                  'Password Must be aleast 6 characters',
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
                            style: TextStyle(
                                fontWeight: FontWeight.w700, fontSize: 16.0),
                          ),
                        ),
                        TextField(
                          controller: confirmPasswordController,
                          keyboardType: TextInputType.emailAddress,
                          obscureText: true,
                          textInputAction: TextInputAction.done,
                          autocorrect: true,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(3.0))),
                            hintText: 'Confirm Password',
                            focusedBorder: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(5.0)),
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
                          style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w700,
                              fontStyle: FontStyle.normal,
                              color: Color(0xffFFFFFF)),
                        ),
                        style: ElevatedButton.styleFrom(
                          padding: EdgeInsets.only(top: 15.0, bottom: 15.0),
                          primary: Color(0xff00B87C),
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
      viewModelBuilder: () => ForgotPasswordNewViewModel(),
    );
  }
}
