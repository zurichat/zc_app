import 'package:flutter/material.dart';
import 'package:hng/general_widgets/custom_textfield.dart';
import 'package:hng/ui/shared/colors.dart';
import 'package:stacked/stacked.dart';
import 'forgot_password_email_viewmodel.dart';

class ForgotPasswordEmailView extends StatefulWidget {
  const ForgotPasswordEmailView({Key? key}) : super(key: key);

  @override
  State<ForgotPasswordEmailView> createState() =>
      _ForgotPasswordEmailViewState();
}

class _ForgotPasswordEmailViewState extends State<ForgotPasswordEmailView> {
  final validateKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<ForgotPasswordEmailViewModel>.reactive(
      viewModelBuilder: () => ForgotPasswordEmailViewModel(),
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
                    'Please enter the email used in registering',
                  ),
                ),
                SizedBox(
                  height: 4.0,
                ),
                Center(
                  child: Text(
                    'this account',
                  ),
                ),
                SizedBox(
                  height: 49.0,
                ),
                Form(
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  key: validateKey,
                  child: CustomTextField(
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    validator: (val) {
                      if (RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_"
                              r"`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                          .hasMatch(val!)) {
                        return null;
                      } else {
                        return 'Invalid Email Address';
                      }
                    },
                    keyboardType: TextInputType.emailAddress,
                    inputAction: TextInputAction.done,
                    autoCorrect: true,
                    obscureText: false,
                    labelText: 'Email',
                    hintText: 'Name@gmail.com',
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
                        if (validateKey.currentState!.validate()) {
                          return model.navigateToOtp();
                        }
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
    );
  }
}
