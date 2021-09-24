import 'package:flutter/material.dart';
import 'package:hng/general_widgets/channel_icon.dart';
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
                ChannelIcon(channelType: userPost!.channelType!),
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
              ? ListView.builder(
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: userPost!.userThreadPosts!.length,
                  itemBuilder: (ctx, index) {
                    return GestureDetector(
                        onTap: () => model.navigateToThread(userPost),
                        child: ThreadCardView.threadPost(
                            userPost!.userThreadPosts![index]));
                  })
              : Container(),
          Padding(
            padding: EdgeInsets.only(left: 60),
            child: MaterialButton(
              //TODO navigate to details page and focus input
              onPressed: () => model.navigateToThread(userPost),
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
