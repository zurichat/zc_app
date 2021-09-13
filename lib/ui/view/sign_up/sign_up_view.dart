import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:stacked/stacked.dart';

import '../../../general_widgets/custom_text.dart';
import '../../../general_widgets/custom_textfield.dart';
import '../../shared/colors.dart';
import '../../shared/long_button.dart';
import '../../shared/styles.dart';
import 'sign_up_viewmodel.dart';

// ignore: must_be_immutable
class SignUpView extends StatelessWidget {
  const SignUpView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<SignUpViewModel>.reactive(
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
                      children: [
                        const SizedBox(height: 32),
                        Center(
                          child: Image.asset(
                            'assets/logo/zuri_chat_logo.png',
                            height: 32,
                            width: 32,
                          ),
                        ),
                        const SizedBox(height: 24),
                        const Center(
                          child: CustomText(
                            text: 'Sign Up',
                            fontSize: 20.0,
                            color: AppColors.zuriTextBodyColor,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        const SizedBox(height: 4),
                        const Center(
                          child: CustomText(
                            text: 'Please sign up to create account',
                            fontWeight: FontWeight.w400,
                            fontSize: 14,
                            color: AppColors.zuriDarkGrey,
                          ),
                        ),
                        const SizedBox(height: 48),
                        const CustomTextField(
                          keyboardType: TextInputType.emailAddress,
                          inputAction: TextInputAction.next,
                          autoCorrect: false,
                          obscureText: false,
                          labelText: 'Email Address',
                          hintText: 'Name@gmail.com',
                        ),
                        const SizedBox(height: 32),
                        const CustomTextField(
                          keyboardType: TextInputType.visiblePassword,
                          inputAction: TextInputAction.next,
                          autoCorrect: false,
                          obscureText: true,
                          labelText: 'Password',
                          hintText: 'Enter Password',
                        ),
                        const SizedBox(height: 32),
                        const CustomTextField(
                          keyboardType: TextInputType.emailAddress,
                          inputAction: TextInputAction.next,
                          autoCorrect: false,
                          obscureText: true,
                          labelText: 'Confirm Password',
                          hintText: 'Re-enter password',
                        ),
                        const SizedBox(height: 16),
                        Row(children: [
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
                                text:
                                    'By selecting this box, you agreed to our',
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
                        ]),
                        const SizedBox(height: 32),
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
                        const SizedBox(height: 16),
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
                              print(' chiboy clicked');
                            },
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Image.asset(
                                  'assets/logo/Google_logo.png',
                                  height: 24,
                                  width: 24,
                                ),
                                const SizedBox(width: 12),
                                Text(
                                  'Sign Up with Google',
                                  style: AppTextStyles.body1Bold,
                                ),
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(height: 32),
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
