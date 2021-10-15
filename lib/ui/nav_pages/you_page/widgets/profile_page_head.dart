import 'package:flutter/material.dart';
import 'package:hng/ui/shared/shared.dart';
import 'package:hng/ui/shared/text_styles.dart';

import '../../../shared/colors.dart';

class ProfilePageHead extends StatelessWidget {
  const ProfilePageHead({Key? key, this.image, this.name, this.currentStatus, this.isActive = true})
      : super(key: key);

  final String? image;
  final String? name;
  final String? currentStatus;
  final bool isActive;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      mainAxisSize: MainAxisSize.max,
      children: [
        SizedBox(
          width: 75,
          height: 75,
          child: Stack(
            children: [
              Align(
                alignment: Alignment.bottomLeft,
                child: Container(
                  height: 70,
                  width: 70,
                  decoration: BoxDecoration(
                    color: AppColors.shadowColor,
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: Center(
                    child: Image(
                      image: AssetImage(image ?? dummyUserImage),
                    ),
                  ),
                ),
              ),
              Align(
                alignment: Alignment.topRight,
                child: Icon(
                  Icons.circle,
                  size: 15,
                  color: isActive ? AppColors.zuriPrimaryColor : AppColors.greyishColor,
                ),
              ),
            ],
          ),
        ),
        const SizedBox(width: 10),
        Flexible(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '$name',
                style: AppTextStyle.darkGreySize16Bold,
              ),
              Text(
                '$currentStatus',
                style: AppTextStyle.lightGreySize14,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
