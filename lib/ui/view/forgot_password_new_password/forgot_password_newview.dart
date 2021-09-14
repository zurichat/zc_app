import 'package:flutter/material.dart';
import 'package:hng/general_widgets/custom_textfield.dart';
import 'package:hng/ui/shared/colors.dart';
import 'package:stacked/stacked.dart';

import 'forgot_password_newviewmodel.dart';

class ForgotPasswordNewView extends StatelessWidget {
  const ForgotPasswordNewView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<ForgotPasswordNewViewModel>.reactive(
      builder: (context, model, child) => Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: AppColors.whiteColor,
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.fromLTRB(20.0, 20.0, 20.0, 0),
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
                    style:
                        TextStyle(fontWeight: FontWeight.w500, fontSize: 20.0),
                  ),
                ),
                SizedBox(
                  height: 6.0,
                ),
                Center(
                  child: Text(
                    'Your new password must be different from previously used password',
                    textAlign: TextAlign.center,
                  ),
                ),
                SizedBox(
                  height: 49.0,
                ),
                CustomTextField(
                  keyboardType: TextInputType.emailAddress,
                  inputAction: TextInputAction.next,
                  autoCorrect: true,
                  obscureText: false,
                  labelText: 'Password',
                  hintText: 'Enter Password',
                ),
                SizedBox(
                  height: 30.0,
                ),
                CustomTextField(
                  keyboardType: TextInputType.visiblePassword,
                  inputAction: TextInputAction.done,
                  autoCorrect: true,
                  obscureText: false,
                  labelText: 'Confirm Password',
                  hintText: 'Re-enter Password',
                ),
                SizedBox(
                  height: 30.0,
                ),
                Center(
                  child: FractionallySizedBox(
                    widthFactor: 1.0,
                    child: ElevatedButton(
                      onPressed: () => model.navigateToLogin(),
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
      viewModelBuilder: () => ForgotPasswordNewViewModel(),
    );
  }
}
