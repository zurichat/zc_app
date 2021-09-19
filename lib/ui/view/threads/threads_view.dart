import 'package:flutter/material.dart';
import 'package:hng/general_widgets/custom_text.dart';
import 'package:hng/models/user_post.dart';
import 'package:hng/ui/shared/colors.dart';
import 'package:hng/ui/shared/shared.dart';
import 'package:stacked/stacked.dart';
import 'threads_viewmodel.dart';
import 'widgets/emojis.dart';

class ThreadsView extends StatelessWidget {
  const ThreadsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<ThreadsViewModel>.reactive(
      builder: (context, model, child) => Scaffold(
        appBar: AppBar(
          title: CustomText(
            text: 'Threads',
            fontWeight: FontWeight.bold,
          ),
          leading: IconButton(
            icon: Icon(Icons.chevron_left),
            onPressed: model.exitPage,
          ),
          elevation: 1,
        ),
        body: RefreshIndicator(
          color: AppColors.zuriPrimaryColor,
          onRefresh: () {
            return Future.delayed(
              Duration(seconds: 5),
            );
          },
          child: SingleChildScrollView(
            physics: const AlwaysScrollableScrollPhysics(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.max,
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                  child: CustomText(
                    text: 'No new replies',
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                ListView.builder(
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: model.userPosts.length,
                    itemBuilder: (ctx, index) {
                      return ItemCard(model.userPosts[index]);
                    }),
              ],
            ),
          ),
        ),
      ),
      viewModelBuilder: () => ThreadsViewModel(),
    );
  }
}

class ItemCard extends ViewModelWidget<ThreadsViewModel> {
  const ItemCard(
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
            subtitle: CustomText(
              text: 'You, Jane and 2 others',
              fontSize: 12,
              fontWeight: FontWeight.w400,
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
                      Wrap(
                        spacing: 5,
                        runSpacing: 5,
                        children: [
                          for (Widget item in userPost!.postEmojis ?? []) item,
                          Container(
                              height: 30,
                              decoration: BoxDecoration(
                                  color: Colors.black12,
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(30))),
                              child: IconButton(
                                onPressed: () => model.addEmojis(userPost!.id),
                                icon: Icon(
                                  Icons.emoji_emotions_outlined,
                                  size: 14,
                                ),
                              )),
                        ],
                      ),
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
                      userPost!.userThreadPosts != null
                          ? ListView.builder(
                              physics: NeverScrollableScrollPhysics(),
                              shrinkWrap: true,
                              itemCount: userPost!.userThreadPosts!.length,
                              itemBuilder: (ctx, index) {
                                return ThreadPost(
                                    userPost!.userThreadPosts![index]);
                              })
                          : Container(),
                      SizedBox(height: 15),
                      MaterialButton(
                        onPressed: () {},
                        shape: RoundedRectangleBorder(
                            side: BorderSide(width: 1),
                            borderRadius: BorderRadius.all(Radius.circular(5))),
                        child: CustomText(
                            text: "Reply", fontWeight: FontWeight.w500),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class ThreadPost extends StatelessWidget {
  const ThreadPost(this.userThreadPost, {Key? key})
      : super(
          key: key,
        );

  final UserThreadPost userThreadPost;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 10),
      color: AppColors.whiteColor,
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
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
                          image: AssetImage("${userThreadPost.userImage}")),
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
                              text: '${userThreadPost.displayName}',
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Icon(
                            Icons.looks_6,
                            color: Colors.blue,
                            size: 18,
                          ),
                          SizedBox(width: 2),
                          CustomText(
                            text: "${userThreadPost.lastSeen}",
                            fontSize: 12,
                            fontWeight: FontWeight.w400,
                          ),
                        ],
                      ),
                      SizedBox(height: 10),
                      RichText(text: userThreadPost.message),
                      SizedBox(height: 10),
                      Wrap(
                        spacing: 5,
                        runSpacing: 5,
                        children: [
                          for (Widget item in userThreadPost.postEmojis ?? [])
                            item
                        ],
                      ),
                      SizedBox(height: 15),
                    ],
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
