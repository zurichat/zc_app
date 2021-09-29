import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked/stacked_annotations.dart';

import '../../../app/app.logger.dart';
import '../../../general_widgets/custom_text.dart';
import '../../../general_widgets/custom_textfield.dart';
import '../../shared/colors.dart';
import '../../shared/long_button.dart';
import '../../shared/shared.dart';
import '../../shared/styles.dart';
import 'sign_up_view.form.dart';
import 'sign_up_viewmodel.dart';

//stacked forms handling
@FormView(
  fields: [
    FormTextField(name: 'email'),
    FormTextField(name: 'firstName'),
    FormTextField(name: 'lastName'),
    FormTextField(name: 'displayName'),
    FormTextField(name: 'password'),
    FormTextField(name: 'confirmPassword'),
    FormTextField(name: 'phoneNumber'),
  ],
)
class SignUpView extends StatelessWidget with $SignUpView {
  final log = getLogger('SignUpView');

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<SignUpViewModel>.reactive(
        //listenToFormUpdated automatically syncs text
        // from TextFields to the viewmodel
        onModelReady: (model) => listenToFormUpdated(model),
        disposeViewModel: false,
        initialiseSpecialViewModelsOnce: true,
        viewModelBuilder: () => SignUpViewModel(),
        builder: (context, model, child) {
          return ModalProgressHUD(
            inAsyncCall: model.isLoading,
            color: AppColors.whiteColor,
            progressIndicator: const CircularProgressIndicator(
              color: AppColors.zuriPrimaryColor,
            ),
            child: Scaffold(
              backgroundColor: AppColors.whiteColor,
              body: Center(
                child: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        UIHelper.verticalSpaceLarge,
                        Center(
                          child: Image.asset(
                            'assets/logo/zuri_chat_logo.png',
                            height: 32,
                            width: 32,
                          ),
                        ),
                        UIHelper.customVerticalSpace(24),
                        const Center(
                          child: CustomText(
                            text: 'Sign Up',
                            fontSize: 20.0,
                            color: AppColors.zuriTextBodyColor,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        UIHelper.verticalSpaceExtraSmall,
                        const Center(
                          child: CustomText(
                            text: 'Please sign up to create account',
                            fontWeight: FontWeight.w400,
                            fontSize: 14,
                            color: AppColors.zuriDarkGrey,
                          ),
                        ),
                        UIHelper.customVerticalSpace(48),
                        Text(
                          'Email Address',
                          style: AppTextStyles.body1Bold,
                        ),
                        UIHelper.customVerticalSpace(10),
                        CustomTextField(
                          keyboardType: TextInputType.emailAddress,
                          inputAction: TextInputAction.next,
                          autoCorrect: false,
                          obscureText: false,
                          controller: emailController,
                          hintText: 'Name@gmail.com',
                          border: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(3.0)),
                          ),
                        ),
                        UIHelper.verticalSpaceLarge,
                        Text(
                          'Password',
                          style: AppTextStyles.body1Bold,
                        ),
                        UIHelper.customVerticalSpace(10),
                        CustomTextField(
                          keyboardType: TextInputType.visiblePassword,
                          inputAction: TextInputAction.next,
                          autoCorrect: false,
                          obscureText: true,
                          controller: passwordController,
                          hintText: 'Enter Password',
                          border: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(3.0)),
                          ),
                        ),
                        UIHelper.verticalSpaceLarge,
                        Text(
                          'Confirm Password',
                          style: AppTextStyles.body1Bold,
                        ),
                        UIHelper.customVerticalSpace(10),
                        CustomTextField(
                          keyboardType: TextInputType.visiblePassword,
                          inputAction: TextInputAction.next,
                          autoCorrect: false,
                          obscureText: true,
                          controller: confirmPasswordController,
                          hintText: 'Re-enter password',
                          border: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(3.0)),
                          ),
                        ),
                        UIHelper.verticalSpaceMedium,
                        Row(
                          children: [
                            Checkbox(
                              value: model.checkBoxValue,
                              onChanged: (newValue) =>
                                  model.updateValue(newValue),
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const CustomText(
                                  text: '''
By selecting this box, you agreed to our''',
                                  fontSize: 14,
                                ),
                                const Text(
                                  'terms and conditions',
                                  style: TextStyle(
                                    fontSize: 14,
                                    color: AppColors.zuriPrimaryColor,
                                    fontWeight: FontWeight.bold,
                                    decoration: TextDecoration.underline,
                                    decorationColor: AppColors.zuriPrimaryColor,
                                    decorationStyle: TextDecorationStyle.solid,
                                    decorationThickness: 2,
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                        UIHelper.verticalSpaceLarge,
                        LongButton(
                          onPressed: () => model.createUser(context),
                          label: 'Create Account',
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const CustomText(
                              text: 'Already  have an Account ?',
                              fontSize: 14,
                            ),
                            TextButton(
                              child: const CustomText(
                                text: 'Sign In',
                                fontSize: 14,
                                color: AppColors.zuriPrimaryColor,
                                fontWeight: FontWeight.bold,
                              ),
                              onPressed: () => model.navigateToSignIn(),
                            )
                          ],
                        ),
                        const Center(
                          child: CustomText(
                            fontSize: 16,
                            text: 'or',
                            color: AppColors.zuriTextColorHeader,
                          ),
                        ),
                        UIHelper.verticalSpaceMedium,
                        Container(
                          padding: const EdgeInsets.all(8),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(4),
                            border: Border.all(
                              color: AppColors.zuriTextColorHeader,
                              width: 1,
                            ),
                          ),
                          child: InkWell(
                            onTap: () {
                              log.i(' chiboy clicked');
                            },
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Image.asset(
                                  'assets/logo/Google_logo.png',
                                  height: 24,
                                  width: 24,
                                ),
                                UIHelper.customHorizontalSpace(12.0),
                                Text(
                                  'Sign Up with Google',
                                  style: AppTextStyles.body1Bold,
                                ),
                              ],
                            ),
                          ),
                        ),
                        UIHelper.verticalSpaceLarge,
                      ],
                    ),
                  ),
                ),
              ),
            ),
          );
        });
  }
}
