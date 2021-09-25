import 'package:flutter/material.dart';
import '../../../shared/shared.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_hooks/stacked_hooks.dart';

import 'organization_url_viewmodel.dart';

class OrganizationUrlView extends StatelessWidget {
  const OrganizationUrlView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<OrganizationUrlViewModel>.nonReactive(
      builder: (context, model, child) => ModalProgressHUD(
        inAsyncCall: model.isBusy,
        color: AppColors.whiteColor,
        progressIndicator: CircularProgressIndicator(
          color: AppColors.zuriPrimaryColor,
        ),
        child: Scaffold(
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
                                    text: '''
If you don\'t know your Organization URL, we have sent an email to ''',
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
      ),
      viewModelBuilder: () => OrganizationUrlViewModel(),
    );
  }
}

class TextForm extends HookViewModelWidget<OrganizationUrlViewModel> {
  TextForm({Key? key}) : super(key: key, reactive: false);
  @override
  Widget buildViewModelWidget(
      BuildContext context, OrganizationUrlViewModel model) {
    return Center(
      child: TextField(
        decoration: InputDecoration(
          labelText: 'Enter Organization URL',
          hintText: 'https://organization.zuri.com',
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

class NextButton extends ViewModelWidget<OrganizationUrlViewModel> {
  NextButton({Key? key}) : super(key: key, reactive: true);

  @override
  Widget build(BuildContext context, OrganizationUrlViewModel model) {
    return TextButton(
        style: ButtonStyle(
            backgroundColor:
                MaterialStateProperty.all<Color>(model.buttonColors)),
        onPressed: () => model.signInToOrganization(),
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
