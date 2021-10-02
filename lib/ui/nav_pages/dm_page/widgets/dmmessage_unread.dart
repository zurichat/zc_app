import 'package:flutter/material.dart';
import 'package:hng/constants/app_strings.dart';
import 'package:hng/ui/nav_pages/dm_page/dm_page_viewmodel.dart';

import '../../../shared/shared.dart';

class DMMessageUnread extends StatelessWidget {
  const DMMessageUnread(this.dm, {
    Key? key,
  }) : super(key: key);
final DmListItem dm; 
  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Row(
        children: [
          Container(
            height: 40,
            width: 40,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(3),
              color: const Color(0xff1A61DB),
              image: const DecorationImage(
                image: NetworkImage(
                  DmUnreadAvatar,
                ),
                fit: BoxFit.cover,
              ),
            ),
          ),
          const SizedBox(width: 20),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                dm.name,
                style: AppTextStyles.body1Bold,
              ),
              const SizedBox(height: 5),
               Text(
                dm.lastMessage,
                // style: AppTextStyles.normalText
              ),
            ],
          ),
          const Spacer(),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
               const Text(
                '1m',
                // style:
                //     AppTextStyles.timestamp,
              ),
              const SizedBox(height: 5),
              AppTextStyles.unreadCount(dm.unread??0)
            ],
          ),
        ],
      ),
    );
  }
}
