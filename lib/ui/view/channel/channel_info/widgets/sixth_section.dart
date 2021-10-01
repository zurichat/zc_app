import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hng/ui/shared/colors.dart';
import 'package:hng/ui/shared/shared.dart';

class SixthSection extends StatelessWidget {
  const SixthSection({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 136.h,
      width: 395.w,
      alignment: Alignment.center,
      padding: EdgeInsets.fromLTRB(16.37.w, 18.h, 0, 0),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(6.r),
          border: Border.all(width: 1.w, color: AppColors.borderColor),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 5.r,
              blurRadius: 6.r,
              offset: Offset(0, 3.h), // changes position of shadow
            ),
          ]),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(
            Icons.archive_rounded,
            color: AppColors.deepBlackColor,
            size: 28.sp,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Archive Channel',
                  style:
                      AppTextStyles.archiveTextStyle2.copyWith(fontSize: 14.sp),
                ),
                Container(
                    alignment: Alignment.center,
                    child: Text(
                      'Archiving the channel will remover it from the channel list, and close it from all members.'
                      'All chats and filse will still be stored and searchable',
                      style: AppTextStyles.body2_400.copyWith(fontSize: 14.sp),
                      softWrap: true,
                    )),
              ],
            ),
          )
        ],
      ),
    );
  }
}
