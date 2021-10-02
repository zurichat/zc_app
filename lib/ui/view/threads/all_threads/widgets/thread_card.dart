import 'package:flutter/material.dart';
import 'package:hng/constants/app_strings.dart';
import 'package:stacked/stacked.dart';
//The screen shown in homepage -> Threads
import '../../../../../general_widgets/channel_icon.dart';
import '../../../../../general_widgets/custom_text.dart';
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
                const SizedBox(width: 5),
                CustomText(
                  text: userPost!.channelName ?? '',
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                ),
              ],
            ),
            subtitle: Text(
              YouAndOthers,
              style: AppTextStyles.subtitle,
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
              // ignore: todo
              //TODO navigate to details page and focus input
              onPressed: () => viewModel.navigateToThread(userPost),
              shape: const RoundedRectangleBorder(
                side: BorderSide(width: 1),
                borderRadius: BorderRadius.all(
                  Radius.circular(5),
                ),
              ),
              child: const CustomText(
                text: Reply,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
