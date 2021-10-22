import 'package:flutter/material.dart';
import 'package:zurichat/utilities/internationalization/app_localization.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_hooks/stacked_hooks.dart';

import '../../../../utilities/constants/colors.dart';
import '../../../shared/long_button.dart';
import '../../../../utilities/constants/ui_helpers.dart';
import 'create_organization_viewmodel.dart';

class ProjectPage extends ViewModelWidget<CreateOrganizationViewModel> {
  final PageController pageController;
  const ProjectPage({
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
                minHeight: constraint.maxHeight - kToolbarHeight,
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
                        local!.projectName,
                        style: const TextStyle(
                          letterSpacing: 0.5,
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    TextForm(
                      hintText: local.projectHint,
                      wordCount: 80,
                    ),
                    UIHelper.verticalSpaceMedium,
                    LongButton(
                      onPressed: () async {
                        final res = await viewModel.addProject();
                        if (res) next();
                      },
                      label: 'Next',
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

class TextForm extends HookViewModelWidget<CreateOrganizationViewModel> {
  final int? wordCount;
  final String hintText;
  const TextForm({
    Key? key,
    this.wordCount,
    required this.hintText,
  }) : super(key: key, reactive: false);
  @override
  Widget buildViewModelWidget(
      BuildContext context, CreateOrganizationViewModel viewModel) {
    return Center(
      child: TextField(
        maxLength: wordCount,
        decoration: InputDecoration(
          hintText: hintText,
          hintStyle: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w300,
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5),
            borderSide: const BorderSide(
              color: AppColors.greyColor,
              width: 1,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5),
            borderSide: const BorderSide(
              color: AppColors.greyColor,
              width: 1,
            ),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5),
            borderSide: BorderSide(
              color: Colors.grey[300] ?? AppColors.greyColor,
              width: 1,
            ),
          ),
          errorBorder: InputBorder.none,
        ),
        onChanged: (val) => viewModel.updateData(proj: val),
      ),
    );
  }
}
