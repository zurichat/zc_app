import 'package:flutter/material.dart';
import 'package:zurichat/constants/app_strings.dart';
import 'package:zurichat/ui/shared/zuri_loader.dart';
import '../../../shared/shared.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_hooks/stacked_hooks.dart';

import 'organization_url_viewmodel.dart';

class OrganizationUrlView extends StatelessWidget {
  final String email;
  const OrganizationUrlView({Key? key, required this.email}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<OrganizationUrlViewModel>.nonReactive(
      builder: (context, viewModel, child) => ModalProgressHUD(
        inAsyncCall: viewModel.isBusy,
        color: AppColors.whiteColor,
        progressIndicator: const ZuriLoader(),
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
                          const TextForm(),
                          const SizedBox(
                            height: 12,
                          ),
                          Text.rich(
                            TextSpan(
                              children: [
                                TextSpan(
                                  text: OrgDesc1,
                                  style: AppTextStyles.body3Medium.copyWith(
                                    fontSize: 16,
                                  ),
                                ),
                                TextSpan(
                                  text: '$email',
                                  style: AppTextStyles.body3Medium.copyWith(
                                      fontSize: 16,
                                      color: AppColors.appBarGreen),
                                ),
                                TextSpan(
                                  text: OrgDesc2,
                                  style: AppTextStyles.body3Medium.copyWith(
                                    fontSize: 16,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 12,
                    ),
                    const NextButton()
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
  const TextForm({Key? key}) : super(key: key, reactive: false);

  @override
  Widget buildViewModelWidget(
      BuildContext context, OrganizationUrlViewModel viewModel) {
    return Center(
      child: TextField(
        cursorColor: AppColors.appBarGreen,
        style: AppTextStyles.body3Medium.copyWith(
          fontSize: 16,
          fontWeight: FontWeight.bold,
        ),
        decoration: InputDecoration(
          labelText: EnterOrgUrl,
          labelStyle: AppTextStyles.body3Medium.copyWith(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: AppColors.zuriPrimaryColor,
          ),
          hintText: EnterOrgUrlHint,
          hintStyle: AppTextStyles.body3Medium.copyWith(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: AppColors.zuriGrey),
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

class NextButton extends ViewModelWidget<OrganizationUrlViewModel> {
  const NextButton({Key? key}) : super(key: key, reactive: true);

  @override
  Widget build(BuildContext context, OrganizationUrlViewModel viewModel) {
    return TextButton(
      style: ButtonStyle(
          backgroundColor:
              MaterialStateProperty.all<Color>(viewModel.buttonColors)),
      onPressed: () => viewModel.signInToOrganization(),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(0, 8, 0, 8),
        child: SizedBox(
          width: MediaQuery.of(context).size.width,
          child: Center(
            child: Text(
              Next,
              style: AppTextStyles.buttonText.copyWith(
                  color: viewModel.buttonTextColor,
                  fontWeight: FontWeight.bold),
            ),
          ),
        ),
      ),
    );
  }
}
