import 'package:flutter/material.dart';
import 'package:hng/constants/app_strings.dart';

import '../../../shared/shared.dart';

class DMMessageUnread extends StatelessWidget {
  const DMMessageUnread({
    Key? key,
  }) : super(key: key);

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
                'OyinkaUA 4️⃣',
                style: AppTextStyles.body1Bold,
              ),
              const SizedBox(height: 5),
              const Text(
                'You: Have you been promoted?',
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
              AppTextStyles.unreadCount(3)
            ],
          ),
        ],
      ),
    );
  }
}
