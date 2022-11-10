import 'package:flutter/material.dart';
import 'package:zurichat/ui/shared/shared.dart';
import 'package:zurichat/utilities/constants/text_styles.dart';

class ProfilePageHead extends StatelessWidget {
  const ProfilePageHead(
      {Key? key,
      this.image,
      this.name,
      this.currentStatus,
      this.isActive = true})
      : super(key: key);

  final String? image;
  final String? name;
  final String? currentStatus;
  final bool isActive;

  @override
  Widget build(BuildContext context) {
    final bool dark = Theme.of(context).brightness == Brightness.dark;

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
                  color: isActive
                      ? AppColors.zuriPrimaryColor
                      : AppColors.greyishColor,
                ),
              ),
            ],
          ),
        ),
        const SizedBox(width: 10),
        Flexible(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '$name',
                style: dark
                    ? AppTextStyle.whiteSize16Bold
                    : AppTextStyle.darkGreySize16Bold,
              ),
              const SizedBox(height: 5),
              Text(
                '$currentStatus',
                style: dark
                    ? AppTextStyle.whiteSize14
                    : AppTextStyle.lightGreySize14,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
