import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../shared/colors.dart';
import 'textstyles.dart';

class SecondSection extends StatefulWidget {
  const SecondSection({Key? key}) : super(key: key);

  @override
  State<SecondSection> createState() => _SecondSectionState();
}

class _SecondSectionState extends State<SecondSection> {
  bool _toggled = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      alignment: Alignment.center,
      margin: const EdgeInsets.only(right: 8, left: 8, bottom: 8),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(6),
          border: Border.all(width: 1.0, color: AppColors.borderColor)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              // ignore: avoid_unnecessary_containers
              Padding(
                padding: const EdgeInsets.only(
                  left: 18,
                  top: 26,
                ),
                child: const Icon(
                  Icons.notifications_none_outlined,
                  color: AppColors.deepBlackColor,
                  size: 28,
                ),
              ),

              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 26,
                  vertical: 6,
                ),
                child: Text(
                  'Notification',
                  style: nameStyle(),
                ),
              )
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(
              left: 26,
            ),
            child: Text(
              'Every New Message',
              style: faintTextStyle(),
            ),
          ),
          SizedBox(height: 18),
           SwitchListTile(
                title: Text('Mute',
                style: descriptionStyle(),),
                value: _toggled,
                activeColor: Color(0xff00b87c),
                onChanged: (value) =>
                    setState(() => this._toggled)),
              ],
            ),
    );
  }
}
