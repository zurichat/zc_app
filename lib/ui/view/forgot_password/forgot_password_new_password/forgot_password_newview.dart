import 'package:flutter/material.dart';
import 'package:zurichat/utilities/constants/app_strings.dart';
import 'package:zurichat/utilities/constants/colors.dart';
import 'package:zurichat/ui/shared/shared.dart';
import 'package:zurichat/utilities/constants/text_styles.dart';
import 'package:zurichat/ui/shared/dumb_widgets/zuri_loader.dart';
import 'package:zurichat/utilities/internationalization/app_localization.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked/stacked_annotations.dart';

// GENERATED IMPORTS -- DO NOT SIMPLY EDIT.
import 'forgot_password_newview.form.dart';
import 'forgot_password_newviewmodel.dart';

@FormView(fields: [
  FormTextField(name: 'newPassword'),
  FormTextField(name: 'confirmPassword')
])
class ForgotPasswordNewView extends StatelessWidget
    with $ForgotPasswordNewView {
  final String otp;
  ForgotPasswordNewView({Key? key, required this.otp}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final local = AppLocalization.of(context);
    return ViewModelBuilder<ForgotPasswordNewViewModel>.reactive(
      onModelReady: (model) => listenToFormUpdated(model),
      builder: (context, model, child) => ModalProgressHUD(
        inAsyncCall: model.isLoading,
        color: AppColors.whiteColor,
        progressIndicator: const ZuriLoader(),
        child: Scaffold(
          body: SafeArea(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(20.0, 20.0, 20.0, 0),
              child: SingleChildScrollView(
                scrollDirection: Axis.vertical,
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
                    Center(
                      child: Text(
                        local!.forgotPassword,
                        style: AppTextStyle.darkGreySize16Bold,
                      ),
                    ),
                    const SizedBox(
                      height: 6.0,
                    ),
                    Center(
                      child: Text(
                        local.newPasswordHeader,
                        textAlign: TextAlign.center,
                      ),
                    ),
                    const SizedBox(
                      height: 49.0,
                    ),
                    Container(
                      margin: const EdgeInsets.symmetric(vertical: 8.0),
                      child: Text(
                        local.newPassword,
                        style: AppTextStyle.darkGreySize16Bold,
                      ),
                    ),
                    Form(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          TextField(
                            controller: newPasswordController,
                            keyboardType: TextInputType.visiblePassword,
                            obscureText: true,
                            textInputAction: TextInputAction.done,
                            autocorrect: true,
                            decoration: InputDecoration(
                              border: const OutlineInputBorder(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(3.0),
                                ),
                              ),
                              hintText: local.passwordHintText,
                              focusedBorder: const OutlineInputBorder(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(5.0),
                                ),
                                borderSide: BorderSide(
                                  color: AppColors.zuriPrimaryColor,
                                ),
                              ),
                            ),
                            // onChanged: model.submitEmail,
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
                                    local.passwordLengthWarning,
                                    style: AppTextStyle.errorSize14,
                                  ),
                                ],
                              ),
                            ),
                          ),

                          //Changes  ss
                          const SizedBox(
                            height: 15.0,
                          ),
                          Container(
                            margin: const EdgeInsets.symmetric(vertical: 8.0),
                            child: Text(
                              local.confirmPassword,
                              style: AppTextStyle.darkGreySize16Bold,
                            ),
                          ),
                          TextField(
                            controller: confirmPasswordController,
                            keyboardType: TextInputType.visiblePassword,
                            obscureText: true,
                            textInputAction: TextInputAction.done,
                            autocorrect: true,
                            decoration: InputDecoration(
                              border: const OutlineInputBorder(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(3.0),
                                ),
                              ),
                              hintText: local.confirmPasswordHinText,
                              focusedBorder: const OutlineInputBorder(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(5.0),
                                ),
                                borderSide: BorderSide(
                                  color: AppColors.zuriPrimaryColor,
                                ),
                              ),
                            ),
                            //  onChanged: model.submitEmail,
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
                                    local.passwordMustMatch,
                                    style: AppTextStyle.errorSize14,
                                  ),
                                ],
                              ),
                            ),
                          ),

                          //Changes  ss
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 30.0,
                    ),
                    Center(
                      child: FractionallySizedBox(
                        widthFactor: 1.0,
                        child: ElevatedButton(
                          onPressed: () {
                            // model.passwordVerification();
                            model.resetPassword(otp);
                          },
                          child: Text(
                            local.continueButton,
                            style: AppTextStyle.whiteSize16,
                          ),
                          style: ElevatedButton.styleFrom(
                            padding:
                                const EdgeInsets.only(top: 15.0, bottom: 15.0),
                            primary: AppColors.zuriPrimaryColor,
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
      viewModelBuilder: () => ForgotPasswordNewViewModel(),
    );
  }
}
