import 'package:flutter/material.dart';
import 'package:hng/app/app.locator.dart';
import 'package:hng/app/app.router.dart';
import 'package:hng/ui/shared/styles.dart';
import 'package:stacked_services/stacked_services.dart';

class DMMessageRead extends StatelessWidget {
  const DMMessageRead({
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
                    'https://th.bing.com/th/id/OIP.Obw6BUTUPdQGToOSCz5t8QHaHC?pid=ImgDet&w=549&h=522&rs=1'),
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
                'Pappin 4️⃣',
                style: AppTextStyles.body1Bold,
              ),
              SizedBox(height: 5),
              Text(
                'Can i have your number?',
                // style: AppTextStyles.normalText,
              ),
            ],
          ),
          Spacer(),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                '1d',
                // style: AppTextStyles.timestamp,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
