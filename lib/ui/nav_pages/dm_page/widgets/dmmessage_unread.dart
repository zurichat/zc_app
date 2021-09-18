import 'package:flutter/material.dart';
import 'package:hng/app/app.locator.dart';
import 'package:hng/app/app.router.dart';
import 'package:stacked_services/stacked_services.dart';

import '../../../shared/shared.dart';

class DMMessageUnread extends StatelessWidget {
  const DMMessageUnread({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        locator<NavigationService>().navigateTo(Routes.dmUserView);
      },
      child: Row(
        children: [
          Container(
            height: 40,
            width: 40,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(3),
              color: Color(0xff1A61DB),
              image: DecorationImage(
                image: NetworkImage(
                    'https://th.bing.com/th/id/OIP.QHG-JO3iI1u8VQjSkpO0HwHaLH?pid=ImgDet&rs=1'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          SizedBox(width: 20),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'OyinkaUA 4️⃣',
                style: AppTextStyles.body1Bold,
              ),
              SizedBox(height: 5),
              Text(
                'You: Have you been promoted?',
                // style: AppTextStyles.normalText
              ),
            ],
          ),
          Spacer(),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                '1m',
                // style:
                //     AppTextStyles.timestamp,
              ),
              SizedBox(height: 5),
              AppTextStyles.unreadCount(3)
            ],
          ),
        ],
      ),
    );
  }
}
