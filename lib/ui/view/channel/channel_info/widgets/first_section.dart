import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hng/constants/app_strings.dart';
import 'package:hng/ui/shared/shared.dart';
import 'package:hng/ui/view/channel/channel_info/channel_info_view_model.dart';
import '../../../../shared/colors.dart';

class FirstSection extends StatelessWidget {
  const FirstSection(this.model, {Key? key, required this.channelName}) : super(key: key);
  final ChannelInfoViewModel model;
  final channelName;
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    return Card(
      elevation: 2,
      child: Container(
        // height: 284,
        width: double.infinity,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(6),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.fromLTRB(16.w, 24.h, 16.w, 0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "#$channelName",
                    style: AppTextStyles.body1Bold,
                  ),
                  const SizedBox(height: 24),
                  Text(
                    Description,
                    style: AppTextStyles.body1Bold,
                  ),
                  const SizedBox(height: 10),
                  Text(
                    '${model.channelDescription}',
                    style: AppTextStyles.body1Light.copyWith(letterSpacing: 0.005),
                  ),
                  const SizedBox(height: 6),
                  Text(
                    MarkCreatedChannel,
                    style: AppTextStyles.body1Regular.copyWith(letterSpacing: 0.005),
                  ),
                  const SizedBox(height: 18),
                  Text(
                    Topic,
                    style: AppTextStyles.headerStyle1.copyWith(fontSize: 16.sp),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    CreatingZuri,
                    style: AppTextStyles.body1Light.copyWith(fontSize: 16.sp),
                  ),
                  const SizedBox(height: 26),
                ],
              ),
            ),
            const Divider(
              thickness: 0.5,
              color: AppColors.borderColor,
            ),
            SizedBox(height: height*0.01),
            Center(
              child: InkWell(
                onTap: () {
                  model.navigateToEditChannel();
                },
                child: Text(
                  Edit,
                  style: AppTextStyles.bodyBig..copyWith(fontSize: 16.sp),
                ),
              ),
            ),
            const SizedBox(height: 16,)
          ],
        ),
      ),
    );
  }
}
