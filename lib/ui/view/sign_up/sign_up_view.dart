import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:stacked/stacked.dart';
import './sign_up_viewmodel.dart';
import '../../../general_widgets/custom_textfield.dart';

import '../../shared/colors.dart';
import '../../shared/styles.dart';

// ignore: must_be_immutable
class SignUpView extends StatelessWidget {
  const SignUpView({Key? key}) : super(key: key);

  Widget _smallSizedBox() {
    return const SizedBox(
      height: 8,
    );
  }

  Widget _mediumSizedBox() {
    return const SizedBox(
      height: 16,
    );
  }

  Widget _largeSizedBox() {
    return const SizedBox(
      height: 32,
    );
  }

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<SignUpViewModel>.reactive(
        disposeViewModel: false,
        initialiseSpecialViewModelsOnce: true,
        viewModelBuilder: () => SignUpViewModel(),
        builder: (context, viewModel, child) {
          return Scaffold(
            body: Container(
              margin: const EdgeInsets.all(16.0),
              decoration: BoxDecoration(
                color: AppColors.whiteColor,
              ),
              child: ListView(
                shrinkWrap: true,
                scrollDirection: Axis.vertical,
                padding: EdgeInsets.only(
                  top: 50,
                  bottom: 70,
                ),
                children: [
                  Center(
                    child: Image.asset('assets/logo/zuri_chat_logo.png'),
                  ),
                  _mediumSizedBox(),
                  Center(
                    child: Text(
                      'Sign Up',
                      style: TextStyle(
                        fontSize: 32.0,
                        color: AppColors.deepBlackColor,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  _smallSizedBox(),
                  Center(
                    child: Text(
                      'Please sign up to create account',
                      style: AppTextStyles.heading5,
                    ),
                  ),
                  _largeSizedBox(),
                  CustomTextField(
                    keyboardType: TextInputType.emailAddress,
                    inputAction: TextInputAction.next,
                    autoFocus: true,
                    autoCorrect: false,
                    obscureText: false,
                    labelText: 'Phone or Email',
                    hintText: 'Phone or Email',
                  ),
                  _smallSizedBox(),
                  CustomTextField(
                    keyboardType: TextInputType.emailAddress,
                    inputAction: TextInputAction.next,
                    autoFocus: true,
                    autoCorrect: false,
                    obscureText: true,
                    labelText: 'Phone or Email',
                    hintText: 'Password',
                  ),
                  _smallSizedBox(),
                  CustomTextField(
                    keyboardType: TextInputType.emailAddress,
                    inputAction: TextInputAction.next,
                    autoFocus: true,
                    autoCorrect: false,
                    obscureText: true,
                    labelText: 'Phone or Email',
                    hintText: 'Password',
                  ),
                  _smallSizedBox(),
                  CheckboxListTile(
                      value: false,
                      onChanged: (newValue) {},
                      controlAffinity: ListTileControlAffinity.leading,
                      contentPadding: EdgeInsets.all(0),
                      title: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: 18,
                            child: Text(
                              'By selecting this box, you agreed to our',
                              style: AppTextStyles.body1Regular,
                            ),
                          ),
                          SizedBox(
                            height: 20,
                            child: TextButton(
                              style: TextButton.styleFrom(
                                  padding: EdgeInsets.zero,
                                  minimumSize: Size(50, 17)),
                              child: Text(
                                'terms and coditions',
                                style: TextStyle(
                                  fontSize: 16,
                                  color: AppColors.greenColor,
                                  fontWeight: FontWeight.bold,
                                  decoration: TextDecoration.underline,
                                  decorationColor: AppColors.greenColor,
                                  decorationStyle: TextDecorationStyle.solid,
                                  decorationThickness: 2,
                                ),
                              ),
                              onPressed: () {},
                            ),
                          )
                        ],
                      )),
                  _smallSizedBox(),
                  ElevatedButton(
                    onPressed: () {},
                    child: Text(
                      'Create Account',
                      style: TextStyle(
                        fontSize: 16,
                        color: AppColors.whiteColor,
                      ),
                    ),
                    style: ElevatedButton.styleFrom(
                      primary: AppColors.greenColor,
                      elevation: 0,
                      padding: EdgeInsets.symmetric(
                        horizontal: 10,
                        vertical: 10,
                      ),
                    ),
                  ),
                  _smallSizedBox(),
                  Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Already  have an Account ?',
                          style: AppTextStyles.body1Regular,
                        ),
                        TextButton(
                          child: Text(
                            'Sign In',
                            style: TextStyle(
                              fontSize: 16,
                              color: AppColors.greenColor,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          onPressed: () {},
                        )
                      ],
                    ),
                  ),
                  _smallSizedBox(),
                  Center(
                    child: Text(
                      'Or',
                      style: AppTextStyles.body1Bold,
                    ),
                  ),
                  _mediumSizedBox(),
                  Container(
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: AppColors.deepBlackColor,
                      ),
                    ),
                    child: InkWell(
                      onTap: () {
                        print(" chiboy clicked");
                      },
                      child: Ink(
                        color: AppColors.whiteColor,
                        child: Center(
                          child: Padding(
                            padding: EdgeInsets.all(8),
                            child: Wrap(
                              crossAxisAlignment: WrapCrossAlignment.center,
                              children: [
                                ClipOval(
                                  child: Image.asset(
                                    'assets/logo/Google_logo.png',
                                    height: 25,
                                  ),
                                ),
                                SizedBox(width: 12),
                                Text('Sign Up with Google',
                                    style: AppTextStyles.body1Bold),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          );
        });
  }
}
