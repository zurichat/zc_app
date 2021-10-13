import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zurichat/ui/shared/shared.dart';

class CustomUser extends StatelessWidget {
  const CustomUser({Key? key, this.image, this.text}) : super(key: key);
  final String? text;
  final String? image;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: SizedBox(
        width: 48.w,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              height: 48.h,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8.r),
                  image: const DecorationImage(
                      fit: BoxFit.cover,
                      image: NetworkImage(
                          'https://www.nairaland.com/attachments/10525387_7523740813649122436786583150820259255025664o3_jpega51895fd0bf50cf5d5982826ac401627'))),
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
                  style: AppTextStyles.subtitle1.copyWith(fontSize: 12.sp),
                ))
          ],
        ),
      ),
    );
  }
}
