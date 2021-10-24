import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:zurichat/models/user_post.dart';
import 'package:zurichat/ui/shared/shared.dart';
import 'package:zurichat/utilities/constants/text_styles.dart';

class QuotedReplies extends StatelessWidget {
  const QuotedReplies({
    Key? key,
    required this.postQuotedReplies,
  }) : super(key: key);

  final List<UserThreadPost>? postQuotedReplies;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10),
      child: ListView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: postQuotedReplies!.length,
        itemBuilder: (context, index) => Container(
          margin: const EdgeInsets.symmetric(vertical: 5),
          padding: const EdgeInsets.only(left: 7),
          decoration: const BoxDecoration(
              border: Border(
                  left: BorderSide(color: AppColors.darkGreyColor, width: 5))),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Flexible(
                    child: CachedNetworkImage(
                        imageUrl: "${postQuotedReplies![index].userImage}",
                        height: 25,
                        width: 25,
                        fit: BoxFit.cover),
                  ),
                  const SizedBox(width: 5),
                  Flexible(
                      child: Text(
                    "${postQuotedReplies![index].displayName}",
                    style: AppTextStyle.darkGreySize16Bold,
                  ))
                ],
              ),
              const SizedBox(height: 10),
              Text(
                "${postQuotedReplies![index].message}",
                overflow: TextOverflow.ellipsis,
                maxLines: 5,
              ),
              const SizedBox(height: 10),
              Text(
                "Posted in ${postQuotedReplies![index].channelName} | ${postQuotedReplies![index].postDate}",
                style: AppTextStyle.lightGreySize14,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
