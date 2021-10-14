import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:hng/general_widgets/custom_text.dart';
import 'package:hng/ui/shared/colors.dart';

class WorkSpaceDisplayInfo extends StatelessWidget {
  final String? imageUrl;
  final String? workSpaceTitle;
  final String? workSpaceSlackUrl;

  const WorkSpaceDisplayInfo(
      {Key? key, this.imageUrl, this.workSpaceTitle, this.workSpaceSlackUrl})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
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
                  color: AppColors.whiteColor,
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
                  CustomText(
                    text: workSpaceTitle?.toUpperCase() ?? "",
                    fontSize: 16.0,
                    fontWeight: FontWeight.bold,
                  ),
                  CustomText(
                    text: workSpaceSlackUrl?.toLowerCase() ?? "",
                    fontSize: 14.0,
                    fontWeight: FontWeight.w300,
                  ),
                ],
              )
            ],
          ),
        )
      ],
    );
  }
}
