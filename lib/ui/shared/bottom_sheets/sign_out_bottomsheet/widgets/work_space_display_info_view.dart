import 'package:flutter/material.dart';

import 'package:hng/ui/shared/text_styles.dart';

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
                  Text(
                    workSpaceTitle?.toUpperCase() ?? "",
                    style: AppTextStyle.darkGreySize16,
                  ),
                  Text(
                    workSpaceSlackUrl?.toLowerCase() ?? "",
                    style: AppTextStyle.darkGreySize16,
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
