import 'package:flutter/material.dart';
import 'package:hng/ui/shared/shared.dart';
import 'package:hng/ui/view/organization/new_email/new_email_viewmodel.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_hooks/stacked_hooks.dart';

class NewEmailView extends StatelessWidget {
  const NewEmailView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<NewEmailViewModel>.nonReactive(
      builder: (context, model, child) => Scaffold(
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
                      children: <Widget>[
                        TextForm(),
                        SizedBox(
                          height: 12,
                        ),
                        Container(
                          child: Text(
                            'We’ll send you an email that will instantly sign you in',
                            style: TextStyle(
                                fontWeight: FontWeight.w400, fontSize: 16),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 12,
                  ),
                  NextButton()
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
  TextForm({Key? key}) : super(key: key, reactive: false);
  @override
  Widget buildViewModelWidget(BuildContext context, NewEmailViewModel model) {
    return Center(
      child: TextField(
        decoration: InputDecoration(
          labelText: 'Your email address',
          hintText: 'Your email address',
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
          model.updateString(value);
        },
      ),
    );
  }
}

class NextButton extends ViewModelWidget<NewEmailViewModel> {
  NextButton({Key? key}) : super(key: key, reactive: true);

  @override
  Widget build(BuildContext context, NewEmailViewModel model) {
    return TextButton(
        style: ButtonStyle(
            backgroundColor:
                MaterialStateProperty.all<Color>(model.text.isEmpty ? Color(0xffBEBEBE) : AppColors.appBarGreen)),
        onPressed: () {},
        child: Padding(
          padding: const EdgeInsets.fromLTRB(0, 8, 0, 8),
          child: Container(
            width: 300,
            child: Center(
              child: Text(
                'Next',
                style: AppTextStyles.buttonText,
              ),
            ),
          ),
        ));
  }
}
