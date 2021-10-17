import 'package:flutter/material.dart';
import 'package:zurichat/models/user_post.dart';
import 'package:zurichat/ui/shared/text_styles.dart';
import 'package:zurichat/ui/view/draft/draft_viewmodel.dart';
import 'package:zurichat/ui/view/threads/test_data.dart';
import 'package:intl/intl.dart';

class CustomListTile extends StatelessWidget {
  const CustomListTile({
    Key? key,
    required this.text,
    required this.subtitle,
    required this.route,
    required this.time,
    required this.model,
  }) : super(key: key);

  final String text;
  final String subtitle;
  final String time;
  final Map route;
  final DraftViewModel model;

  @override
  Widget build(BuildContext context) {
    var date = DateTime.parse(time);
    String dateTime =
        '${DateFormat.MMMd().format(date)} at ${DateFormat.jm().format(date)}';
    return InkWell(
      onTap: () async {
        if (route['receiverName'] != null) {
          await model.navigateToDmUserView();
        } else if (route['channelId'] != null) {
          await model.navigateToChannelPage('${route['channelName']}',
              '${route['channelId']}', route['membersCount'], route['public']);
        } else {
          List<UserPost> userPosts = userPost;
          for (UserPost item in userPosts) {
            if (route['userPostId'] == item.id) {
              UserPost currentUserPost = item;
              await model.navigateToThread(currentUserPost);
            }
          }
        }
        model.widgetBuilderList.clear();
        model.drafts;
        model.rebuild();
      },
      child: ListTile(
        title: Text(
          text,
          style: AppTextStyle.darkGreySize16Bold,
        ),
        subtitle: Text(
          subtitle,
          style: AppTextStyle.lightGreySize14,
        ),
        trailing: Text(
          // '$dateFormat',
          dateTime,
          style: AppTextStyle.lightGreySize14,
        ),
      ),
    );
  }
}
