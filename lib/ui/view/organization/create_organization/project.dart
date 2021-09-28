import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_hooks/stacked_hooks.dart';

import '../../../shared/colors.dart';
import '../../../shared/long_button.dart';
import '../../../shared/ui_helpers.dart';
import 'create_organization_viewmodel.dart';

class ProjectPage extends ViewModelWidget<CreateOrganizationViewModel> {
  const ProjectPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, CreateOrganizationViewModel model) {
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
                      child: const Text(
                        "What's a project your team is working on?",
                        style: TextStyle(
                          letterSpacing: 0.5,
                          color: AppColors.blackColor,
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    const TextForm(
                      hintText: 'Eg.  Q4 Budget, Website Update',
                      wordCount: 80,
                    ),
                    UIHelper.verticalSpaceMedium,
                    LongButton(onPressed: () => model.next(), label: 'Next'),
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
  const TextForm({Key? key, this.wordCount, required this.hintText})
      : super(key: key, reactive: false);
  @override
  Widget buildViewModelWidget(
      BuildContext context, CreateOrganizationViewModel model) {
    return Center(
      child: TextField(
        controller: model.projectController,
        maxLength: wordCount,
        decoration: InputDecoration(
          hintText: hintText,
          hintStyle: const TextStyle(
            fontSize: 16,
            color: Colors.black45,
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
        onChanged: (value) {},
      ),
    );
  }
}
