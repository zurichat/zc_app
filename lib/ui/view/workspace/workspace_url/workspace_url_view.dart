import 'package:flutter/material.dart';
import 'package:hng/ui/shared/shared.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_hooks/stacked_hooks.dart';

import 'workspace_url_viewmodel.dart';

class WorkspaceUrlView extends StatelessWidget {
  const WorkspaceUrlView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<WorkspaceUrlViewModel>.nonReactive(
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
                          child: Text.rich(
                            TextSpan(
                              children: [
                                TextSpan(
                                  text:
                                      'If you don\'t know your workspace URL, we have sent an email to ',
                                  style: TextStyle(
                                      fontWeight: FontWeight.w400,
                                      fontSize: 16),
                                ),
                                TextSpan(
                                  text: '${model.email}',
                                  style: TextStyle(
                                    fontWeight: FontWeight.w400,
                                    fontSize: 16,
                                    color: AppColors.appBarGreen,
                                  ),
                                ),
                                TextSpan(
                                  text: ' to help you sign in easily.',
                                  style: TextStyle(
                                      fontWeight: FontWeight.w400,
                                      fontSize: 16),
                                ),
                              ],
                            ),
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
      viewModelBuilder: () => WorkspaceUrlViewModel(),
    );
  }
}

class TextForm extends HookViewModelWidget<WorkspaceUrlViewModel> {
  TextForm({Key? key}) : super(key: key, reactive: false);
  @override
  Widget buildViewModelWidget(
      BuildContext context, WorkspaceUrlViewModel model) {
    return Center(
      child: TextField(
        decoration: InputDecoration(
          labelText: 'Enter workspace URL',
          hintText: 'https://workspace.zuri.com',
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

class NextButton extends ViewModelWidget<WorkspaceUrlViewModel> {
  NextButton({Key? key}) : super(key: key, reactive: true);

  @override
  Widget build(BuildContext context, WorkspaceUrlViewModel model) {
    return TextButton(
        style: ButtonStyle(
            backgroundColor:
                MaterialStateProperty.all<Color>(model.buttonColors)),
        onPressed: () => model.signInToWorkspace(),
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
