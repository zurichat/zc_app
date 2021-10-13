import 'package:flutter/material.dart';
import 'package:zurichat/ui/shared/styles.dart';

class DraftedItemWidget extends StatelessWidget {
  const DraftedItemWidget({
    this.username,
    this.message,
    this.time,
    Key? key,
  }) : super(key: key);
  final String? username, message, time;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: const EdgeInsets.all(10.0),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Row(
              children: [
                Expanded(
                  flex: 1,
                  child: Text(
                    "$username",
                    overflow: TextOverflow.ellipsis,
                    style: AppTextStyles.body1Bold,
                  ),
                ),
                Text(
                  "$time",
                  overflow: TextOverflow.ellipsis,
                  style: AppTextStyles.normalText,
                ),
              ],
            ),
            const SizedBox(
              height: 6,
            ),
            Text(
              "$message",
              overflow: TextOverflow.ellipsis,
              style: AppTextStyles.normalText,
            ),
          ]),
        ),
        const Divider(
          thickness: 1.0,
        ),
      ],
    );
  }
}
