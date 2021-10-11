import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hng/constants/app_strings.dart';
import 'package:hng/models/channel_members.dart';
import 'package:hng/models/channel_model.dart';
import 'package:hng/ui/shared/zuri_appbar.dart';
import 'package:stacked/stacked.dart';
import 'package:hng/ui/shared/colors.dart';
import '../../../shared/shared.dart';
import 'channel_info_view_model.dart';
import 'widgets/first_section.dart';
import 'widgets/second_section.dart';
import 'widgets/third_section.dart';
import 'widgets/fourth_section.dart';
import 'widgets/fifth_section.dart';
import 'widgets/sixth_section.dart';

class ChannelInfoView extends StatelessWidget {
  final int numberOfMembers;
  final List<ChannelMembermodel> channelMembers;
  final ChannelModel channelDetail;

  const ChannelInfoView(
      {Key? key,
      required this.numberOfMembers,
      required this.channelMembers,
      required this.channelDetail})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
        const SystemUiOverlayStyle(statusBarColor: AppColors.deepBlackColor));
    return ViewModelBuilder<ChannelInfoViewModel>.reactive(
      fireOnModelReadyOnce: true,
      onModelReady: (model) {
        model.getChannelInfo();
      },
      disposeViewModel: false,
      builder: (context, model, child) => ScreenUtilInit(
          designSize: const Size(411, 823),
          builder: () {
            return Scaffold(
              appBar: ZuriAppBar(
                leading: Icons.clear,
                leadingPress: () => model.navigateBack(),
                actions: [
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.star),
                    color: AppColors.zuriPrimaryColor,
                  ),
                ],
                whiteBackground: true,
                orgTitle: Text(
                  ChannelInfo,
                  style: AppTextStyles.heading4
                      .copyWith(color: AppColors.blackColor),
                ),
              ),
              body: SafeArea(
                child: SingleChildScrollView(
                  padding: EdgeInsets.fromLTRB(8.w, 16.h, 8.w, 0),
                  scrollDirection: Axis.vertical,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      FirstSection(model),
                      SizedBox(height: 12.h),
                      const SecondSection(),
                      SizedBox(height: 14.h),
                      Padding(
                        padding: EdgeInsets.only(left: 8.w),
                        child: Text(
                          MuteChannelWarning,
                          style: AppTextStyles.body1Grey,
                        ),
                      ),
                      ThirdSection(model, numberOfMembers, channelDetail,
                          channelMembers),
                      SizedBox(height: 16.h),
                      Padding(
                        padding: EdgeInsets.only(left: 8.w),
                        child: Text(
                          Bookmarks,
                          style: AppTextStyles.body1Grey,
                        ),
                      ),
                      SizedBox(height: 8.h),
                      const FourthSection(),
                      SizedBox(height: 16.h),
                      const FifthSection(),
                      SizedBox(height: 16.h),
                      Padding(
                        padding: EdgeInsets.only(left: 8.w),
                        child: Text(
                          Advanced,
                          style: AppTextStyles.body1Grey,
                        ),
                      ),
                      SizedBox(height: 8.h),
                      SixthSection(channelDetail),
                      SizedBox(height: 12.h),
                    ],
                  ),
                ),
              ),
            );
          }),
      viewModelBuilder: () => ChannelInfoViewModel(),
    );
  }
}
