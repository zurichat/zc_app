import 'package:flutter/material.dart';
import 'package:zurichat/models/user_post.dart';
import 'package:zurichat/utilities/constants/colors.dart';

import 'package:zurichat/utilities/constants/text_styles.dart';
import 'package:zurichat/utilities/enums.dart';
import 'package:zurichat/utilities/utilities.dart';

class PostFilesDisplay extends StatelessWidget {
  const PostFilesDisplay({Key? key, required this.postFiles}) : super(key: key);
  final List<PostFiles>? postFiles;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10),
      child: ListView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: postFiles!.length,
          itemBuilder: (context, index) {
            return InkWell(
              onTap: () => openUrl(postFiles![index].srcLink),
              child: Container(
                margin: const EdgeInsets.symmetric(vertical: 5),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border:
                        Border.all(color: AppColors.greyishColor, width: 1)),
                padding: const EdgeInsets.all(5),
                child: Row(
                  children: [
                    Icon(_fileImage(postFiles![index].type),
                        size: 50, color: AppColors.zuriPrimaryColor),
                    const SizedBox(width: 5),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "${postFiles![index].fileName}",
                          style: AppTextStyle.darkGreySize16Bold,
                        ),
                        const SizedBox(height: 1),
                        Text(
                          "${postFiles![index].size} ${postFiles![index].fileName!.split('.').last}",
                        )
                      ],
                    ),
                  ],
                ),
              ),
            );
          }),
    );
  }
}

IconData _fileImage(PostFileType fileType) {
  switch (fileType) {
    case PostFileType.app:
      return Icons.android_outlined;
    case PostFileType.text:
      return Icons.description_outlined;
  }
}
