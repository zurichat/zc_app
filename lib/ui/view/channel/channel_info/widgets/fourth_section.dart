import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hng/ui/view/channel/channel_info/widgets/textstyles.dart';

import '../../../../shared/colors.dart';
import '../../../../shared/styles.dart';

class FourthSection extends StatelessWidget {
  const FourthSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      alignment: Alignment.center,
      margin: const EdgeInsets.only(right: 5, left: 5, bottom: 15),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(2),
          border: Border.all(width: 1.0, color: AppColors.borderColor)),
      child: Row(
        children: [
          Container(
            margin: const EdgeInsets.only(
              left: 9,
              top: 19,
            ),
            child: const Icon(
              Icons.push_pin_outlined,
              color: AppColors.deepBlackColor,
              size: 28,
            ),
          ),
          Container(
            margin: const EdgeInsets.only(
              left: 11,
              top: 19,
              bottom: 10,
            ),
            child: Text(
              'Pinned messages (1)',
              style: descriptionStyle(),
            ),
          ),
        ],
      ),
    );
  }
}
