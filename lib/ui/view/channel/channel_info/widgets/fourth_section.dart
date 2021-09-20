import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:hng/ui/shared/colors.dart';
import 'package:hng/ui/view/channel/channel_info/widgets/textstyles.dart';

class FourthSection extends StatelessWidget {
  const FourthSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      alignment: Alignment.center,
      margin: const EdgeInsets.only(right: 8, left: 8, bottom: 16),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(6),
          border: Border.all(width: 1.0, color: AppColors.borderColor)),
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.only(
              left: 9,
              top: 13,
              bottom: 10,
            ),
            child: const Icon(
              Icons.push_pin_outlined,
              color: AppColors.deepBlackColor,
              size: 28,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
              left: 11,
              top: 17,
              bottom: 18,
            ),
            child: TextButton(
              onPressed: (){},
              child: Text(
              'Pinned messages (1)',
              style: nameStyle(),
            ),
            )
          ),
        ],
      ),
    );
  }
}
