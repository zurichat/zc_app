import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:zurichat/utilities/constants/colors.dart';
import 'package:zurichat/utilities/constants/text_styles.dart';

class WorkSpaceDisplayInfo extends StatelessWidget {
  final String? imageUrl;
  final String? workSpaceTitle;
  final String? workSpaceSlackUrl;

  const WorkSpaceDisplayInfo(
      {Key? key, this.imageUrl, this.workSpaceTitle, this.workSpaceSlackUrl})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final dark = Theme.of(context).brightness == Brightness.dark;
    return Row(
      children: [
        GestureDetector(
          onTap: () {},
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                height: MediaQuery.of(context).size.height * 0.05,
                width: MediaQuery.of(context).size.height * 0.05,
                margin: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color:
                      !dark ? AppColors.darkModeColor : AppColors.whiteColor,
                  borderRadius: BorderRadius.circular(5),
                ),
                clipBehavior: Clip.antiAlias,
                child: imageUrl != null && imageUrl!.isNotEmpty
                    ? CachedNetworkImage(
                        imageUrl: imageUrl!,
                        fit: BoxFit.cover,
                      )
                    : Image.asset(
                        'assets/logo/new_zuri_logo.png',
                        fit: BoxFit.cover,
                      ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    workSpaceTitle?.toUpperCase() ?? "",
                    style: dark
                        ? AppTextStyle.whiteSize16Bold
                        : AppTextStyle.darkGreySize16Bold,
                  ),
                  Text(workSpaceSlackUrl?.toLowerCase() ?? "",
                      style: dark
                          ? AppTextStyle.whiteSize14
                          : AppTextStyle.darkGreySize14),
                ],
              )
            ],
          ),
        )
      ],
    );
  }
}
