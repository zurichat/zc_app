import 'package:flutter/material.dart';
import 'package:zurichat/utilities/constants/app_strings.dart';
import 'package:zurichat/ui/shared/dumb_widgets/unread_count.dart';
import 'package:zurichat/utilities/constants/text_styles.dart';

class DMMessageUnread extends StatelessWidget {
  const DMMessageUnread({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Row(
        children: [
          const SizedBox(width: 5),
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
          const SizedBox(width: 15),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'OyinkaUA 4️⃣',
                style: AppTextStyle.darkGreySize16Bold,
              ),
              const SizedBox(height: 5),
              Text('You: Have you been promoted?',
                  style: AppTextStyle.lightGreySize14),
            ],
          ),
          const Spacer(),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                '1m',
                style: AppTextStyle.lightGreySize12,
              ),
              const SizedBox(height: 5),
              const UnreadCount(count: 3),
            ],
          ),
        ],
      ),
    );
  }
}
