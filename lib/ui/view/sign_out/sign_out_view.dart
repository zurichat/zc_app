import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hng/app/app.locator.dart';
import 'package:hng/app/app.router.dart';
import 'package:hng/models/organization_model.dart';
import 'package:stacked_services/stacked_services.dart';
import '../../../../general_widgets/custom_text.dart';
import 'package:flutter/foundation.dart';
import 'package:hng/ui/shared/shared.dart';
import 'package:stacked/stacked.dart';

import 'sign_out_viewmodel.dart';

// ignore: must_be_immutable
class SignOutView extends StatelessWidget {

  final OrganizationModel organization;
  SignOutView(this.organization);


  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<SignOutViewModel>.reactive(
        disposeViewModel: false,
        onModelReady: (model) => model.initViewModel(organization),
        initialiseSpecialViewModelsOnce: true,
        viewModelBuilder: () => SignOutViewModel(),
        builder: (context, model, child) {
          return BottomSheetContent();
        });
  }
}

class WorkSpaceDisplayInfo extends StatelessWidget {
  final String? imageUrl;
  final String? workSpaceTitle;
  final String? workSPaceSlackUrl;

  WorkSpaceDisplayInfo(
      this.imageUrl, this.workSpaceTitle, this.workSPaceSlackUrl);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: [
          GestureDetector(
            onTap: () {},
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  padding: EdgeInsets.all(15),
                  child: Container(
                    color: Colors.grey,
                    height: 32,
                    width: 32,
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      child: CustomText(
                        text: workSpaceTitle?.toUpperCase() ?? "",
                        fontSize: 16.0,
                        color: AppColors.zuriTextBodyColor,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Container(
                      child: CustomText(
                        text: workSPaceSlackUrl?.toLowerCase() ?? "",
                        fontSize: 14.0,
                        color: AppColors.zuriTextBodyColor,
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}

class BottomSheetContent extends ViewModelWidget<SignOutViewModel> {
  @override
  Widget build(BuildContext context, SignOutViewModel model) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        InkWell(
          onTap: () {},
          child: WorkSpaceDisplayInfo(model.organization.logoUrl,
              model.organization.name, model.organization.organizationUrl),
        ),
        GestureDetector(
          onTap: () {
            model.dismissDialog();
            _showSignOutDialog(context, model.organization.name ?? "", model);

            // show the dialog
          },
          child: ListTile(
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
    );
  }

  Future<void> _showSignOutDialog(context, String orgName, SignOutViewModel model) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: true, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: CustomText(
            text: 'Sign out of $orgName?',
            fontWeight: FontWeight.w700,
            fontSize: 20,
            color: AppColors.zuriTextBodyColor,
          ),
          content: CustomText(
            text:
                "You can sign back in anytime by tapping \n\"Add a workspace\"",
            maxLines: 2,
            fontWeight: FontWeight.w400,
            fontSize: 14,
            color: AppColors.zuriDarkGrey,
          ),
          actions: <Widget>[
            TextButton(
              child: CustomText(
                text: 'Cancel',
                fontWeight: FontWeight.w700,
                fontSize: 16,
                color: AppColors.zuriPrimaryColor,
              ),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: CustomText(
                text: 'Sign Out',
                fontWeight: FontWeight.w700,
                fontSize: 16,
                color: AppColors.zuriPrimaryColor,
              ),
              onPressed: () {
                model.dismissDialog();
                model.signOutUser();
              },
            ),
          ],
        );
      },
    );
  }
}
