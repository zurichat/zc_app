import 'package:flutter/material.dart';
import 'package:zurichat/utilities/constants/app_strings.dart';
import 'package:zurichat/utilities/constants/text_styles.dart';
import 'package:zurichat/utilities/constants/ui_helpers.dart';
import 'package:zurichat/ui/shared/dumb_widgets/zuri_loader.dart';
import 'package:zurichat/utilities/internationalization/app_localization.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked/stacked_annotations.dart';

import '../../shared/dumb_widgets/custom_textfield.dart';
import '../../../utilities/constants/colors.dart';
import '../../shared/dumb_widgets/long_button.dart';

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
    final bool _dark = Theme.of(context).brightness == Brightness.dark;
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
                      style: _dark
                          ? AppTextStyle.whiteSize20Bold
                          : AppTextStyle.darkGreySize20Bold,
                    ),
                  ),
                  UIHelper.verticalSpaceSmall,
                  Text(
                    local!.welcomeSignIn,
                    textAlign: TextAlign.center,
                    style: _dark
                        ? AppTextStyle.whiteSize14
                        : AppTextStyle.lightGreySize14,
                  ),
                  UIHelper.customVerticalSpace(38.0),
                  Text(
                    local.emailAddress,
                    style: _dark
                        ? AppTextStyle.whiteSize16Bold
                        : AppTextStyle.darkGreySize16Bold,
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
                    style: _dark
                        ? AppTextStyle.whiteSize16Bold
                        : AppTextStyle.darkGreySize16Bold,
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
                        style: _dark
                            ? AppTextStyle.whiteSize14
                            : AppTextStyle.darkGreySize14,
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
