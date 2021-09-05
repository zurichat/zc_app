import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:hng/ui/shared/colors.dart';
import 'package:hng/ui/view/channel_info/widgets/textstyles.dart';

class SecondSection extends StatelessWidget {
  const SecondSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      alignment: Alignment.center,
      margin: const EdgeInsets.only(right: 5, left: 5, bottom: 10),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(2),
          border: Border.all(width: 1.0, color: AppColors.borderColor)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              // ignore: avoid_unnecessary_containers
              Container(
                margin: const EdgeInsets.only(
                  left: 9,
                  top: 19,
                ),
                child: const Icon(
                  Icons.notifications_none_outlined,
                  color: AppColors.deepBlackColor,
                  size: 28,
                ),
              ),

              Container(
                margin: const EdgeInsets.only(
                  left: 11,
                  top: 19,
                ),
                child: Text(
                  'Notification',
                  style: descriptionStyle(),
                ),
              )
            ],
          ),
          Container(
            margin: const EdgeInsets.only(
              left: 48,
            ),
            child: Text(
              'Every New Message',
              style: faintTextStyle(),
            ),
          ),
          Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  margin: const EdgeInsets.only(left: 48, top: 19, bottom: 19),
                  child: Text(
                    'Mute Channel',
                    style: descriptionStyle(),
                  ),
                ),
                Container(
                  child: const Icon(
                    Icons.toggle_off_sharp,
                    color: AppColors.faintTextColor,
                    size: 40,
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
