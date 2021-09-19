import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../../../general_widgets/custom_text.dart';
import 'package:flutter/foundation.dart';
import 'package:hng/ui/shared/shared.dart';
import 'package:stacked/stacked.dart';

import 'sign_out_viewmodel.dart';

// ignore: must_be_immutable
class SignUpView extends StatelessWidget {
  const SignUpView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<SignOutViewModel>.reactive(
        disposeViewModel: false,
        initialiseSpecialViewModelsOnce: true,
        viewModelBuilder: () => SignOutViewModel(),
        builder: (context, model, child) {
          return Container();
        });
  }
}

class WorkSpaceDisplayInfo extends StatelessWidget {
  final String imageUrl;
  final String workSpaceTitle;
  final String workSPaceSlackUrl;
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
                  child: Image.asset(
                    imageUrl,
                    height: 32,
                    width: 32,
                  ),
                ),
                Column(
                  children: [
                    Container(
                      child: CustomText(
                        text: workSpaceTitle.toUpperCase(),
                        fontSize: 16.0,
                        color: AppColors.zuriTextBodyColor,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Container(
                      child: CustomText(
                        text: workSPaceSlackUrl.toLowerCase(),
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

class BottomsheetContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        InkWell(
          onTap: () {},
          child: WorkSpaceDisplayInfo('assets/logo/zuri_chat_logo.png',
              'Hngi8 x i4G', 'hngi8.slack.com'),
        ),
        GestureDetector(
          onTap: () {
            Navigator.pop(context);
            _showSignOutDialog(context);

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

  Future<void> _showSignOutDialog(context) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: true, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: CustomText(
            text: 'Sign out of hng ?',
            fontWeight: FontWeight.w700,
            fontSize: 20,
            color: AppColors.zuriTextBodyColor,
          ),
          content: CustomText(
            text:
                "You can sign back in anytime by tapping \"Add a workspace\".",
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
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}
