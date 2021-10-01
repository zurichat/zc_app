// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:hng/ui/shared/styles.dart';
//
// class CustomUserChannel extends StatelessWidget {
//   final String? image;
//   final String? text;
//   final String? text2;
//   final IconData? trailingIcon;
//   final Color? iconColor;
//
//   const CustomUserChannel({
//     Key? key,
//     this.image,
//     this.text,
//     this.text2,
//     this.trailingIcon,
//     this.iconColor
//   }) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return InkWell(
//         onTap: () {},
//         child: Container(
//             height: 24.h,
//             width: 211.w,
//             child: Row(
//               children: [
//                 Container(
//                   child: Image(
//                     height: 24.h,
//                     width: 24.w,
//                     fit: BoxFit.cover,
//                     image: AssetImage('$image'),
//                   ),
//                 ),
//                 SizedBox(width: 12.w),
//                 Text(
//                   text!,
//                   style: AppTextStyles.fileName, // textfont in here won't scale to different screens
//                 ),
//                 SizedBox(width: 10.w),
//                 Text(
//                   text2!,
//                   style: AppTextStyles.faintBodyText, // textfont in here won't scale to different screens
//                 ),
//                 SizedBox(width: 10.w),
//                 Container(
//                   height: 8.h,
//                   width: 8.w,
//                   child: Icon(
//                     trailingIcon!,
//                     size: 9.sp,
//                     color: iconColor,
//                   ),
//                 )
//               ],
//             )),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../ui/shared/styles.dart';

class CustomUserChannel extends StatelessWidget {
  final String? image;
  final String? text;
  final String? text2;
  final IconData? trailingIcon;
  final Color? iconColor;

  const CustomUserChannel(
      {Key? key,
      this.image,
      this.text,
      this.text2,
      this.trailingIcon,
      this.iconColor})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: SizedBox(
          height: 24.h,
          width: 211.w,
          child: Row(
            children: [
              SizedBox(
                child: Image(
                  height: 24.h,
                  width: 24.w,
                  fit: BoxFit.cover,
                  image: AssetImage('$image'),
                ),
              ),
              SizedBox(width: 12.w),
              Text(
                '$text',
                style: AppTextStyles.fileName.copyWith(
                    fontSize: 14
                        .sp), // textfont in here won't scale to different screens
              ),
              SizedBox(width: 10.w),
              Text(
                '$text2',
                style: AppTextStyles
                    .faintBodyText, // textfont in here won't scale to different screens
              ),
              SizedBox(width: 10.w),
              SizedBox(
                height: 8.h,
                width: 8.w,
                child: Icon(
                  trailingIcon,
                  size: 9.sp,
                  color: iconColor,
                ),
              )
            ],
          )),
    );
  }
}
