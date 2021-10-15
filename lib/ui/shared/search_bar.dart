import 'package:flutter/material.dart';
import 'package:hng/constants/app_strings.dart';

import '../../general_widgets/easy_container.dart';
import '../../utilities/constants.dart';
import 'text_styles.dart';

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
        child: EasyContainer(
          height: 50,
          radius: 7,
          padding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
          alignment: Alignment.centerLeft,
          borderWidth: 1.5,
          borderColor: Colors.grey[300],
          child: Text(
            JumpTo,
            style: AppTextStyle.darkGreySize14,
          ),
        ),
      ),
    );
  }
}
