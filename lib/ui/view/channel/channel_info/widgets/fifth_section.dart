import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:hng/ui/shared/colors.dart';
import 'package:hng/ui/view/channel/channel_info/widgets/textstyles.dart';

class FifthSection extends StatelessWidget {
  const FifthSection({Key? key}) : super(key: key);

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
              Icons.exit_to_app_rounded,
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
              'Leave',
              style: nameStyle(),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
