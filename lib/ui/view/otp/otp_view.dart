import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked/stacked_annotations.dart';

import '../../../app/app.logger.dart';
import '../../shared/colors.dart';
import '../../shared/shared.dart';
import 'otp_view.form.dart';
import 'otp_viewmodel.dart';

//stacked forms handling
@FormView(
  fields: [
    FormTextField(name: 'otp'),
  ],
)
class OTPView extends StatelessWidget with $OTPView {
  final log = getLogger('OTPView');

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<OTPViewModel>.reactive(
      //listenToFormUpdated automatically syncs text
      //from TextFields to the viewmodel
      onModelReady: (model) => listenToFormUpdated(model),
      viewModelBuilder: () => OTPViewModel(),
      staticChild: OTPViewModel.init(),
      builder: (context, model, child) => ModalProgressHUD(
        inAsyncCall: model.isLoading,
        color: AppColors.whiteColor,
        progressIndicator: const CircularProgressIndicator(
          color: AppColors.zuriPrimaryColor,
        ),
        child: Scaffold(
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
                    const SizedBox(height: 6.0),
                    Container(
                      alignment: Alignment.center,
                      child: Image.asset('assets/logo/zuri_chat_logo.png'),
                    ),
                    const SizedBox(
                      height: 24.0,
                    ),
                    const Center(
                      child: Text(
                        'One-Time Password',
                        style: TextStyle(
                            fontWeight: FontWeight.w500, fontSize: 20.0),
                      ),
                    ),
                    const SizedBox(
                      height: 6.0,
                    ),
                    const Center(
                      child: Text(
                        'Enter the 6-digit OTP sent to your email',
                      ),
                    ),
                    const SizedBox(
                      height: 49.0,
                    ),
                    Form(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 8.0, horizontal: 30),
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
                            fieldHeight: 40,
                            fieldWidth: 40,
                            activeFillColor: Colors.white,
                          ),
                          cursorColor: AppColors.zuriPrimaryColor,
                          animationDuration: const Duration(milliseconds: 300),
                          enableActiveFill: true,
                          controller: otpController,
                          keyboardType: TextInputType.number,
                          boxShadows: [
                            const BoxShadow(
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
                            //if you return true then it will show the
                            //paste confirmation dialog. Otherwise if
                            // false, then nothing will happen.
                            //but you can show anything you want here,
                            // like your pop up saying wrong paste format or etc
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
                    const SizedBox(
                      height: 40.0,
                    ),
                    Center(
                      child: FractionallySizedBox(
                        widthFactor: 1.0,
                        child: ElevatedButton(
                          onPressed: () => model.verifyOTP(context),
                          child: const Text(
                            'Continue',
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
                        ),
                      ),
                    ),
                    const SizedBox(height: 16),
                    Align(
                      alignment: Alignment.centerRight,
                      child: TextButton(
                        onPressed: () {
                          model.navigateLogin();
                        },
                        child: const Text(
                          'Back to login',
                          style: TextStyle(color: AppColors.zuriPrimaryColor),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
