import 'package:flutter/material.dart';
import 'package:zurichat/general_widgets/custom_text.dart';
import 'package:zurichat/models/organization_model.dart';
import 'package:zurichat/ui/shared/bottom_sheets/sign_out_bottomsheet/sign_out_botton_sheet_viewmodel.dart';
import 'package:zurichat/ui/shared/bottom_sheets/sign_out_bottomsheet/widgets/work_space_display_info_view.dart';
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
    return ViewModelBuilder<SignOutBottomSheetViewModel>.nonReactive(
        builder: (context, model, child) => Container(
              color: AppColors.whiteColor,
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
                      model.dismissDialog();
                      model.showSignOutDialog(org.name ?? "");
                    },
                    child: const ListTile(
                      title: CustomText(
                        text: 'Sign Out',
                        fontWeight: FontWeight.w700,
                        fontSize: 16,
                        color: AppColors.zuriPrimaryColor,
                      ),
                      leading: Icon(
                        Icons.logout_sharp,
                        color: AppColors.zuriPrimaryColor,
                      ),
                    ),
                  )
                ],
              ),
            ),
        viewModelBuilder: () => SignOutBottomSheetViewModel());
  }
}
