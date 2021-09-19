import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:hng/ui/shared/colors.dart';
import 'package:hng/ui/shared/shared.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:stacked/stacked.dart';

import 'forgot_password_otpviewmodel.dart';

class ForgotPasswordOtpView extends StatelessWidget {
  const ForgotPasswordOtpView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<ForgotPasswordOtpViewModel>.reactive(
      builder: (context, model, child) => ModalProgressHUD(
        inAsyncCall: model.isLoading,
        color: AppColors.whiteColor,
        progressIndicator: CircularProgressIndicator(
          color: AppColors.zuriPrimaryColor,
        ),
        child: Scaffold(
          resizeToAvoidBottomInset: false,
          backgroundColor: AppColors.whiteColor,
          body: SafeArea(
            child: Padding(
              padding: EdgeInsets.fromLTRB(20.0, 20.0, 20.0, 0),
              child: SingleChildScrollView(
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
                        'Enter the 6-digit OTP sent to your email',
                      ),
                    ),
                    SizedBox(
                      height: 49.0,
                    ),
                    Form(
                      key: model.formKey,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 8.0, horizontal: 30),
                        child: PinCodeTextField(
                          appContext: context,
                          pastedTextStyle: TextStyle(
                            color: AppColors.zuriPrimaryColor,
                            fontWeight: FontWeight.bold,
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'OTP code must be entered!';
                            }
                            return null;
                          },
                          length: 6,
                          blinkWhenObscuring: true,
                          animationType: AnimationType.fade,
                          pinTheme: PinTheme(
                            selectedColor: AppColors.zuriPrimaryColor,
                            selectedFillColor: AppColors.zuriPrimaryColor,
                            shape: PinCodeFieldShape.box,
                            activeColor: AppColors.zuriPrimaryColor,
                            disabledColor: Colors.grey,
                            inactiveColor: Colors.white,
                            inactiveFillColor: AppColors.whiteColor,
                            borderRadius: BorderRadius.circular(5),
                            fieldHeight: 50,
                            fieldWidth: 50,
                            activeFillColor: Colors.white,
                          ),
                          cursorColor: AppColors.zuriPrimaryColor,
                          animationDuration: Duration(milliseconds: 300),
                          enableActiveFill: true,
                          errorAnimationController: model.errorController,
                          controller: model.otpController,
                          keyboardType: TextInputType.number,
                          boxShadows: [
                            BoxShadow(
                              offset: Offset(0, 1),
                              color: Colors.black12,
                              blurRadius: 10,
                            )
                          ],
                          onCompleted: (v) {},
                          onTap: () {},
                          onChanged: (value) {},
                          beforeTextPaste: (text) {
                            print("Allowing to paste $text");
                            //if you return true then it will show the paste confirmation dialog. Otherwise if false, then nothing will happen.
                            //but you can show anything you want here, like your pop up saying wrong paste format or etc
                            return true;
                          },
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 10.0,
                    ),
                    Center(
                      child: RichText(
                        text: TextSpan(
                          children: [
                            TextSpan(
                              text: 'Didn\'t receive any code? ',
                              style: AppTextStyles.normalText.copyWith(
                                color: Colors.black,
                              ),
                            ),
                            TextSpan(
                              text: 'Resend',
                              style: AppTextStyles.body2Bold.copyWith(
                                color: Colors.blue,
                                decoration: TextDecoration.underline,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 40.0,
                    ),
                    Center(
                      child: FractionallySizedBox(
                        widthFactor: 1.0,
                        child: ElevatedButton(
                          onPressed: () => model.verifyOtpCode(context),
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
      ),
      viewModelBuilder: () => ForgotPasswordOtpViewModel(),
    );
  }
}
