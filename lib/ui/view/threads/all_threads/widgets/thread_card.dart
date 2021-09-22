import 'package:flutter/material.dart';
import 'package:hng/general_widgets/custom_text.dart';
import 'package:hng/models/user_post.dart';
import 'package:hng/ui/shared/shared.dart';
import 'package:hng/ui/shared/smart_widgets/thread_card/thread_card_view.dart';
import 'package:hng/utilities/enums.dart';
import 'package:stacked/stacked.dart';

import '../threads_viewmodel.dart';

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
          ThreadCardView.main(userPost),
          userPost!.userThreadPosts != null
              ? Padding(
                  padding: const EdgeInsets.only(left: 60),
                  child: TextButton(
                    onPressed: () {},
                    child: CustomText(
                        text:
                            "Show ${userPost!.userThreadPosts!.length} more replies",
                        fontWeight: FontWeight.bold,
                        color: AppColors.blueColor),
                  ),
                )
              : Container(),
          userPost!.userThreadPosts != null
              ? ListView.builder(
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: userPost!.userThreadPosts!.length,
                  itemBuilder: (ctx, index) {
                    return GestureDetector(
                        onTap: model.navigateToThread,
                        child: ThreadCardView.threadPost(
                            userPost!.userThreadPosts![index]));
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
