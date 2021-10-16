import 'package:flutter/material.dart';

import 'package:hng/models/organization_model.dart';
import 'package:hng/ui/shared/bottom_sheets/sign_out_bottomsheet/sign_out_botton_sheet_viewmodel.dart';
import 'package:hng/ui/shared/bottom_sheets/sign_out_bottomsheet/widgets/work_space_display_info_view.dart';
import 'package:hng/ui/shared/text_styles.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import '../../colors.dart';

class SignOutBottomSheet extends StatelessWidget {
  final SheetRequest request;
  final Function(SheetResponse) completer;

  const SignOutBottomSheet(
      {Key? key, required this.request, required this.completer})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final OrganizationModel org = request.data;
    final bool _dark = Theme.of(context).brightness == Brightness.dark;
    return ViewModelBuilder<SignOutBottomSheetViewModel>.nonReactive(
        builder: (context, model, child) => Container(
              color: _dark ? AppColors.darkModeColor : AppColors.whiteColor,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  WorkSpaceDisplayInfo(
                    imageUrl: org.logoUrl,
                    workSpaceTitle: org.name,
                    workSpaceSlackUrl: org.organizationUrl,
                  ),
                  GestureDetector(
                    onTap: () {
                      //TODO: check this
                      // model.dismissDialog();
                      // model.showSignOutDialog(org.name ?? "");
                    },
                    child: ListTile(
                      title: Text(
                        'Invite members',
                        style: _dark
                            ? AppTextStyle.whiteSize16
                            : AppTextStyle.darkGreySize16,
                      ),
                      leading: Icon(
                        Icons.logout_sharp,
                        color:
                            _dark ? AppColors.whiteColor : AppColors.greyColor,
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      model.navigateToWorkSpaceSettings(org);
                    },
                    child: ListTile(
                      title: Text(
                        'Organization settings',
                        style: _dark
                            ? AppTextStyle.whiteSize16
                            : AppTextStyle.darkGreySize16,
                      ),
                      leading: Icon(
                        Icons.settings,
                        color:
                            _dark ? AppColors.whiteColor : AppColors.greyColor,
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      model.dismissDialog();
                      model.showSignOutDialog(org.name ?? "");
                    },
                    child: ListTile(
                      title: Text(
                        'Sign Out',
                        style: _dark
                            ? AppTextStyle.whiteSize16
                            : AppTextStyle.darkGreySize16,
                      ),
                      leading: const Icon(
                        Icons.logout_sharp,
                        color: AppColors.unreadMessageColor,
                      ),
                    ),
                  )
                ],
              ),
            ),
        viewModelBuilder: () => SignOutBottomSheetViewModel());
  }
}
