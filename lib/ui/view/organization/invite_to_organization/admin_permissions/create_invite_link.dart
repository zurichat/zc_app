import 'package:flutter/material.dart';

import 'package:zurichat/ui/shared/shared.dart';
import 'package:zurichat/utilities/constants/text_styles.dart';
import 'package:zurichat/ui/shared/dumb_widgets/zuri_appbar.dart';
import 'package:zurichat/ui/view/organization/invite_to_organization/invite_via_email/invite_viewmodel.dart';
import 'package:zurichat/utilities/internationalization/app_localization.dart';

import 'package:stacked/stacked.dart';

class CreateInviteLink extends StatelessWidget {
  const CreateInviteLink({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final local = AppLocalization.of(context);
    return ViewModelBuilder<InviteViewModel>.reactive(
      viewModelBuilder: () => InviteViewModel(),
      builder: (BuildContext context, InviteViewModel model, Widget? children) {
        return Scaffold(
          appBar: ZuriAppBar(
            leading: Icons.close,
            leadingPress: () {
              model.navigateBack();
            },
            whiteBackground: true,
            orgTitle: Text(
              local!.invite,
              style: AppTextStyle.darkGreySize18Bold,
            ),
            actions: [
              Padding(
                padding: const EdgeInsets.fromLTRB(0.0, 16.0, 20.0, 0.0),
                child: InkWell(
                    highlightColor: Colors.transparent,
                    splashColor: Colors.transparent,
                    onTap: () {},
                    child: Text(
                      local.send,
                      style: AppTextStyle.greenSize14,
                    )),
              ),
            ],
          ),
          body: Padding(
            padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
            child: Column(
              children: [
                Center(
                  child: Text(
                    local.coworkersToJoin,
                    //style: AppTextStyles.body2_400,
                  ),
                ),
                UIHelper.verticalSpaceLarge,
                Container(
                  color: AppColors.whiteColor,
                  child: TextField(
                    cursorColor: AppColors.zuriPrimaryColor,
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                      prefixIcon: const Icon(
                        Icons.email_outlined,
                      ),
                      labelText: local.addEmailAddress,
                      border: border(),
                      focusedBorder: border(),
                      enabledBorder: border(),
                    ),
                  ),
                ),
                UIHelper.verticalSpaceLarge,
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.whiteColor,
                  ),
                  onPressed: () {},
                  child: ListTile(
                    leading: const Icon(Icons.person_sharp),
                    title: Text(local.inviteFromContacts),
                  ),
                ),
                SizedBox(
                  child: Column(
                    children: [
                      ListTile(
                        leading: const Icon(
                          Icons.link_sharp,
                        ),
                        title: Text(local.shareInviteLink),
                      ),
                      UIHelper.horizontalSpaceSmall,
                      Text(
                        local.shareLinkText,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

OutlineInputBorder border({Color? color}) {
  return OutlineInputBorder(
    borderSide: BorderSide(
      color: Colors.grey[300] ?? AppColors.greyColor,
    ),
    borderRadius: BorderRadius.circular(4),
  );
}
