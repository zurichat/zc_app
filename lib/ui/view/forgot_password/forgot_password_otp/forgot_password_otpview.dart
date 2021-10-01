import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:hng/app/app.logger.dart';
import 'package:hng/constants/app_strings.dart';
import 'package:hng/ui/shared/colors.dart';
import 'package:hng/ui/shared/shared.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked/stacked_annotations.dart';

// GENERATED IMPORTS -- DO NOT SIMPLY EDIT.
import 'forgot_password_otp.form.dart';
import 'forgot_password_otpviewmodel.dart';

class ForgotPasswordOtpView extends StatelessWidget
    with $ForgotPasswordOtpView {
  final log = getLogger('ForgotPasswordOtpView');

  ForgotPasswordOtpView({Key? key}) : super(key: key);

  //stacked forms handling
  @FormView(
    fields: [
      FormTextField(name: 'otp'),
    ],
  )
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<ForgotPasswordOtpViewModel>.reactive(
      onModelReady: (model) => listenToFormUpdated(model),
      builder: (context, model, child) => Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: AppColors.whiteColor,
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(20.0, 20.0, 20.0, 0),
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const SizedBox(
                    height: 6.0,
                  ),
                  Container(
                    alignment: Alignment.center,
                    child: Image.asset(ZuriLogo),
                  ),
                  const SizedBox(
                    height: 24.0,
                  ),
                  const Center(
                    child: Text(
                      ForgotPassword,
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 20.0,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 6.0,
                  ),
                  const Center(
                    child: Text(
                      EnterOTP,
                    ),
                  ),
                  const SizedBox(
                    height: 49.0,
                  ),
                  Form(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        vertical: 8.0,
                        horizontal: 30,
                      ),
                      child: PinCodeTextField(
                        appContext: context,
                        pastedTextStyle: const TextStyle(
                          color: AppColors.zuriPrimaryColor,
                          fontWeight: FontWeight.bold,
                        ),
                        validator: (value) {},
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
                        animationDuration: const Duration(milliseconds: 300),
                        enableActiveFill: true,
                        controller: otpController,
                        keyboardType: TextInputType.number,
                        boxShadows: const [
                          BoxShadow(
                            offset: Offset(0, 1),
                            color: Colors.black12,
                            blurRadius: 10,
                          )
                        ],
                        onCompleted: (value) {},
                        onTap: () {},
                        onChanged: (value) {},
                        beforeTextPaste: (text) {
                          log.i('Allowing to paste $text');
                          //if you return true then it will show the paste
                          //confirmation dialog. Otherwise if false,
                          //then nothing will happen.
                          //but you can show anything you want here,
                          //like your pop up saying wrong paste format or etc
                          return true;
                        },
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10.0,
                  ),
                  Center(
                    child: RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text: DidntRecieveOTP,
                            style: AppTextStyles.normalText.copyWith(
                              color: Colors.black,
                            ),
                          ),
                          TextSpan(
                            text: Resend,
                            style: AppTextStyles.body2Bold.copyWith(
                              color: Colors.blue,
                              decoration: TextDecoration.underline,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 40.0,
                  ),
                  Center(
                    child: FractionallySizedBox(
                      widthFactor: 1.0,
                      child: ElevatedButton(
                        // onPressed: () => model.navigateToNewPassword(),
                        onPressed: () {},
                        child: Text(
                          Continue,
                          style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w700,
                              fontStyle: FontStyle.normal,
                              color: Color(0xffFFFFFF)),
                        ),
                        style: ElevatedButton.styleFrom(
                          padding:
                              const EdgeInsets.only(top: 15.0, bottom: 15.0),
                          primary: const Color(0xff00B87C),
                        ),
                        // onPressed: () => model.verifyOtpCode(),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
      viewModelBuilder: () => ForgotPasswordOtpViewModel(),
    );
  }
}
