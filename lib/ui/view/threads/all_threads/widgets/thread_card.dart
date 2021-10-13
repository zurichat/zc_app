import 'package:flutter/material.dart';
import 'package:hng/constants/app_strings.dart';
import 'package:hng/ui/shared/text_styles.dart';
import 'package:stacked/stacked.dart';

//The screen shown in homepage -> Threads
import '../../../../../general_widgets/channel_icon.dart';

import '../../../../../models/user_post.dart';
import '../../../../shared/shared.dart';
import '../../../../shared/smart_widgets/thread_card/thread_card_view.dart';
import '../threads_viewmodel.dart';

class ThreadCard extends ViewModelWidget<ThreadsViewModel> {
  const ThreadCard(
    this.userPost, {
    Key? key,
  }) : super(key: key, reactive: true);

  final UserPost? userPost;

  @override
  Widget build(BuildContext context, ThreadsViewModel viewModel) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
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
                const SizedBox(width: 5),
                Text(
                  userPost!.channelName ?? '',
                  style: AppTextStyle.darkGreySize16,
                ),
              ],
            ),
            subtitle: Text(
              YouAndOthers,
              style: AppTextStyle.lightGreySize12,
            ),
          ),
          ThreadCardView.main(userPost),
          userPost!.userThreadPosts != null
              ? ListView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: userPost!.userThreadPosts!.length,
                  itemBuilder: (ctx, index) {
                    return GestureDetector(
                      onTap: () => viewModel.navigateToThread(userPost),
                      child: ThreadCardView.threadPost(
                        userPost!.userThreadPosts![index],
                      ),
                    );
                  })
              : Container(),
          Padding(
            padding: const EdgeInsets.only(left: 60),
            child: MaterialButton(
              //TODO navigate to details page and focus input
              onPressed: () => viewModel.navigateToThread(userPost),

              shape: RoundedRectangleBorder(
                side: BorderSide(
                  width: 1,
                  color: Theme.of(context).textTheme.bodyText1!.color ??
                      AppColors.zuriPrimaryColor,
                ),
                borderRadius: const BorderRadius.all(
                  Radius.circular(5),
                ),
              ),
              child: Text(
                Reply,
                style: AppTextStyle.darkGreySize16,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
