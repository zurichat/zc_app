import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hng/ui/shared/styles.dart';
import 'package:hng/ui/view/dm_chat_view/dm_jump_to_view.dart';
import 'package:hng/ui/view/dm_chat_view/dm_jump_to_viewmodel.dart';

class CustomChannel extends StatelessWidget {
  final String? text;
  DmJumpToView? model;
  CustomChannel({
    Key? key,
    this.text,
    this.model}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Container(
        height: 24.h,
        width: 211.w,
        child: Padding(
          padding: EdgeInsets.fromLTRB(5.w, 0, 0, 0),
          child: Row(
            children: [
              Text(
                '#',
                style: AppTextStyles
                    .heading7, // textfont in here won't scale to different screens
              ),
              SizedBox(width: 21.33.w),
              Text(
               text ??
                    '...',
                style: AppTextStyles
                    .fileName, // textfont in here won't scale to different screens
              ),
            ],
          ),
        ),
      ),
    );
  }
}
