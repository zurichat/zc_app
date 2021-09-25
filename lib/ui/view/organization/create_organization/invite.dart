import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:stacked/stacked.dart';

import '../../../shared/colors.dart';
import '../../../shared/long_button.dart';
import '../../../shared/styles.dart';
import '../../../shared/text_field.dart';
import '../../../shared/ui_helpers.dart';
import 'create_organization_viewmodel.dart';

class InvitePage extends ViewModelWidget<CreateOrganizationViewModel> {
  const InvitePage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, CreateOrganizationViewModel model) {
    return LayoutBuilder(
      builder: (context, constraint) {
        return SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(20),
            child: ConstrainedBox(
              constraints: BoxConstraints(
                minHeight: constraint.maxHeight - kToolbarHeight,
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
                        "Who else is working with you?",
                        style: TextStyle(
                          letterSpacing: 0.5,
                          color: AppColors.blackColor,
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ), //Copy and share your invute link
                    Container(
                      alignment: Alignment.center,
                      padding: EdgeInsets.only(bottom: 20),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          SvgPicture.asset(
                            'assets/icons/svg_icons/link.svg',
                            width: 18,
                            // color: AppColors.zuriPrimaryColor,
                          ),
                          SizedBox(width: 10),
                          Text(
                            "Copy and share your invite link",
                            style: TextStyle(
                              letterSpacing: 0.5,
                              color: AppColors.zuriPrimaryColor,
                              decoration: TextDecoration.underline,
                              fontSize: 16,
                              fontWeight: FontWeight.normal,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                    ),
                    BorderTextField(
                      controller: model.inviteController,
                      hint: 'name@example.com',
                    ),
                    InviteButton(),
                    UIHelper.verticalSpaceMedium,
                    LongButton(onPressed: () => model.addTeammates(), label: 'Add Teammates'),
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

class InviteButton extends ViewModelWidget<CreateOrganizationViewModel> {
  InviteButton({Key? key}) : super(key: key, reactive: true);

  @override
  Widget build(BuildContext context, CreateOrganizationViewModel model) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 15.0),
      child: TextButton(
        style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all<Color>(
              AppColors.whiteColor,
            ),
            shape: MaterialStateProperty.all<OutlinedBorder>(
              RoundedRectangleBorder(
                side: BorderSide(color: AppColors.zuriPrimaryColor, width: 1),
                borderRadius: BorderRadius.circular(4),
              ),
            ),
            fixedSize: MaterialStateProperty.all<Size>(
              Size(
                MediaQuery.of(context).size.width.clamp(240.0, 560.0),
                48,
              ),
            )),
        onPressed: model.onInviteTap,
        child: Padding(
          padding: const EdgeInsets.fromLTRB(0, 8, 0, 8),
          child: Container(
            width: 300,
            child: Center(
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(
                    Icons.person_add_alt_outlined,
                    color: AppColors.zuriPrimaryColor,
                  ),
                  SizedBox(width: 10),
                  Text(
                    'Invite from Contacts',
                    style: AppTextStyles.buttonText
                        .copyWith(color: AppColors.zuriPrimaryColor),
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
