import 'package:flutter/material.dart';
import 'package:hng/constants/app_strings.dart';
import '../../../shared/colors.dart';
import '../../../shared/long_button.dart';
import '../../../shared/text_field.dart';
import '../../../shared/ui_helpers.dart';
import 'package:stacked/stacked.dart';

import 'create_organization_viewmodel.dart';

class CompanyPage extends ViewModelWidget<CreateOrganizationViewModel> {
  final String email;
  const CompanyPage({
    Key? key,
    required this.email,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, CreateOrganizationViewModel viewModel) {
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
                      child: const Text(
                        CompanyName,
                        style: TextStyle(
                          letterSpacing: 0.5,
                          color: AppColors.blackColor,
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    BorderTextField(
                      hint: CompanyNameHint,
                      onChanged: (val) => viewModel.company = val,
                    ),
                    UIHelper.verticalSpaceMedium,
                    LongButton(
                        onPressed: () => viewModel.onCompanyNext(email),
                        label: 'Next'),
                    const SizedBox(height: 15),
                    const Text.rich(
                      TextSpan(
                        children: [
                          TextSpan(
                            text: TnC1,
                            style: TextStyle(
                              fontWeight: FontWeight.w400,
                              fontSize: 16,
                            ),
                          ),
                          TextSpan(
                            text: TnC2,
                            style: TextStyle(
                              fontWeight: FontWeight.w400,
                              fontSize: 16,
                              color: AppColors.zuriPrimaryColor,
                            ),
                          ),
                          TextSpan(
                            text: ' and ',
                            style: TextStyle(
                              fontWeight: FontWeight.w400,
                              fontSize: 16,
                            ),
                          ),
                          TextSpan(
                            text: CookiePolicy,
                            style: TextStyle(
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
                        title: const Text(
                          CustomerAgreementText,
                          style: TextStyle(
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
