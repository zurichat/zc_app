import 'package:flutter/material.dart';
import 'package:hng/general_widgets/custom_text.dart';
import 'package:hng/ui/shared/colors.dart';

class WorkSpaceDisplayInfo extends StatelessWidget {
  final String? imageUrl;
  final String? workSpaceTitle;
  final String? workSpaceSlackUrl;

  const WorkSpaceDisplayInfo({
    Key? key,
    this.imageUrl,
    this.workSpaceTitle,
    this.workSpaceSlackUrl}): super(key: key);

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
                padding: const EdgeInsets.all(15),
                child: Container(
                  color: Colors.grey,
                  height: 32,
                  width: 32,
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomText(
                    text: workSpaceTitle?.toUpperCase() ?? "",
                    fontSize: 16.0,
                    color: AppColors.zuriTextBodyColor,
                    fontWeight: FontWeight.bold,
                  ),
                  CustomText(
                    text: workSpaceSlackUrl?.toLowerCase() ?? "",
                    fontSize: 14.0,
                    color: AppColors.zuriTextBodyColor,
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