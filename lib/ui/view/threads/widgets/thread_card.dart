import 'package:flutter/material.dart';
import 'package:hng/general_widgets/custom_text.dart';
import 'package:hng/models/user_post.dart';
import 'package:hng/ui/shared/shared.dart';
import 'package:hng/utilities/enums.dart';
import 'package:stacked/stacked.dart';

import '../threads_viewmodel.dart';
import 'emojis_list.dart';
import 'thread_post.dart';

class ThreadCard extends ViewModelWidget<ThreadsViewModel> {
  const ThreadCard(
    this.userPost, {
    Key? key,
  }) : super(key: key, reactive: true);

  final UserPost? userPost;

  Icon channelIcon() {
    switch (userPost!.channelType) {
      case ChannelType.private:
        return Icon(
          Icons.lock,
          size: 14,
        );
      case ChannelType.public:
        return Icon(
          Icons.tag,
          size: 14,
        );

      case ChannelType.personal:
        return Icon(
          Icons.circle,
          size: 14,
          color: AppColors.zuriPrimaryColor,
        );

      default:
        return Icon(null);
    }
  }

  @override
  Widget build(BuildContext context, ThreadsViewModel model) {
    return Container(
      margin: EdgeInsets.only(bottom: 10),
      color: AppColors.whiteColor,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.max,
        children: [
          ListTile(
            minLeadingWidth: 0,
            minVerticalPadding: 0,
            title: Row(
              children: [
                channelIcon(),
                SizedBox(width: 5),
                CustomText(
                  text: userPost!.channelName ?? '',
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                ),
              ],
            ),
            subtitle: Text(
              'You, Jane and 2 others',
              style: AppTextStyles.subtitle,
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 10),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                    width: 40,
                    height: 40,
                    decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.all(Radius.circular(5)),
                      image: DecorationImage(
                          fit: BoxFit.fill,
                          image: AssetImage("${userPost!.userImage}")),
                    )),
                SizedBox(width: 10),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Flexible(
                            fit: FlexFit.loose,
                            child: CustomText(
                              text: '${userPost!.displayName}',
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Icon(
                            userPost!.statusIcon,
                            color: Colors.blue,
                            size: 18,
                          ),
                          SizedBox(width: 2),
                          CustomText(
                            text: '${userPost!.lastSeen}',
                            fontSize: 12,
                            fontWeight: FontWeight.w400,
                          ),
                        ],
                      ),
                      SizedBox(height: 10),
                      RichText(text: userPost!.message),
                      SizedBox(height: 10),
                      EmojisList(userPost: userPost),
                      SizedBox(height: 15),
                      userPost!.userThreadPosts != null
                          ? TextButton(
                              onPressed: () {},
                              child: CustomText(
                                  text:
                                      "Show ${userPost!.userThreadPosts!.length} more replies",
                                  fontWeight: FontWeight.bold,
                                  color: AppColors.blueColor),
                            )
                          : Container(),
                    ],
                  ),
                )
              ],
            ),
          ),
          userPost!.userThreadPosts != null
              ? ListView.builder(
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: userPost!.userThreadPosts!.length,
                  itemBuilder: (ctx, index) {
                    return ThreadPost(userPost!.userThreadPosts![index]);
                  })
              : Container(),
          Padding(
            padding: EdgeInsets.only(left: 60),
            child: MaterialButton(
              onPressed: () {},
              shape: RoundedRectangleBorder(
                  side: BorderSide(width: 1),
                  borderRadius: BorderRadius.all(Radius.circular(5))),
              child: CustomText(text: "Reply", fontWeight: FontWeight.w500),
            ),
          ),
        ],
      ),
    );
  }
}
