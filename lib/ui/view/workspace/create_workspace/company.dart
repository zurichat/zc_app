import 'package:flutter/material.dart';
import 'package:hng/ui/shared/colors.dart';
import 'package:hng/ui/shared/long_button.dart';
import 'package:hng/ui/shared/text_field.dart';
import 'package:hng/ui/shared/ui_helpers.dart';
import 'package:stacked/stacked.dart';

import 'create_workspace_viewmodel.dart';

class CompanyPage extends ViewModelWidget<CreateWorkSpaceViewModel> {
  const CompanyPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, CreateWorkSpaceViewModel model) {
    return LayoutBuilder(
      builder: (context, constraint) {
        return SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(20),
            child: ConstrainedBox(
              constraints: BoxConstraints(
                minHeight: constraint.maxHeight - 20 - kToolbarHeight,
              ),
              child: IntrinsicHeight(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Spacer(),
                    Container(
                      alignment: Alignment.center,
                      padding: EdgeInsets.symmetric(vertical: 20),
                      child: Text(
                        "What's the name of the\ncompany or team?",
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
                      hint: 'Eg.  HNG I8 / Team Socrates',
                    ),
                    UIHelper.verticalSpaceMedium,
                    LongButton(onPressed: () => model.next(), label: 'Next'),
                    SizedBox(height: 15),
                    Text.rich(
                      TextSpan(
                        children: [
                          TextSpan(
                            text: 'By continuing, you are agreeing to our ',
                            style: TextStyle(
                              fontWeight: FontWeight.w400,
                              fontSize: 16,
                            ),
                          ),
                          TextSpan(
                            text: 'Customer’s Term of Service, Privacy Policy',
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
                            text: 'Cookie Policy',
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
                        value: model.checkBoxVal,
                        onChanged: model.onCheckBoxChanged,
                        controlAffinity: ListTileControlAffinity.leading,
                        title: Text(
                          'It’s okay to send me email with slack app, news and offer',
                          style: TextStyle(
                            fontSize: 15,
                          ),
                        ),
                      ),
                    ),
                    Spacer(flex: 3),
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
