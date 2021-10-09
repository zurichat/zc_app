import 'package:flutter/material.dart';
import 'package:hng/models/user_post.dart';
import 'package:hng/ui/shared/shared.dart';
import 'package:hng/ui/view/draft/draft_viewmodel.dart';
import 'package:hng/utilities/enums.dart';
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
    //TODO : convert the string 'time' to a usuable datetime type
    // var dateFormat = DateFormat('yyyy/MM/dd HH:MM:ss').parse('$time');
    return InkWell(
      onTap:  () async{

          if(route['receiverName'] != null ){
            await model.navigateToDmUserView();
          } else if(route['channelId'] != null){
            await model.navigateToChannelPage(
                '${route['channelName']}',
                '${route['channelId']}',
                route['membersCount'],
                route['public']
            );
          } else{
            ChannelType channelType;
            if(route['userPostChannelType'] == 'private'){
              channelType = ChannelType.private;
            }else if(route['userPostChannelType'] == 'public'){
              channelType = ChannelType.public;
            }else {
              channelType = ChannelType.personal;
            }

            List<PostEmojis> postEmojis = [];
            for(List<String> emoji in route['userPostPostEmojis'] ){
              postEmojis.add(PostEmojis(
                id: int.parse(emoji[1]),
                postEmoji: emoji[2],
                postEmojiCount: int.parse(emoji[3]),
                hasReacted: emoji[3] == 'true' ? true : false
              ));
            }

            UserPost userPost = UserPost(
                id: '${route['userPostId']}',
                channelId: '${route['userPostChannelId']}',
                displayName: '${route['userPostDisplayName']}',
                channelType: channelType,
              channelName: '${route['userPostChannelName']}',
              message: '${route['userPostMessage']}',
              postEmojis: postEmojis

            );
            await model.navigateToThread(userPost);
          }
          model.widgetBuilderList.clear();
          model.drafts;
          model.rebuild();
      },
      child: ListTile(
        title: Text(
          text,
          style: AppTextStyles.heading6.copyWith(fontSize: 18),
        ),
        subtitle: Text(
          subtitle,
          style: AppTextStyles.body1Bold,
        ),
        trailing: Text(
          // '$dateFormat',
          time,
          style: AppTextStyles.body2Bold,
        ),
      ),
    );
  }
}
