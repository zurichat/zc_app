import 'package:flutter/material.dart';
import 'package:hng/general_widgets/custom_textfield.dart';
import 'package:hng/ui/shared/colors.dart';
import 'package:hng/ui/shared/shared.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked/stacked_annotations.dart';
import 'forgot_password_email_view.form.dart';
import 'forgot_password_email_viewmodel.dart';

@FormView(fields: [FormTextField(name: 'forgotEmail')])
class ForgotPasswordEmailView extends StatelessWidget
    with $ForgotPasswordEmailView {
  ForgotPasswordEmailView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<ForgotPasswordEmailViewModel>.reactive(
      onModelReady: (model) => listenToFormUpdated(model),
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
                Container(
                  margin: EdgeInsets.symmetric(vertical: 8.0),
                  child: Text(
                    'Email Address',
                    style:
                        TextStyle(fontWeight: FontWeight.w700, fontSize: 16.0),
                  ),
                ),
                Form(
                  child: TextField(
                    controller: forgotEmailController,
                    keyboardType: TextInputType.emailAddress,
                    obscureText: false,
                    textInputAction: TextInputAction.done,
                    autocorrect: true,
                    decoration: InputDecoration(
                      hintText: 'Name@gmail.com',
                    ),
                    onChanged: model.submitEmail,
                  ),
                ),

                ////Changes
                Padding(
                  padding: const EdgeInsets.only(left: 16.0),
                  child: Visibility(
                    visible: model.inputError,
                    child: Column(
                      children: [
                        UIHelper.verticalSpaceSmall,
                        Text(
                          'Error message',
                          style: AppTextStyles.body2Medium.copyWith(
                            color: AppColors.redColor,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),

                //Changes  ss
                SizedBox(
                  height: 30.0,
                ),
                Center(
                  child: FractionallySizedBox(
                    widthFactor: 1.0,
                    child: ElevatedButton(
                      onPressed: () {},
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
                SizedBox(height: 10),
                Center(
                  child: GestureDetector(
                    // onTap: () {
                    //   model.navigateToSignIn();
                    // },
                    child: RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text: 'Back to ',
                            style: AppTextStyles.normalText.copyWith(
                              color: Colors.black,
                            ),
                          ),
                          TextSpan(
                            text: 'Sign In.',
                            style: AppTextStyles.body2Bold.copyWith(
                              color: AppColors.zuriPrimaryColor,
                            ),
                          ),
                        ],
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
