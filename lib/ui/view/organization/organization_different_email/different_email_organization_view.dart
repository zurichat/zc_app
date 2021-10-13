import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:stacked/stacked.dart';
import 'package:zurichat/constants/app_strings.dart';
import 'package:zurichat/ui/shared/text_field.dart';
import 'package:zurichat/utilities/enums.dart';

import '../../../shared/shared.dart';
import 'different_email_organization_viewmodel.dart';

class UseDifferentEmailView extends HookWidget {
  final OrganizationSwitchMethod method;

  const UseDifferentEmailView({Key? key, required this.method})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final emailController = useTextEditingController();

    return ViewModelBuilder<UseDifferentEmailViewModel>.nonReactive(
        viewModelBuilder: () => UseDifferentEmailViewModel(),
        builder: (context, model, child) => Scaffold(
              body: SafeArea(
                child: Padding(
                  padding: const EdgeInsets.all(25.0),
                  child: Center(
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Spacer(),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              BorderLessTextField(
                                labelColor: AppColors.inactiveGreyColor,
                                onChanged: model.updateScreen,
                                controller: emailController,
                                label: YourEmail,
                              ),
                              const SizedBox(height: 8),
                              const Text(
                                WillSendEmail,
                              ),
                              const SizedBox(height: 12),
                              const Text(
                                WillSendEmail,
                                style: TextStyle(
                                    fontWeight: FontWeight.w400, fontSize: 16),
                              ),
                              const SizedBox(height: 25),
                              const Spacer(flex: 3),
                              Align(
                                alignment: Alignment.bottomCenter,
                                child: NextButton(method: method),
                              ),
                              const Spacer(),
                            ],
                          ),
                        ]),
                  ),
                ),
              ),
            ));
  }
}

class NextButton extends ViewModelWidget<UseDifferentEmailViewModel> {
  final OrganizationSwitchMethod method;
  const NextButton({Key? key, required this.method})
      : super(key: key, reactive: true);

  @override
  Widget build(BuildContext context, UseDifferentEmailViewModel viewModel) {
    return TextButton(
      style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all<Color>(
        viewModel.isEmpty ? AppColors.greyishColor : AppColors.appBarGreen,
      )),
      onPressed: () => viewModel.onNextTap(method),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(0, 8, 0, 8),
        child: SizedBox(
          width: double.infinity,
          child: Center(
            child: Text(
              Next,
              style: AppTextStyles.buttonText,
            ),
          ),
        ),
      ),
    );
  }
}
