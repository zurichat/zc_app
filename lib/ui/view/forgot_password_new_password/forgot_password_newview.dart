import 'package:flutter/material.dart';
import 'package:hng/general_widgets/custom_textfield.dart';
import 'package:hng/ui/shared/colors.dart';
import 'package:stacked/stacked.dart';

import 'forgot_password_newviewmodel.dart';

class ForgotPasswordNewView extends StatefulWidget {
  const ForgotPasswordNewView({Key? key}) : super(key: key);

  @override
  State<ForgotPasswordNewView> createState() => _ForgotPasswordNewViewState();
}

class _ForgotPasswordNewViewState extends State<ForgotPasswordNewView> {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<ForgotPasswordNewViewModel>.reactive(
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
                    key: model.validateKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CustomTextField(
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          validator: (val) {
                            if (model.newPasswordController.text.isEmpty) {
                              return 'Field cannot be empty';
                            } else if (model
                                .newPasswordController.text.isNotEmpty) {
                              return null;
                            } else if (val.length < 6) {
                              return 'Password must be atleast 6 characters';
                            } else {
                              return null;
                            }
                          },
                          controller: model.newPasswordController,
                          keyboardType: TextInputType.emailAddress,
                          inputAction: TextInputAction.next,
                          autoCorrect: true,
                          obscureText: true,
                          hintText: 'Enter Password',
                        ),
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
                        CustomTextField(
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          validator: (val) {
                            if (model.newPasswordController.text !=
                                model.reTypePassController.text) {
                              return 'Passwords do not match';
                            } else {
                              return null;
                            }
                          },
                          controller: model.reTypePassController,
                          keyboardType: TextInputType.visiblePassword,
                          inputAction: TextInputAction.done,
                          autoCorrect: true,
                          obscureText: true,
                          hintText: 'Re-enter Password',
                        ),
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
                          setState(() {});
                          if (model.validateKey.currentState!.validate()) {
                            return model.navigateToLogin();
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
      ),
      viewModelBuilder: () => ForgotPasswordNewViewModel(),
    );
  }
}
