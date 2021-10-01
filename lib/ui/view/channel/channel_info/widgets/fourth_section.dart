import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hng/ui/view/channel/channel_info/widgets/new_row_tile.dart';
import '../../../../shared/colors.dart';

class FourthSection extends StatelessWidget {
  const FourthSection({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){},
      child: Container(
        height: 53.h,
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
        child: NewRowTile(
            icon:Icons.push_pin_outlined,
            text: 'Pinned messages (1)'
        )
      ),
    );
  }
}
