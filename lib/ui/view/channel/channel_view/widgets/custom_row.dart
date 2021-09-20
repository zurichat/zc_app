import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hng/ui/shared/colors.dart';

import '../channel_page_viewmodel.dart';

class CustomRow extends StatelessWidget {
  final ChannelPageViewModel model;

  CustomRow({Key? key, required this.model}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      // crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Column(
          children: [
            GestureDetector(
              onTap: () {
                model.navigateToChannelEdit();
              },
              child: const CircleAvatar(
                  radius: 30,
                  backgroundColor: AppColors.lightGreen,
                  child: ImageIcon(AssetImage('assets/channel_page/edit.png'))),
            ),
            const SizedBox(height: 5),
            const Text(
              'Add Description',
              style: TextStyle(
                color: AppColors.greyishColor,
                fontSize: 14,
              ),
            )
          ],
        ),
        const SizedBox(width: 30),
        Column(
          children: [
            GestureDetector(
              onTap: () {}, //pressed,
              child: const CircleAvatar(
                radius: 30,
                backgroundColor: AppColors.lightGreen,
                child: Icon(
                  Icons.person_add_alt_1_sharp,
                  color: AppColors.greyishColor,
                ),
              ),
            ),
            const SizedBox(height: 5),
            const Text(
              'Add People',
              style: TextStyle(
                color: AppColors.greyishColor,
                fontSize: 14,
              ),
            )
          ],
        ),
      ],
    );
  }
}
