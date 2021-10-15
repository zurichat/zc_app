import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import 'package:hng/ui/shared/text_styles.dart';

class CustomChannel extends StatelessWidget {
  final String? text;
  final bool? public;
  const CustomChannel({Key? key, this.text, required this.public})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 24.h,
      width: 211.w,
      child: Padding(
        padding: EdgeInsets.fromLTRB(5.w, 0, 0, 0),
        child: Row(
          children: [
            SizedBox(
              height: 16.r,
              width: 16.r,
              child: public == false
                  ? SvgPicture.asset(
                      'assets/icons/svg_icons/lock_outline.svg',
                      color: Theme.of(context).textTheme.bodyText1!.color,
                    )
                  : SvgPicture.asset(
                      'assets/icons/svg_icons/hash_tag.svg',
                      color: Theme.of(context).textTheme.bodyText1!.color,
                    ),
            ),
            SizedBox(width: 21.33.w),
            Text(
              '$text',
              style: AppTextStyle.darkGreySize14Bold,
            ),
          ],
        ),
      ),
    );
  }
}
