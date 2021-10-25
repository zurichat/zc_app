import 'package:flutter/material.dart';
import 'package:zurichat/utilities/constants/app_strings.dart';
import 'package:zurichat/utilities/constants/text_styles.dart';
import 'package:zurichat/ui/shared/dumb_widgets/zuri_loader.dart';
import 'package:zurichat/utilities/internationalization/app_localization.dart';
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
    final local = AppLocalization.of(context);
    final bool _dark = Theme.of(context).brightness == Brightness.dark;

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
                                    text: local!.dontKnowWorkspaceUrl,
                                    style: _dark
                                        ? AppTextStyle.whiteSize16
                                        : AppTextStyle.lightGreySize16),
                                TextSpan(
                                  text: '$email',
                                  style: AppTextStyle.lightGreySize16
                                      .copyWith(color: AppColors.appBarGreen),
                                ),
                                TextSpan(
                                  text: local.helpSignInEasily,
                                  style: _dark
                                      ? AppTextStyle.whiteSize16
                                      : AppTextStyle.lightGreySize16,
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
    final local = AppLocalization.of(context);
    final bool _dark = Theme.of(context).brightness == Brightness.dark;
    return Center(
      child: TextField(
        cursorColor: AppColors.appBarGreen,
        style: _dark
            ? AppTextStyle.whiteSize16Bold
            : AppTextStyle.darkGreySize16Bold,
        decoration: InputDecoration(
          labelText: local!.enterWorkSpacesUrl,
          labelStyle: AppTextStyle.greenSize16,
          hintText: EnterOrgUrlHint,
          hintStyle: AppTextStyle.lightGreySize16,
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
    final local = AppLocalization.of(context);
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
              local!.next,
              style: AppTextStyle.darkGreySize16Bold,
            ),
          ),
        ),
      ),
    );
  }
}
