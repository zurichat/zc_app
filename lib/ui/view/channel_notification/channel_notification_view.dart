import 'package:flutter/material.dart';
import 'package:hng/ui/shared/colors.dart';
import 'package:hng/ui/shared/styles.dart';
import 'package:stacked/stacked.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'channel_notification_viewmodel.dart';

class ChannelNotificationView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(
        BoxConstraints(
            maxWidth: MediaQuery.of(context).size.width,
            maxHeight: MediaQuery.of(context).size.height),
        designSize: Size(411, 823),
        orientation: Orientation.portrait);
    return ViewModelBuilder<ChannelNotificationViewModel>.reactive(
      viewModelBuilder: () => ChannelNotificationViewModel(),
      builder: (context, model, child) {
        return SafeArea(
          child: Scaffold(
            appBar: ZuriAppBar(
              56.h,
              'Notifications',
              subtitle: 'Settings for #teamsocrates',
              icon: Icons.chevron_left,
            ),
            body: Column(
              children: [
                Container(
                  margin: EdgeInsets.all(16.w),
                  decoration: BoxDecoration(
                    color: AppColors.whiteColor,
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: [
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
                        'Every new message',
                        'new',
                        '${model.value}',
                        (val) => model.toggleOptions(val),
                        false,
                      ),
                      _buildOption(
                        'Just @mentions',
                        'mentions',
                        '${model.value}',
                        (val) => model.toggleOptions(val),
                      ),
                      _buildOption(
                        'Nothing',
                        'none',
                        '${model.value}',
                        (val) => model.toggleOptions(val),
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(left: 16.w),
                  width: double.infinity,
                  child: Text(
                    'This setting only applies to #teamsocrates channel.',
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
            ? Border(top: BorderSide(width: 1, color: Colors.grey))
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
  });

  @override
  Size get preferredSize => Size.fromHeight(height);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
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
              icon: Icon(this.icon, size: 25, color: AppColors.deepBlackColor),
              onPressed: this.onIconTap,
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
                SizedBox(height: 4.h),
                if (this.subtitle != null)
                  Text(
                    '$subtitle',
                    style: AppTextStyles.body1Regular,
                  ),
              ],
            ),
          ),
          if (this.buttonText != null)
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
