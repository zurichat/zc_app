import 'package:flutter/material.dart';
import 'package:zurichat/models/user_post.dart';
import 'package:zurichat/ui/shared/smart_widgets/thread_card/widgets/thread_card_detail.dart';
import 'package:zurichat/ui/shared/smart_widgets/thread_card/widgets/thread_card_main.dart';
import 'package:zurichat/ui/shared/smart_widgets/thread_card/widgets/thread_card_channel_main.dart';
import 'package:zurichat/ui/shared/smart_widgets/thread_card/widgets/thread_card_shared.dart';
import 'package:zurichat/utilities/enums.dart';
import 'package:stacked/stacked.dart';

import 'thread_card_viewmodel.dart';
import 'widgets/thread_card_post.dart';

// ignore: must_be_immutable
class ThreadCardView extends StatelessWidget {
  ThreadCardView.main(this.userPost, {Key? key})
      : _threadCardType = ThreadCardType.threadMain,
        super(key: key);

  ThreadCardView.detail(this.userPost, {Key? key})
      : _threadCardType = ThreadCardType.threadDetail,
        super(key: key);

  ThreadCardView.threadPost(this.userThreadPost, {Key? key})
      : _threadCardType = ThreadCardType.threadPost,
        super(key: key);

  ThreadCardView.threadChannelMain(this.userPost, {Key? key})
      : _threadCardType = ThreadCardType.threadChannelMain,
        super(key: key);
  ThreadCardView.shared(this.userPost, {Key? key})
      : _threadCardType = ThreadCardType.shared,
        super(key: key);

  UserThreadPost? userThreadPost;
  UserPost? userPost;
  final ThreadCardType _threadCardType;

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<ThreadCardViewModel>.reactive(
      builder: (context, model, child) {
        switch (_threadCardType) {
          case ThreadCardType.threadMain:
            return ThreadCardMain(userPost);
          case ThreadCardType.threadDetail:
            return ThreadCardDetail(userPost);
          case ThreadCardType.threadPost:
            return ThreadCardPost(userThreadPost);
          case ThreadCardType.threadChannelMain:
            return ThreadChannelMain(userPost!);
          case ThreadCardType.shared:
            return ThreadCardShared(userPost!);
        }
      },
      viewModelBuilder: () => ThreadCardViewModel(),
    );
  }
}
