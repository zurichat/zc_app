import 'package:flutter/material.dart';
import 'package:hng/constants/app_strings.dart';
import 'package:hng/utilities/internalization/localization/app_localization.dart';
import '../../../shared/colors.dart';
import '../../../shared/long_button.dart';
import '../../../shared/text_field.dart';
import '../../../shared/ui_helpers.dart';
import 'package:stacked/stacked.dart';

import 'create_organization_viewmodel.dart';

class CompanyPage extends ViewModelWidget<CreateOrganizationViewModel> {
  final PageController pageController;
  const CompanyPage({
    Key? key,
    required this.pageController,
  }) : super(key: key);

  void next() {
    pageController.nextPage(
      duration: const Duration(seconds: 1),
      curve: Curves.ease,
    );
  }

  @override
  Widget build(BuildContext context, CreateOrganizationViewModel viewModel) {
    final local = AppLocalization.of(context);
    return LayoutBuilder(
      builder: (context, constraint) {
        return SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: ConstrainedBox(
              constraints: BoxConstraints(
                minHeight: constraint.maxHeight - 20 - kToolbarHeight,
              ),
              child: IntrinsicHeight(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    const Spacer(),
                    Container(
                      alignment: Alignment.center,
                      padding: const EdgeInsets.symmetric(vertical: 20),
                      child: Text(
                        local!.companyName,
                        style: const TextStyle(
                          letterSpacing: 0.5,
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    BorderTextField(
                      hint: CompanyNameHint,
                      onChanged: (val) => viewModel.updateData(comp: val),
                    ),
                    UIHelper.verticalSpaceMedium,
                    LongButton(
                        onPressed: () async {
                          final res = await viewModel.onCompanyNext();
                          if (res) next();
                        },
                        label: local.next),
                    const SizedBox(height: 15),
                    Text.rich(
                      TextSpan(
                        children: [
                          TextSpan(
                            text: local.tnC1,
                            style: const TextStyle(
                              fontWeight: FontWeight.w400,
                              fontSize: 16,
                            ),
                          ),
                          TextSpan(
                            text: local.tnC2,
                            style: const TextStyle(
                              fontWeight: FontWeight.w400,
                              fontSize: 16,
                              color: AppColors.zuriPrimaryColor,
                            ),
                          ),
                          TextSpan(
                            text: local.companyAnd,
                            style: const TextStyle(
                              fontWeight: FontWeight.w400,
                              fontSize: 16,
                            ),
                          ),
                          TextSpan(
                            text: local.cookiePolicy,
                            style: const TextStyle(
                              fontWeight: FontWeight.w400,
                              fontSize: 16,
                              color: AppColors.zuriPrimaryColor,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8.0),
                      child: CheckboxListTile(
                        contentPadding: EdgeInsets.zero,
                        activeColor: AppColors.zuriPrimaryColor,
                        value: viewModel.checkBoxVal,
                        onChanged: viewModel.onCheckBoxChanged,
                        controlAffinity: ListTileControlAffinity.leading,
                        title: Text(
                          local.customerAgreementText,
                          style: const TextStyle(
                            fontSize: 15,
                          ),
                        ),
                      ),
                    ),
                    const Spacer(flex: 3),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
