import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:hng/models/user_post.dart';
import 'package:hng/ui/shared/colors.dart';
import 'package:hng/ui/shared/shared.dart';
import 'package:hng/utilities/utilities.dart';

class SnapshotLinks extends StatelessWidget {
  const SnapshotLinks({Key? key, required this.postSnapshotLinks})
      : super(key: key);
  final List<PostSnapshotLinks>? postSnapshotLinks;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10),
      child: ListView.builder(
          itemCount: postSnapshotLinks!.length,
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemBuilder: (context, index) {
            return Container(
              margin: const EdgeInsets.symmetric(vertical: 5),
              padding: const EdgeInsets.only(left: 7),
              decoration: const BoxDecoration(
                  // borderRadius: BorderRadius.all(Radius.circular(10)),
                  border: Border(
                      left: BorderSide(
                          color: AppColors.darkGreyColor, width: 5))),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  InkWell(
                    onTap: () => openUrl(postSnapshotLinks![index].srcLink),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Flexible(
                              child: CachedNetworkImage(
                                imageUrl: "${postSnapshotLinks![index].logo}",
                                fit: BoxFit.cover,
                                height: 25,
                                width: 25,
                              ),
                            ),
                            const SizedBox(width: 5),
                            Flexible(
                                child: Text(
                                    "${postSnapshotLinks![index].title}",
                                    style: AppTextStyles.bodyBig))
                          ],
                        ),
                        const SizedBox(height: 10),
                        Text(
                          "${postSnapshotLinks![index].linkTitleText}",
                          style: AppTextStyles.body1Bold,
                        ),
                        const SizedBox(height: 5),
                        Text(
                          "${postSnapshotLinks![index].siteDescription}",
                          overflow: TextOverflow.ellipsis,
                          maxLines: 3,
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 15),
                  InkWell(
                    onTap: () {},
                    child: CachedNetworkImage(
                      imageUrl: "${postSnapshotLinks![index].siteImageLink}",
                    ),
                  )
                ],
              ),
            );
          }),
    );
  }
}
