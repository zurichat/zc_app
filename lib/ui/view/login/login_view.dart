import 'package:flutter/material.dart';
import 'package:hng/general_widgets/custom_text.dart';
import 'package:hng/ui/shared/colors.dart';
import 'package:hng/ui/shared/styles.dart';
import '../../../general_widgets/custom_textfield.dart';
import 'package:stacked/stacked.dart';

import 'package:hng/general_widgets/custom_textfield.dart';
import 'package:hng/ui/view/login/login_viewmodel.dart';

class LoginView extends StatelessWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<LoginViewModel>.reactive(
      viewModelBuilder: () => LoginViewModel(),
      builder: (context, model, child) => Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: AppColors.whiteColor,
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.all(16),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.stretch, 
              children: [
                SizedBox(
                  height: 10.0,
                ),
                Container(
                  alignment: Alignment.center,
                  child: Image.asset('assets/logo/zuri_chat_logo.png'),
                ),
                SizedBox(
                  height: 24,
                ),
                Center(
                    child: Text(
                  'Sign In',
                  style: AppTextStyles.heading7,
                ),),
                const SizedBox(height: 4),
                      const Center(
                        child: CustomText(
                          text: 'Welcome! Sign in to continue',
                          fontWeight: FontWeight.w400,
                          fontSize: 14,
                          color: AppColors.zuriDarkGrey,
                        ),
                      ),
                SizedBox(
                  height: 48.0,
                ),
                const CustomTextField(
                  keyboardType: TextInputType.emailAddress,
                  inputAction: TextInputAction.next,
                  autoFocus: false,
                  autoCorrect: true,
                  obscureText: false,
                  labelText: 'Email',
                  hintText: 'Name@gmail.com',
                ),
                SizedBox(
                  height: 33.0,
                ),
                CustomTextField(
                  keyboardType: TextInputType.emailAddress,
                  inputAction: TextInputAction.next,
                  autoFocus: false,
                  autoCorrect: true,
                  obscureText: true,
                  labelText: 'Password',
                  hintText: 'Enter Password',
                ),
                Align(
                  alignment: Alignment.centerRight,
                  child: TextButton(
                    style: ButtonStyle(
                      padding: MaterialStateProperty.all(EdgeInsets.zero),
                    ),
                    onPressed: () => model.navigateToForgotPasswordScreen(),
                    child: Text(
                      'Forgot Password?',
                      style: TextStyle(
                        color: AppColors.zuriPrimaryColor,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 32.0,
                ),
                Center(
                  child: FractionallySizedBox(
                    widthFactor: 1.0,
                    child: ElevatedButton(
                      onPressed: () {
                        model.navigateToHomeScreen();
                      },
                      child: const Text(
                        'Sign In',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w700,
                          fontStyle: FontStyle.normal,
                          color: AppColors.whiteColor,
                        ),
                      ),
                      style: ElevatedButton.styleFrom(
                        padding: EdgeInsets.only(top: 15.0, bottom: 15.0),
                        primary: AppColors.zuriPrimaryColor,
                      ),
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Don\'t have an account?'),
                    TextButton(
                      onPressed: () => model.navigateToSignUpScreen(),
                      child: Text(
                        'Sign Up',
                        style: TextStyle(color: AppColors.zuriPrimaryColor),
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
