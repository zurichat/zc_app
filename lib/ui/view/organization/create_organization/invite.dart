import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:zurichat/utilities/constants/app_strings.dart';
import 'package:zurichat/utilities/constants/text_styles.dart';
import 'package:zurichat/utilities/internationalization/app_localization.dart';
import 'package:stacked/stacked.dart';

import '../../../../utilities/constants/colors.dart';
import '../../../shared/long_button.dart';
import '../../../shared/text_field.dart';
import '../../../../utilities/constants/ui_helpers.dart';
import 'create_organization_viewmodel.dart';

class InvitePage extends ViewModelWidget<CreateOrganizationViewModel> {
  final PageController pageController;
  const InvitePage({
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
                        local!.teammateNames,
                        style: const TextStyle(
                          letterSpacing: 0.5,
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ), //Copy and share your invute link
                    Container(
                      alignment: Alignment.center,
                      padding: const EdgeInsets.only(bottom: 20),
                      // child: Row(
                      //   mainAxisSize: MainAxisSize.min,
                      //   children: [
                      //     SvgPicture.asset(
                      //       LinkLogo,
                      //       width: 18,
                      //       // color: AppColors.zuriPrimaryColor,
                      //     ),
                      //     const SizedBox(width: 10),
                      //     Text(
                      //       local.shareInviteLink,
                      //       style: const TextStyle(
                      //         letterSpacing: 0.5,
                      //         color: AppColors.zuriPrimaryColor,
                      //         decoration: TextDecoration.underline,
                      //         fontSize: 16,
                      //         fontWeight: FontWeight.normal,
                      //       ),
                      //       textAlign: TextAlign.center,
                      //     ),
                      //   ],
                      // ),
                    ),
                    BorderTextField(
                      hint: SampleEmail,
                      onChanged: (val) => viewModel.updateData(invi: val),
                    ),
                    // const InviteButton(),
                    UIHelper.verticalSpaceMedium,
                    LongButton(
                        onPressed: () => viewModel.addTeammates(),
                        label: local.addTeammates),
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

class InviteButton extends ViewModelWidget<CreateOrganizationViewModel> {
  const InviteButton({Key? key}) : super(key: key, reactive: true);

  @override
  Widget build(BuildContext context, CreateOrganizationViewModel viewModel) {
    final local = AppLocalization.of(context);
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 15.0),
      child: TextButton(
        style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all<Color>(
              AppColors.whiteColor,
            ),
            shape: MaterialStateProperty.all<OutlinedBorder>(
              RoundedRectangleBorder(
                side: const BorderSide(
                    color: AppColors.zuriPrimaryColor, width: 1),
                borderRadius: BorderRadius.circular(4),
              ),
            ),
            fixedSize: MaterialStateProperty.all<Size>(
              Size(
                MediaQuery.of(context).size.width.clamp(240.0, 560.0),
                48,
              ),
            )),
        onPressed: viewModel.onInviteTap,
        child: Padding(
          padding: const EdgeInsets.fromLTRB(0, 8, 0, 8),
          child: SizedBox(
            width: 300,
            child: Center(
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Icon(
                    Icons.person_add_alt_outlined,
                    color: AppColors.zuriPrimaryColor,
                  ),
                  const SizedBox(width: 10),
                  Text(
                    local!.inviteFromContacts,
                    style: AppTextStyle.greenSize16,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
