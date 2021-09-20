import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../shared/colors.dart';
import 'textstyles.dart';

class ThirdSection extends StatelessWidget {
  const ThirdSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      alignment: Alignment.center,
      margin: const EdgeInsets.only(right: 8, left: 8, top: 10,bottom: 16),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(6),
          border: Border.all(width: 1.0, color: AppColors.borderColor)),
      child: Column(
        children: [
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(
                  left: 9,
                  top: 19,
                ),
                child: const Icon(
                  Icons.group_outlined,
                  color: AppColors.deepBlackColor,
                  size: 28,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                  left: 11,
                  top: 19,
                ),
                child: Text(
                  'Members (5)',
                  style: nameStyle(),
                ),
              ),
            ],
          ),
          Divider(
            thickness: 0.5,
            color: AppColors.deepBlackColor.withOpacity(0.5),
            indent: 53,
            endIndent: 33,
          ),
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(
                  left: 9,
                  top: 13,
                ),
                child: const Icon(
                  Icons.person_add_alt_1_outlined,
                  color: AppColors.deepBlackColor,
                  size: 28,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                  left: 11,
                  top: 13,
                ),
                child: Text(
                  'Add People',
                  style: nameStyle(),
                ),
              ),
            ],
          ),
          Divider(
            thickness: 0.5,
            color: AppColors.deepBlackColor.withOpacity(0.5),
            indent: 53,
            endIndent: 33,
          ),
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(
                  left: 9,
                  top: 13,
                ),
                child: const Icon(
                  Icons.dashboard_outlined,
                  color: AppColors.deepBlackColor,
                  size: 28,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                  left: 11,
                  top: 13,
                ),
                child: Text(
                  'Plugins (1)',
                  style: nameStyle(),
                ),
              ),
            ],
          ),
          Divider(
            thickness: 0.5,
            color: AppColors.deepBlackColor.withOpacity(0.5),
            indent: 53,
            endIndent: 33,
          ),
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(
                  left: 9,
                  top: 13,
                  bottom: 10,
                ),
                child: const Icon(
                  Icons.phone_outlined,
                  color: AppColors.deepBlackColor,
                  size: 28,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                  left: 11,
                  top: 13,
                  bottom: 10,
                ),
                child: Text(
                  'Start a call',
                  style: nameStyle(),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
