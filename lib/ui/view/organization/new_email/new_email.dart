import 'package:flutter/material.dart';
import 'package:hng/constants/app_strings.dart';
import 'package:hng/ui/shared/text_styles.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_hooks/stacked_hooks.dart';

import '../../../shared/shared.dart';
import 'new_email_viewmodel.dart';

class NewEmailView extends StatelessWidget {
  const NewEmailView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<NewEmailViewModel>.nonReactive(
      builder: (context, viewModel, child) => Scaffold(
        body: SafeArea(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 300),
                    child: Column(
                      children: const [
                        TextForm(),
                        SizedBox(height: 12),
                        Text(
                          WillSendEmail,
                          style: TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: 16,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 12),
                  const NextButton()
                ],
              ),
            ),
          ),
        ),
      ),
      viewModelBuilder: () => NewEmailViewModel(),
    );
  }
}

class TextForm extends HookViewModelWidget<NewEmailViewModel> {
  const TextForm({Key? key}) : super(key: key, reactive: false);
  @override
  Widget buildViewModelWidget(
      BuildContext context, NewEmailViewModel viewModel) {
    return Center(
      child: TextField(
        decoration: const InputDecoration(
          labelText: YourEmail,
          hintText: YourEmail,
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
          viewModel.updateString(value);
        },
      ),
    );
  }
}

class NextButton extends ViewModelWidget<NewEmailViewModel> {
  const NextButton({Key? key}) : super(key: key, reactive: true);

  @override
  Widget build(BuildContext context, NewEmailViewModel viewModel) {
    return TextButton(
        style: ButtonStyle(
            backgroundColor:
                MaterialStateProperty.all<Color>(viewModel.text.isEmpty

                    //TODO Change to brand colors
                    ? const Color(0xffBEBEBE)
                    : AppColors.appBarGreen)),
        onPressed: () {},
        child: Padding(
          padding: const EdgeInsets.fromLTRB(0, 8, 0, 8),
          child: SizedBox(
            width: 300,
            child: Center(
              child: Text(
                Next,
                style: AppTextStyle.whiteSize16,
              ),
            ),
          ),
        ));
  }
}
