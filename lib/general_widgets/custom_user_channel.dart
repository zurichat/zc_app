import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomUserChannel extends StatelessWidget {
  const CustomUserChannel(
      {Key? key, this.image, this.text, this.text2, this.trailingIcon, this.iconColor})
      : super(key: key);
  final image;
  final text;
  final text2;
  final trailingIcon;
  final iconColor;

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(411, 823),
      builder: () => InkWell(
        onTap: () {},
        child: Container(
            height: 24.h,
            width: 211.w,
            child: Row(
              children: [
                Container(
                  child: Image(
                    height: 24.h,
                    width: 24.w,
                    fit: BoxFit.cover,
                    image: AssetImage(image),
                  ),
                ),
                SizedBox(width: 12.w),
                Text(
                  text,
                  style: TextStyle(fontSize: 15.sp, fontWeight: FontWeight.bold),
                ),
                SizedBox(width: 10.w),
                Text(
                  text2,
                  style: TextStyle(fontSize: 15.sp, fontWeight: FontWeight.normal),
                ),
                SizedBox(width: 10.w),
                Container(
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
      ),
    );
  }
}
