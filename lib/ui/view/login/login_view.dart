import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

import 'package:hng/ui/view/login/login_viewmodel.dart';
import 'package:hng/general_widgets/custom_textfield.dart';
import 'package:hng/ui/shared/colors.dart';
import 'package:hng/ui/shared/long_button.dart';
import 'package:hng/ui/shared/styles.dart';

class LoginView extends StatelessWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<LoginViewModel>.reactive(
      viewModelBuilder: () => LoginViewModel(),
      builder: (context, model, child) => ModalProgressHUD(
        inAsyncCall: model.isLoading,
        color: AppColors.whiteColor,
        progressIndicator: CircularProgressIndicator(
          color: AppColors.zuriPrimaryColor,
        ),
        child: Scaffold(
          resizeToAvoidBottomInset: false,
          backgroundColor: AppColors.whiteColor,
          body: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.fromLTRB(16.0, 20.0, 16.0, 0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  SizedBox(height: 57.0),
                  Container(
                    alignment: Alignment.center,
                    child: Image.asset('assets/logo/zuri_chat_logo.png'),
                  ),
                  SizedBox(height: 24.23),
                  Center(
                    child: Text(
                      'Sign In',
                      style: AppTextStyles.heading7,
                    ),
                  ),
                  SizedBox(height: 8.0),
                  Text(
                    'Welcome! Sign in to continue',
                    textAlign: TextAlign.center,
                    style: AppTextStyles.faintBodyText,
                  ),
                  SizedBox(height: 38.0),
                  Text(
                    'Email Address',
                    style: AppTextStyles.body1Bold,
                  ),
                  SizedBox(height: 10.0),
                  CustomTextField(
                    keyboardType: TextInputType.emailAddress,
                    inputAction: TextInputAction.next,
                    autoCorrect: false,
                    obscureText: false,
                    hintText: 'Name@gmail.com',
                    controller: model.email,
                  ),
                  SizedBox(height: 16.0),
                  Text(
                    'Password',
                    style: AppTextStyles.body1Bold,
                  ),
                  SizedBox(height: 10.0),
                  CustomTextField(
                    keyboardType: TextInputType.visiblePassword,
                    inputAction: TextInputAction.next,
                    autoCorrect: false,
                    obscureText: true,
                    hintText: 'Enter Password',
                    controller: model.password,
                  ),
                  Align(
                    alignment: Alignment.centerRight,
                    child: TextButton(
                      style: ButtonStyle(
                        padding: MaterialStateProperty.all(EdgeInsets.zero),
                      ),
                      onPressed: () => model.logInUser(context),
                      child: Text(
                        'Forgot Password?',
                        style: TextStyle(
                          color: AppColors.zuriPrimaryColor,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 32.0),
                  Center(
                    child: FractionallySizedBox(
                      widthFactor: 1.0,
                      child: LongButton(
                        onPressed: () async {
                          await model.logInUser(context);
                        },
                        label: 'Sign In',
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
      ),
    );
  }
}
