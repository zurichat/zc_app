import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hng/ui/shared/shared.dart';
import 'otp_viewmodel.dart';
import 'package:stacked/stacked.dart';

class OtpView extends StatefulWidget {
  const OtpView({Key? key}) : super(key: key);

  @override
  _OtpViewState createState() => _OtpViewState();
}

class _OtpViewState extends State<OtpView> {
  FocusNode? pin1FocusNode;
  FocusNode? pin2FocusNode;
  FocusNode? pin3FocusNode;
  FocusNode? pin4FocusNode;

  @override
  void initState() {
    super.initState();
    pin1FocusNode = FocusNode();
    pin2FocusNode = FocusNode();
    pin3FocusNode = FocusNode();
    pin4FocusNode = FocusNode();
  }

  @override
  void dispose() {
    super.dispose();
    pin1FocusNode!.dispose();
    pin2FocusNode!.dispose();
    pin3FocusNode!.dispose();
    pin4FocusNode!.dispose();
  }

  void otpPassField(String value, FocusNode? focusNode) {
    if (value.length == 1) {
      focusNode!.requestFocus();
    }
    if (value.length == 0) {
      focusNode!.previousFocus();
    }
  }

  @override
  Widget build(BuildContext context) {
    RoundedRectangleBorder roundedBorder() {
      return RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(6),
          side: BorderSide(color: AppColors.greenColor));
    }

    OutlineInputBorder outlineInputBorder() {
      return OutlineInputBorder(
          borderRadius: BorderRadius.circular((7.0)),
          borderSide: BorderSide(color: AppColors.blackColor));
    }

    final  otpDecorator = InputDecoration(
        contentPadding: EdgeInsets.all(screenAwareSize(20, context)),
        focusedBorder: outlineInputBorder(),
        enabledBorder: outlineInputBorder(),
        border: outlineInputBorder());

    TextFormField textFormField(inputFocusNode_1, inputFocusNode_2) {
      return TextFormField(
        maxLines: 1,
        inputFormatters: [LengthLimitingTextInputFormatter(1)],
        style: AppTextStyles.body1Bold,
        textAlign: TextAlign.center,
        focusNode: inputFocusNode_1,
        keyboardType: TextInputType.number,
        obscureText: true,
        cursorColor: AppColors.blackColor,
        decoration: otpDecorator,
        onChanged: (value) => otpPassField(value, inputFocusNode_2),
      );
    }

    return ViewModelBuilder<OtpViewModel>.reactive(
      viewModelBuilder: () => OtpViewModel(),
      builder: (context, model, child) => Scaffold(
        // appBar: AppBar(),
        body: Container(
          child: ListView(children: [
            Column(
              children: [
                Padding(
                  padding: EdgeInsets.only(
                      top: screenAwareSize(70, context),
                      bottom: screenAwareSize(5, context)),
                  child: Center(
                      child: Image.asset(
                    'assets/logo/zuri_logo.png',
                    height: screenAwareSize(85, context),
                    width: screenAwareSize(85, context),
                  )),
                ),
                Padding(
                  padding: EdgeInsets.only(bottom: screenAwareSize(7, context)),
                  child: Center(
                      child: Text('Forgot Password',
                          style: AppTextStyles.heading7)),
                ),
                Padding(
                  padding:
                      EdgeInsets.only(bottom: screenAwareSize(25, context)),
                  child: Center(
                      child: Text(
                    'Enter the 4-digit OTP sent to your email',
                    style: AppTextStyles.body1Regular,
                  )),
                ),
                Form(
                    child: Padding(
                  padding: EdgeInsets.symmetric(
                      vertical: screenAwareSize(10, context),
                      horizontal: screenAwareSize(75, context)),
                  child: Column(
                    children: [
                      SizedBox(
                        height: screenAwareSize(50, context),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            SizedBox(
                              width: screenAwareSize(50, context),
                              height: screenAwareSize(50, context),
                              child:
                                  textFormField(pin1FocusNode, pin2FocusNode),
                            ),
                            SizedBox(
                              width: screenAwareSize(50, context),
                              height: screenAwareSize(50, context),
                              child:
                                  textFormField(pin2FocusNode, pin3FocusNode),
                            ),
                            SizedBox(
                              width: screenAwareSize(50, context),
                              height: screenAwareSize(50, context),
                              child:
                                  textFormField(pin3FocusNode, pin4FocusNode),
                            ),
                            SizedBox(
                              width: screenAwareSize(50, context),
                              height: screenAwareSize(50, context),
                              child:
                                  textFormField(pin4FocusNode, pin4FocusNode),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                )),
                Padding(
                  padding: EdgeInsets.only(
                      top: screenAwareSize(7, context),
                      bottom: screenAwareSize(15, context)),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('Didn\'t receive any code?',
                          style: AppTextStyles.body1Regular),
                      TextButton(
                          onPressed: () {
                            //navigation.navigateTo(Routes.homeView);
                          },
                          child: Text('Resend',
                              style: AppTextStyles.textButtonText)),
                    ],
                  ),
                ),
                Container(
                  padding: EdgeInsets.symmetric(
                      horizontal: screenAwareSize(30, context)),
                  height: screenAwareSize(35, context),
                  width: double.infinity,
                  child: MaterialButton(
                      shape: roundedBorder(),
                      color: AppColors.greenColor,
                      onPressed: () {
                        model.navigatorToHome();
                      },
                      child: Text(
                        'Continue',
                        style: AppTextStyles.buttonText,
                      )),
                ),
              ],
            ),
          ]),
        ),
      ),
    );
  }
}
