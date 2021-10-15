import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hng/constants/app_strings.dart';
import 'package:hng/general_widgets/custom_textfield.dart';
import 'package:hng/ui/shared/long_button.dart';
import 'package:hng/ui/shared/text_styles.dart';

import 'package:hng/ui/shared/zuri_loader.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked/stacked_annotations.dart';

import '../../shared/colors.dart';

import '../../shared/shared.dart';

import 'sign_up_view.form.dart';
import 'sign_up_viewmodel.dart';

//stacked forms handling
@FormView(
  fields: [
    FormTextField(name: 'email'),
    FormTextField(name: 'firstName'),
    FormTextField(name: 'lastName'),
    FormTextField(name: 'displayName'),
    FormTextField(name: 'password'),
    FormTextField(name: 'confirmPassword'),
    FormTextField(name: 'phoneNumber'),
  ],
)
class SignUpView extends StatelessWidget with $SignUpView {
  SignUpView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<SignUpViewModel>.reactive(
      //listenToFormUpdated automatically syncs text
      // from TextFields to the viewmodel
      onModelReady: (model) => listenToFormUpdated(model),
      disposeViewModel: false,
      initialiseSpecialViewModelsOnce: true,
      viewModelBuilder: () => SignUpViewModel(),
      builder: (context, model, child) {
        return ModalProgressHUD(
          inAsyncCall: model.isLoading,
          color: AppColors.whiteColor,
          progressIndicator: const ZuriLoader(),
          child: Scaffold(
            body: Center(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      UIHelper.verticalSpaceLarge,
                      Center(
                        child: Image.asset(
                          ZuriLogo,
                          height: 50,
                          width: 50,
                        ),
                      ),
                      UIHelper.customVerticalSpace(24),
                      Center(
                        child: Text(
                          SignUp,
                          style: AppTextStyle.darkGreySize20Bold,
                        ),
                      ),
                      UIHelper.verticalSpaceExtraSmall,
                      Center(
                        child: Text(
                          PleaseSignUp,
                          style: AppTextStyle.lightGreySize14,
                        ),
                      ),
                      UIHelper.customVerticalSpace(48),
                      Text(
                        FirstName,
                        style: AppTextStyle.darkGreySize16Bold,
                      ),
                      UIHelper.customVerticalSpace(10),
                      CustomTextField(
                        keyboardType: TextInputType.name,
                        inputAction: TextInputAction.next,
                        autoCorrect: false,
                        obscureText: false,
                        controller: firstNameController,
                        hintText: FirstNameHintText,
                      ),
                      UIHelper.customVerticalSpace(25),
                      Text(
                        LastName,
                        style: AppTextStyle.darkGreySize16Bold,
                      ),
                      UIHelper.customVerticalSpace(10),
                      CustomTextField(
                        keyboardType: TextInputType.name,
                        inputAction: TextInputAction.next,
                        autoCorrect: false,
                        obscureText: false,
                        controller: lastNameController,
                        hintText: LastNameHintText,
                      ),
                      UIHelper.customVerticalSpace(20),
                      Text(
                        EmailAddress,
                        style: AppTextStyle.darkGreySize16Bold,
                      ),
                      UIHelper.customVerticalSpace(15),
                      CustomTextField(
                        keyboardType: TextInputType.emailAddress,
                        inputAction: TextInputAction.next,
                        autoCorrect: false,
                        obscureText: false,
                        controller: emailController,
                        hintText: EmailHintText,
                      ),
                      UIHelper.customVerticalSpace(25),
                      Text(
                        Password,
                        style: AppTextStyle.darkGreySize16Bold,
                      ),
                      UIHelper.customVerticalSpace(10),
                      CustomTextField(
                        keyboardType: TextInputType.visiblePassword,
                        inputAction: TextInputAction.next,
                        autoCorrect: false,
                        obscureText: true,
                        controller: passwordController,
                        hintText: PasswordHintText,
                      ),
                      UIHelper.customVerticalSpace(25),
                      Text(
                        ConfirmPassword,
                        style: AppTextStyle.darkGreySize16Bold,
                      ),
                      UIHelper.customVerticalSpace(10),
                      CustomTextField(
                        keyboardType: TextInputType.visiblePassword,
                        inputAction: TextInputAction.next,
                        autoCorrect: false,
                        obscureText: true,
                        controller: confirmPasswordController,
                        hintText: ConfirmPasswordHinText,
                      ),
                      UIHelper.verticalSpaceMedium,
                      Row(
                        children: [
                          SizedBox(
                            width: 30,
                            child: Checkbox(
                              value: model.checkBoxValue,
                              onChanged: (newValue) =>
                                  model.updateValue(newValue),
                              fillColor: MaterialStateProperty.all(
                                  AppColors.zuriPrimaryColor),
                            ),
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                TnC1,
                                style: AppTextStyle.lightGreySize12,
                              ),
                              GestureDetector(
                                onTap: () =>
                                    model.navigateToTermsAndConditions(),
                                child: Text(
                                  TnC2,
                                  style: AppTextStyle.termAndConditionStyle,
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                      UIHelper.verticalSpaceLarge,
                      LongButton(
                        onPressed: () => model.createUser(context),
                        label: CreateAccount,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            AlreadyHaveAcct,
                            style: AppTextStyle.darkGreySize14,
                          ),
                          TextButton(
                            child: Text(
                              SignIn,
                              style: AppTextStyle.greenSize14,
                            ),
                            onPressed: () => model.navigateToSignIn(),
                          )
                        ],
                      ),
                      Center(
                        child: Text(
                          Or,
                          style: AppTextStyle.darkGreySize16,
                        ),
                      ),
                      UIHelper.verticalSpaceMedium,
                      Container(
                        padding: const EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(4),
                          border: Border.all(
                            color:
                                Theme.of(context).textTheme.bodyText1!.color ??
                                    AppColors.zuriPrimaryColor,
                            width: 1,
                          ),
                        ),
                        child: InkWell(
                          onTap: () {},
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.asset(
                                GoogleLogo,
                                height: 24,
                                width: 24,
                              ),
                              UIHelper.customHorizontalSpace(12.0),
                              Text(
                                SignUpGoogle,
                                style: AppTextStyle.darkGreySize16Bold,
                              ),
                            ],
                          ),
                        ),
                      ),
                      UIHelper.verticalSpaceLarge,
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
