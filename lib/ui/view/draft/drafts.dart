import 'package:flutter/material.dart';
import 'package:hng/ui/shared/shared.dart';
import 'package:hng/ui/view/draft/draft_viewmodel.dart';

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
            await model.navigateToThread(route['userPost'].id);
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
          time,
          style: AppTextStyles.body2Bold,
        ),
      ),
    );
  }
}
