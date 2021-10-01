import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hng/ui/shared/smart_widgets/expandable_textfield/expandable_textfield_screen.dart';
import 'package:stacked/stacked.dart';

import '../../../../general_widgets/channel_icon.dart';
import '../../../../general_widgets/custom_text.dart';
import '../../../../models/user_post.dart';
import '../../../shared/colors.dart';
import '../../../shared/smart_widgets/thread_card/thread_card_view.dart';
import 'thread_detail_viewmodel.dart';

class ThreadDetailView extends HookWidget {
  const ThreadDetailView(this.userPost, {Key? key}) : super(key: key);
  final UserPost? userPost;

  @override
  Widget build(BuildContext context) {
    final _scrollController = useScrollController();
    final _messageController = useTextEditingController();
    return ViewModelBuilder<ThreadDetailViewModel>.reactive(
      builder: (context, model, child) => Scaffold(
        appBar: AppBar(
          elevation: 0,
          title: const CustomText(text: 'Threads', fontWeight: FontWeight.bold),
          leading: IconButton(
              onPressed: model.exitPage,
              icon: const Icon(
                Icons.arrow_back_ios,
              )),
        ),
        body: ExpandableTextFieldScreen(
          hintText: 'Add a Reply',
          sendMessage: (String message) {
            model.addReply(
              userPost!,
              message,
            );

            _messageController.text = '';
            FocusScope.of(context).requestFocus(FocusNode());
            _scrollController
                .jumpTo(_scrollController.position.maxScrollExtent);
          },
          widget: SafeArea(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                  child: Row(
                    children: [
                      const Text('Message in'),
                      TextButton.icon(
                        onPressed: () {},
                        icon: ChannelIcon(channelType: userPost!.channelType!),
                        label: Text(
                          '${userPost!.channelName}',
                        ),
                        style: TextButton.styleFrom(
                          padding: const EdgeInsets.all(0),
                        ),
                      ),
                    ],
                  ),
                ),
                ThreadCardView.detail(userPost!),
                const Padding(
                  padding: EdgeInsets.symmetric(vertical: 5),
                  child: Divider(
                    color: AppColors.borderColor,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      // ignore: todo
                      //TODO Change to brand colors
                      const Divider(height: 0, color: Color(0xFF999999)),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          IconButton(
                              onPressed: () {},
                              icon: const Icon(
                                Icons.forward_outlined,
                                color: AppColors.greyishColor,
                              )),
                          IconButton(
                              onPressed: model.showThreadOptions,
                              icon: const Icon(Icons.more_vert_rounded,
                                  color: AppColors.greyishColor)),
                        ],
                      )
                    ],
                  ),
                ),
                const Padding(
                  padding: const EdgeInsets.symmetric(vertical: 5),
                  child: Divider(
                    color: AppColors.borderColor,
                  ),
                ),
                Expanded(
                  child: userPost!.userThreadPosts != null
                      ? ListView.builder(
                          controller: _scrollController,
                          itemCount: userPost!.userThreadPosts!.length,
                          itemBuilder: (context, index) =>
                              ThreadCardView.threadPost(
                                  userPost!.userThreadPosts![index]),
                        )
                      : Container(),
                )
              ],
            ),
          ),
        ),
      ),
      viewModelBuilder: () => ThreadDetailViewModel(),
    );
  }
}
