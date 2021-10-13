import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zurichat/constants/app_strings.dart';

class CustomUser extends StatelessWidget {
  const CustomUser({Key? key, this.image, this.text}) : super(key: key);
  final String? text;
  final String? image;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 48.w,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            height: 48.h,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8.r),
                image: const DecorationImage(
                    fit: BoxFit.cover, image: NetworkImage(DummyAvatar))),
          ),
          SizedBox(
            height: 8.h,
          ),
          SizedBox(
              height: 32.h,
              child: Text(
                '$text',
                textAlign: TextAlign.center,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                // style: AppTextStyles.subtitle1.copyWith(fontSize: 12.sp),
              ))
        ],
      ),
    );
  }
}
