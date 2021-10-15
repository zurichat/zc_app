import 'package:flutter/material.dart';
import 'package:hng/constants/app_strings.dart';
import 'package:hng/ui/shared/text_styles.dart';
import 'package:hng/ui/shared/ui_helpers.dart';
import 'package:hng/ui/shared/zuri_loader.dart';
import 'package:hng/utilities/internalization/localization/app_localization.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked/stacked_annotations.dart';

import '../../../general_widgets/custom_textfield.dart';
import '../../shared/colors.dart';
import '../../shared/long_button.dart';

import 'login_view.form.dart';
import 'login_viewmodel.dart';

//stacked forms handling
@FormView(
  fields: [
    FormTextField(name: 'email'),
    FormTextField(name: 'password'),
  ],
)
class LoginView extends StatelessWidget with $LoginView {
  LoginView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final local = AppLocalization.of(context);
    return ViewModelBuilder<LoginViewModel>.reactive(
      //listenToFormUpdated automatically
      //syncs text from TextFields to the viewmodel
      onModelReady: (model) => listenToFormUpdated(model),
      viewModelBuilder: () => LoginViewModel(),
      builder: (context, model, child) => ModalProgressHUD(
        inAsyncCall: model.isLoading,
        color: AppColors.whiteColor,
        progressIndicator: const ZuriLoader(),
        child: Scaffold(
          resizeToAvoidBottomInset: false,
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(16.0, 20.0, 16.0, 0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  UIHelper.customVerticalSpace(57.0),
                  Container(
                    height: 50,
                    alignment: Alignment.center,
                    child: Image.asset(ZuriLogo),
                  ),
                  UIHelper.customVerticalSpace(24.23),
                  Center(
                    child: Text(
                      SignIn,
                      style: AppTextStyle.darkGreySize20Bold,
                    ),
                  ),
                  UIHelper.verticalSpaceSmall,
                  Text(
                    local!.welcomeSignIn,
                    textAlign: TextAlign.center,
                    style: AppTextStyle.lightGreySize14,
                  ),
                  UIHelper.customVerticalSpace(38.0),
                  Text(
                    local.emailAddress,
                    style: AppTextStyle.darkGreySize16Bold,
                  ),
                  UIHelper.customVerticalSpace(10.0),
                  CustomTextField(
                    keyboardType: TextInputType.emailAddress,
                    inputAction: TextInputAction.next,
                    autoCorrect: false,
                    obscureText: false,
                    hintText: EmailHintText,
                    controller: emailController,
                  ),
                  UIHelper.verticalSpaceMedium,
                  Text(
                    local.password,
                    style: AppTextStyle.darkGreySize16Bold,
                  ),
                  UIHelper.customVerticalSpace(10.0),
                  CustomTextField(
                    keyboardType: TextInputType.visiblePassword,
                    inputAction: TextInputAction.next,
                    autoCorrect: false,
                    obscureText: true,
                    hintText: local.passwordHintText,
                    controller: passwordController,
                  ),
                  Align(
                    alignment: Alignment.centerRight,
                    child: TextButton(
                      style: ButtonStyle(
                        padding: MaterialStateProperty.all(EdgeInsets.zero),
                      ),
                      onPressed: () {
                        //Hides the keyboard for the failure
                        //snackbar to be visible
                        FocusScope.of(context).unfocus();
                        model.navigateToForgotPasswordScreen();
                      },
                      child: Text(
                        local.forgotPassword,
                        style: AppTextStyle.greenSize14,
                      ),
                    ),
                  ),
                  UIHelper.verticalSpaceLarge,
                  Center(
                    child: FractionallySizedBox(
                      widthFactor: 1.0,
                      child: LongButton(
                        onPressed: () async {
                          await model.logInUser();
                        },
                        label: local.signIn,
                      ),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        local.dontHaveAccount,
                        style: AppTextStyle.darkGreySize14,
                      ),
                      TextButton(
                        onPressed: () => model.navigateToSignUpScreen(),
                        child: Text(
                          local.signUp,
                          style: AppTextStyle.greenSize14,
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
