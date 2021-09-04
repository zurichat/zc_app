import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hng/ui/shared/colors.dart';
import 'package:hng/ui/view/channel_info/widgets/textstyles.dart';

class SixthSection extends StatelessWidget {
  const SixthSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      alignment: Alignment.center,
      margin: const EdgeInsets.only(right: 5, left: 5, bottom: 15),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(2),
          border: Border.all(width: 1.0, color: AppColors.borderColor)),
      child: Column(
        children: [
          Row(
            children: [
              Container(
                margin: const EdgeInsets.only(
                  left: 9,
                  top: 19,
                ),
                child: const Icon(
                  Icons.lock_outline,
                  color: AppColors.deepBlackColor,
                  size: 28,
                ),
              ),
              Container(
                margin: const EdgeInsets.only(
                  left: 11,
                  top: 19,
                  bottom: 10,
                ),
                child: Text(
                  'Archive Channel',
                  style: archiveTextStyle(),
                ),
              ),
            ],
          ),
          Container(
              alignment: Alignment.center,
              margin: const EdgeInsets.only(left: 45, bottom: 10),
              child: const Text(
                'Archiving the channel will remover it from the channel list, and close it from all members.'
                'All chats and filse will still be stored and searchable',
                style: TextStyle(),
              )),
        ],
      ),
    );
  }
}
