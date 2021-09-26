import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hng/ui/view/channel/channel_info/channel_info_view_model.dart';
import 'package:hng/ui/view/channel/channel_members/channel_members_list.dart';
import 'package:stacked/stacked.dart';

import '../../../../shared/colors.dart';
import 'textstyles.dart';

class ThirdSection extends StatelessWidget {
   Function goToMembersListScreen;
    final int  membersNumber;
   ThirdSection({
     required this.goToMembersListScreen,
   required this.membersNumber
   });

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<ChannelInfoViewModel>.reactive(
      viewModelBuilder: () => ChannelInfoViewModel(),
      builder: (context, model, child) => Container(
        width: MediaQuery.of(context).size.width,
        alignment: Alignment.center,
        margin: const EdgeInsets.only(right: 5, left: 5, bottom: 15),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(2),
            border: Border.all(width: 1.0, color: AppColors.borderColor)),
        child: Column(
          children: [
            Row(
              children: [
                Container(
                  margin: const EdgeInsets.only(
                    left: 9,
                    top: 19,
                  ),
                  child: const Icon(
                    Icons.group_outlined,
                    color: AppColors.deepBlackColor,
                    size: 28,
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(
                    left: 11,
                    top: 19,
                  ),
                  child: GestureDetector(
                    onTap: () {
                      
                      goToMembersListScreen();
                      // model.navigatoToMembersList();
                    },
                    child: Text(
                      "$membersNumber members",
                      style: descriptionStyle(),
                    ),
                  ),
                ),
              ],
            ),
            Divider(
              thickness: 0.5,
              color: AppColors.deepBlackColor.withOpacity(0.5),
              indent: 53,
              endIndent: 33,
            ),
            Row(
              children: [
                Container(
                  margin: const EdgeInsets.only(
                    left: 9,
                    top: 13,
                  ),
                  child: const Icon(
                    Icons.person_add_alt_1_outlined,
                    color: AppColors.deepBlackColor,
                    size: 28,
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(
                    left: 11,
                    top: 13,
                  ),
                  child: Text(
                    'Add People',
                    style: descriptionStyle(),
                  ),
                ),
              ],
            ),
            Divider(
              thickness: 0.5,
              color: AppColors.deepBlackColor.withOpacity(0.5),
              indent: 53,
              endIndent: 33,
            ),
            Row(
              children: [
                Container(
                  margin: const EdgeInsets.only(
                    left: 9,
                    top: 13,
                  ),
                  child: const Icon(
                    Icons.dashboard_outlined,
                    color: AppColors.deepBlackColor,
                    size: 28,
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(
                    left: 11,
                    top: 13,
                  ),
                  child: Text(
                    'Plugins (1)',
                    style: descriptionStyle(),
                  ),
                ),
              ],
            ),
            Divider(
              thickness: 0.5,
              color: AppColors.deepBlackColor.withOpacity(0.5),
              indent: 53,
              endIndent: 33,
            ),
            Row(
              children: [
                Container(
                  margin: const EdgeInsets.only(
                    left: 9,
                    top: 13,
                    bottom: 10,
                  ),
                  child: const Icon(
                    Icons.phone_outlined,
                    color: AppColors.deepBlackColor,
                    size: 28,
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(
                    left: 11,
                    top: 19,
                    bottom: 10,
                  ),
                  child: Text(
                    'Start a call',
                    style: descriptionStyle(),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
