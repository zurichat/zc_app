import 'package:flutter/material.dart';
import 'package:zurichat/ui/shared/shared.dart';
import 'package:zurichat/utilities/constants/app_strings.dart';

import '../../../utilities/constants/text_styles.dart';

class JumpToSearchBar extends StatelessWidget {
  final Function() onTap;
  final double left;
  final double right;

  const JumpToSearchBar(
      {Key? key,
      required this.onTap,
      this.left = zSideMargin,
      this.right = zSideMargin})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: EdgeInsets.fromLTRB(left, 0, right, 0),
        child: Container(
          height: 50,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(7),
              border:
                  Border.all(color: AppColors.greyBackgroundColor, width: 1.5)),
          padding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
          alignment: Alignment.centerLeft,
          child: Text(
            JumpTo,
            style: AppTextStyle.darkGreySize14,
          ),
        ),
      ),
    );
  }
}
