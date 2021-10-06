import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hng/constants/app_strings.dart';
import 'package:hng/utilities/enums.dart';
import 'package:stacked/stacked.dart';

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
          child: Container(
            margin: const EdgeInsets.all(19.8),
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  TextField(
                    controller: emailController,
                    decoration: const InputDecoration(
                      labelText: YourEmail,
                      hintText: SampleEmail,
                      hintStyle: TextStyle(
                        color: Color(0xffBEBEBE),
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                      ),
                      border: InputBorder.none,
                      focusedBorder: InputBorder.none,
                      enabledBorder: InputBorder.none,
                      errorBorder: InputBorder.none,
                      disabledBorder: InputBorder.none,
                    ),
                    onChanged: (value) {
                      model.isEmpty = value.isEmpty;
                      model.email = value.trim();
                    },
                  ),
                  const SizedBox(height: 12),
                  const Text(
                    WillSendEmail,
                    style: TextStyle(fontWeight: FontWeight.w400, fontSize: 16),
                  ),
                  const SizedBox(height: 12),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: NextButton(method: method),
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

class NextButton extends ViewModelWidget<UseDifferentEmailViewModel> {
  final OrganizationSwitchMethod method;
  const NextButton({Key? key, required this.method})
      : super(key: key, reactive: true);

  @override
  Widget build(BuildContext context, UseDifferentEmailViewModel viewModel) {
    return TextButton(
      style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all<Color>(
        viewModel.isBusy ? AppColors.greyishColor : AppColors.appBarGreen,
      )),
      onPressed: () => viewModel.onNextTap(method),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(0, 8, 0, 8),
        child: SizedBox(
          width: 300,
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
