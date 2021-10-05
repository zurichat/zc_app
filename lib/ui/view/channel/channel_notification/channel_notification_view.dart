import 'package:flutter/material.dart';
import 'package:hng/constants/app_strings.dart';
import 'package:hng/ui/shared/colors.dart';
import 'package:hng/ui/shared/styles.dart';
import 'package:hng/ui/shared/zuri_appbar.dart';
import 'package:stacked/stacked.dart';

import 'channel_notification_viewmodel.dart';

class ChannelNotificationView extends StatelessWidget {
  const ChannelNotificationView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<ChannelNotificationViewModel>.reactive(
      viewModelBuilder: () => ChannelNotificationViewModel(),
      builder: (context, model, child) {
        return SafeArea(
          child: Scaffold(
            appBar: ZuriTopBar(
              title: Notifications,
              subtitle: ChannelNotifSubtitle,
              leading: Icons.chevron_left,
            ),
            body: Column(
              children: [
                Container(
                  margin: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: AppColors.whiteColor,
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: const [
                      BoxShadow(
                        color: AppColors.shadowColor,
                        blurRadius: 5,
                      ),
                    ],
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      _buildOption(
                        EveryNewMessage,
                        New,
                        '${model.value}',
                        (val) => model.toggleOptions(val),
                        false,
                      ),
                      _buildOption(
                        JustMentions,
                        Mentions,
                        '${model.value}',
                        (val) => model.toggleOptions(val),
                      ),
                      _buildOption(
                        Nothing,
                        None,
                        '${model.value}',
                        (val) => model.toggleOptions(val),
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(left: 16),
                  width: double.infinity,
                  child: Text(
                    ChannelNotifSettings,
                    style: AppTextStyles.body2Medium,
                  ),
                )
              ],
            ),
          ),
        );
      },
    );
  }

  Container _buildOption(
      String title, String val, String groupVal, Function(String?)? onChanged,
      [bool border = true]) {
    return Container(
      decoration: BoxDecoration(
        border: border
            ? const Border(top: BorderSide(width: 1, color: Colors.grey))
            : null,
      ),
      child: RadioListTile(
        value: val,
        groupValue: groupVal,
        onChanged: onChanged,
        title: Text(
          '$title',
          style: AppTextStyles.body1Regular.copyWith(
            color: AppColors.deepBlackColor,
          ),
        ),
      ),
    );
  }
}

