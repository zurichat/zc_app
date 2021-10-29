import 'package:flutter/material.dart';
import 'package:zurichat/utilities/constants/colors.dart';

import 'package:zurichat/utilities/constants/text_styles.dart';
import 'package:zurichat/ui/shared/dumb_widgets/zuri_appbar.dart';
import 'package:zurichat/utilities/internationalization/app_localization.dart';
import 'package:stacked/stacked.dart';

import 'channel_notification_viewmodel.dart';

class ChannelNotificationView extends StatelessWidget {
  final String? channelName;
  const ChannelNotificationView({Key? key, this.channelName}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final local = AppLocalization.of(context);
    return ViewModelBuilder<ChannelNotificationViewModel>.reactive(
      viewModelBuilder: () => ChannelNotificationViewModel(),
      builder: (context, model, child) {
        return SafeArea(
          child: Scaffold(
            appBar: ZuriAppBar(
              title: local!.notifications,
              subtitle: local.channelNotifSubtitle,
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
                        local.everyNewMessage,
                        local.newButton,
                        '${model.value}',
                        (val) => model.toggleOptions(val),
                        false,
                      ),
                      _buildOption(
                        local.justMentions,
                        local.mentions,
                        '${model.value}',
                        (val) => model.toggleOptions(val),
                      ),
                      _buildOption(
                        local.nothing,
                        local.none,
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
                    "${local.channelNotifSettings} $channelName channel",
                    style: AppTextStyle.lightGreySize14,
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
          style: AppTextStyle.darkGreySize14,
        ),
      ),
    );
  }
}
