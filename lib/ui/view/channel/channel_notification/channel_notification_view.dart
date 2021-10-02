import 'package:flutter/material.dart';
import 'package:hng/constants/app_strings.dart';
import 'package:hng/ui/shared/colors.dart';
import 'package:hng/ui/shared/styles.dart';
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
            appBar: const ZuriAppBar(
              60,
              Notifications,
              subtitle: ChannelNotifSubtitle,
              icon: Icons.chevron_left,
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

class ZuriAppBar extends StatelessWidget implements PreferredSizeWidget {
  final double height;
  final String title;
  final String? subtitle;
  final IconData? icon;
  final VoidCallback? onIconTap;
  final String? buttonText;
  final VoidCallback? onButtanTap;

  const ZuriAppBar(
    this.height,
    this.title, {
    this.subtitle,
    this.icon,
    this.onIconTap,
    this.buttonText,
    this.onButtanTap,
    Key? key,
  }) : super(key: key);

  @override
  Size get preferredSize => Size.fromHeight(height);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: AppColors.shadowColor,
            blurRadius: 5,
          )
        ],
      ),
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: IconButton(
              icon: Icon(icon, size: 25, color: AppColors.deepBlackColor),
              onPressed: onIconTap,
            ),
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  '$title',
                  style: AppTextStyles.heading6.copyWith(
                    color: AppColors.deepBlackColor,
                  ),
                ),
                const SizedBox(height: 4),
                if (subtitle != null)
                  Text(
                    '$subtitle',
                    style: AppTextStyles.body1Regular,
                  ),
              ],
            ),
          ),
          if (buttonText != null)
            TextButton(
              onPressed: onButtanTap,
              child: Text(
                '$buttonText',
                style: AppTextStyles.heading5.copyWith(
                  color: Colors.green,
                ),
              ),
            ),
        ],
      ),
    );
  }
}
