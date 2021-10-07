import 'package:flutter/material.dart';
import 'package:hng/models/user_post.dart';
import 'package:hng/ui/shared/smart_widgets/thread_card/thread_card_view.dart';
import 'package:hng/ui/view/channel/channel_view/channel_page_viewmodel.dart';
import 'package:hng/utilities/enums.dart';
import 'package:hng/utilities/utilities.dart';
import 'package:stacked/stacked.dart';

class ChannelChat extends ViewModelWidget<ChannelPageViewModel> {
  const ChannelChat({
    Key? key,
    this.channelId,
  }) : super(key: key);
  final String? channelId;

  @override
  Widget build(BuildContext context, ChannelPageViewModel viewModel) {
    String link = 'https://en.wikipedia.org/wiki/"Hello,_World!"_program';
    UserPost userPost = UserPost(
      id: "id1",
      userId: "userId",
      channelId: "hchannel 3",
      displayName: "Paul Imoke",
      userImage: "assets/images/chimamanda.png",
      message:
          "@mark Thanks for HNG. It was fun, here's a link to a wiki on hello world $link ",
      statusIcon: "🔟",
      lastSeen: "30 Oct 2021",
      channelName: "channelName",
      channelType: ChannelType.personal,
      postDate: "",
      postSnapshotLinks: <PostSnapshotLinks>[
        PostSnapshotLinks(
          title: "Bruno Simon",
          linkTitleText: '"Hello, World!" program - Wikipedia',
          logo:
              'https://en.wikipedia.org/static/images/project-logos/enwiki.png',
          siteDescription:
              'A "Hello, World!" program generally is a computer program that outputs or displays the message "Hello, World!".',
          siteImageLink:
              'https://miro.medium.com/max/1024/0*4ty0Adbdg4dsVBo3.png',
          srcLink: 'https://en.wikipedia.org/wiki/%22Hello,_World!%22_program',
        )
      ],
      postAudioFiles: const <PostFiles>[],
      userThreadPosts: <UserThreadPost>[
        UserThreadPost(
            id: "1",
            displayName: 'Mark Essien',
            message:
                "HNGi8 was amazing as usual, met a lot a lovely interns, can't wait for HNGi9 🤩💪🏽",
            userImage:
                "https://en.wikipedia.org/static/images/project-logos/enwiki.png")
      ],
      postFiles: <PostFiles>[
        PostFiles(
            fileName: "my doc.txt",
            id: '1',
            size: '300 KB',
            srcLink: 'google.com',
            type: PostFileType.text),
        PostFiles(
            fileName: "my doc.apk",
            id: '1',
            size: '300 KB',
            srcLink: 'google.com',
            type: PostFileType.app),
      ],
      postQuotedReplies: <UserThreadPost>[
        UserThreadPost(
            id: "1",
            displayName: 'Mark Essien',
            message:
                "HNGi8 was amazing as usual, met a lot a lovely interns, can't wait for HNGi9 🤩💪🏽",
            userImage:
                "https://en.wikipedia.org/static/images/project-logos/enwiki.png")
      ],
      postMediaFiles: <PostFiles>[
        PostFiles(
            id: "id",
            srcLink:
                "https://s.yimg.com/uu/api/res/1.2/ovQ1C3G9PCKdeGhbHEnTJw--~B/Zmk9ZmlsbDtoPTM4MDt3PTY3NTthcHBpZD15dGFjaHlvbg--/https://s.yimg.com/os/creatr-uploaded-images/2020-05/862828a0-8f17-11ea-a7fb-b0a9ec8182dd.cf.webp",
            type: PostFileType.app,
            size: "300 KB",
            fileName: "Image1.png"),
        PostFiles(
            id: "id",
            srcLink:
                "https://en.wikipedia.org/static/images/project-logos/enwiki.png",
            type: PostFileType.app,
            size: "300 KB",
            fileName: "Image1.png"),
        PostFiles(
            id: "id",
            srcLink:
                "https://mk0soundguyshosprmrt.kinstacdn.com/wp-content/uploads/2020/07/Microsoft-Surface-Headphones-2-5-of-5-1024x576.jpg",
            type: PostFileType.app,
            size: "300 KB",
            fileName: "Image1.png"),
        PostFiles(
            id: "id",
            srcLink:
                "https://cdn.vox-cdn.com/thumbor/7_xbHBb3UgpUxZ1KunU7ou_nmaY=/0x0:2040x1360/1570x883/filters:focal(1123x654:1449x980):format(webp)/cdn.vox-cdn.com/uploads/chorus_image/image/66831516/C0E84DFF_8EB1_403C_9CA6_B8B7FF1B8EEF.0.jpeg",
            type: PostFileType.app,
            size: "300 KB",
            fileName: "Image1.png"),
      ],
      postEmojis: <PostEmojis>[PostEmojis(id: 2, postEmoji: "✨")],
    );
    return Container(
        child:
            // !nullListChecker(viewModel.channelUserMessages)
            ThreadCardView.threadChannelMain(userPost)
        // ? ListView.builder(
        //     physics: const NeverScrollableScrollPhysics(),
        //     shrinkWrap: true,
        //     itemCount: viewModel.channelUserMessages!.length,
        //     itemBuilder: (context, index) => ThreadCardView.threadChannelMain(
        //         viewModel.channelUserMessages![index]),
        //   )
        // : Container(),
        );
  }
}
