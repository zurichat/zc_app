import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hng/ui/shared/shared.dart';
import 'package:hng/ui/view/channel/channel_info/channel_info_view_model.dart';
import 'package:stacked/stacked.dart';
import '../../../../shared/colors.dart';

class SecondSection extends StatelessWidget {
  const SecondSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<ChannelInfoViewModel>.reactive(
        viewModelBuilder: () => ChannelInfoViewModel(),
        builder: (context, model, child) => Card(
              elevation: 2,
              child: Container(
                height: 155.h,
                width: double.infinity,
                alignment: Alignment.center,
                padding: const EdgeInsets.fromLTRB(16.37, 0, 26, 26.37),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(6.r),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Switch(
                          onChanged: model.toggleNotification,
                          value: model.notification,
                          activeColor: AppColors.zuriPrimaryColor,
                        ),
                      ],
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Icon(
                          Icons.notifications_outlined,
                          color: AppColors.deepBlackColor,
                          size: 28,
                        ),
                        const SizedBox(width: 26,),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Notification',
                                style:
                                AppTextStyles.archiveTextStyle2.copyWith(fontSize: 14, color: AppColors.blackColor),
                              ),
                              const SizedBox(height: 6,),
                              Text(
                                'Every new message',
                                style:
                                AppTextStyles.body1Regular.copyWith(letterSpacing: 0.005, fontSize: 14),
                              ),
                              const SizedBox(height: 18),
                              Text(
                                'Mute channel',
                                style:
                                AppTextStyles.descriptionStyle,
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ));
  }
}
