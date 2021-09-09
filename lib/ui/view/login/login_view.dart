import 'package:flutter/material.dart';
// import '../forgot_password/forgot_password_view.dart';
import 'package:stacked/stacked.dart';

import '../../../general_widgets/custom_textfield.dart';
import '../../shared/colors.dart';
import '../../shared/styles.dart';
import 'login_viewmodel.dart';

class LoginView extends StatelessWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<LoginViewModel>.reactive(
      viewModelBuilder: () => LoginViewModel(),
      builder: (context, model, child) => Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: AppColors.whiteColor,
        body: Padding(
          padding: EdgeInsets.fromLTRB(16.0, 20.0, 16.0, 0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              SizedBox(
                height: 57.0,
              ),
              Container(
                alignment: Alignment.center,
                child: Image.asset('assets/logo/zuri_chat_logo.png'),
              ),
              SizedBox(
                height: 24.23,
              ),
              Center(
                  child: Text(
                'Sign In',
                style: AppTextStyles.heading7,
              )),
              SizedBox(
                height: 4.0,
              ),
              SizedBox(
                height: 4.0,
              ),
              const CustomTextField(
                keyboardType: TextInputType.emailAddress,
                inputAction: TextInputAction.next,
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
                      'Register',
                      style: TextStyle(color: AppColors.zuriPrimaryColor),
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
