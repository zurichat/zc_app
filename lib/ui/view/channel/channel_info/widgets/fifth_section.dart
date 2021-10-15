import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hng/constants/app_strings.dart';
import 'package:hng/ui/view/channel/channel_info/widgets/new_row_tile.dart';

class FifthSection extends StatelessWidget {
  const FifthSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Card(
        elevation: 2,
        child: Container(
          height: 53.h,
          width: double.infinity,
          alignment: Alignment.center,
          padding: EdgeInsets.fromLTRB(18.w, 16.h, 0, 16),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(6.r),
          ),
          child: const NewRowTile(
            icon: Icons.push_pin_outlined,
            text: Leave,
          ),
        ),
      ),
    );
  }
}