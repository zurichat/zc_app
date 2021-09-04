import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:stacked/stacked.dart';
import './sign_up_viewmodel.dart';

import '../../shared/colors.dart';
import '../../shared/styles.dart';
import '../../shared/text_field.dart';
import '../../shared/ui_helpers.dart';

// ignore: must_be_immutable
class SignUpView extends StatelessWidget {
   SignUpView({Key? key}) : super(key: key);
  
  Widget _passWordTextField() {
    return TextField(
      controller: signUpPasswordTEC,
      obscureText: true,
      autofocus: false,
      onChanged: (val) {},
      style: TextStyle(fontSize: 16, height: 0.5),
      decoration: InputDecoration(
        labelText: 'Password',
        hintText: 'Enter password',
        border: OutlineInputBorder(
          borderSide: new BorderSide(color: AppColors.borderColor),
        ),
      ),
    );
  }

  final signUpEmailorPhoneTEC = TextEditingController();
  TextEditingController signUpPasswordTEC = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<SignUpViewModel>.reactive(
        disposeViewModel: false,
        initialiseSpecialViewModelsOnce: true,
        viewModelBuilder: () => SignUpViewModel(),
        builder: (context, viewModel, child) {
          return Scaffold(
            body: SafeArea(
              child: Container(
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
                      child: Image(
                        image: logoAsset,
                      ),
                    ),
                    UIHelper.verticalSpaceMedium,
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
                    UIHelper.verticalSpaceSmall,
                    Center(
                      child: Text(
                        'Please sign up to create account',
                        style: AppTextStyles.heading5,
                      ),
                    ),
                    UIHelper.verticalSpaceLarge,
                    LabelTextField(
                      onChanged: (val) {},
                      controller: signUpEmailorPhoneTEC,
                      label: 'Email or phone',
                      autofocus: true,
                    ),
                    UIHelper.verticalSpaceMedium,
                    _passWordTextField(),
                    UIHelper.verticalSpaceMedium,
                    _passWordTextField(),
                    UIHelper.verticalSpaceSmall,
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
                    UIHelper.verticalSpaceSmall,
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
                    UIHelper.verticalSpaceSmall,
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
                    UIHelper.verticalSpaceSmall,
                    Center(
                      child: Text(
                        'Or',
                        style: AppTextStyles.body1Bold,
                      ),
                    ),
                    UIHelper.verticalSpaceMedium,
                    Container(
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: AppColors.deepBlackColor,
                        ),
                      ),
                      child: InkWell(
                        onTap: () {},
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
                                      'assets/images/Google_logo.png',
                                      height: 25,
                                    ),
                                  ),
                                  UIHelper.horizontalSpaceSmall,
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
            ),
          );
        });
  }
}
