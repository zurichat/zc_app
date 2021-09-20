import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hng/ui/shared/colors.dart';
import 'package:hng/ui/view/channel/channel_info/widgets/textstyles.dart';

class SixthSection extends StatelessWidget {
  const SixthSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      alignment: Alignment.center,
      margin: const EdgeInsets.only(right: 8, left: 8, bottom: 243),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(6),
          border: Border.all(width: 1.0, color: AppColors.borderColor)),
      child: Column(
        children: [
          Row(
            children: [
              Padding(
               padding: const EdgeInsets.only(
                  left: 9,
                  top: 19,
                ),
                child: Icon(
                  Icons.archive_outlined,
                  color: AppColors.deepBlackColor,
                  size: 28,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                  left: 11,
                  top: 19,
                ),
                    child: TextButton(
                      onPressed:(){},
                      child: Text(
                    'Archive Channel',
                    style: archiveTextStyle(),
                  ),),
              ),],
          ),
          SizedBox(height: 6),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 64.0,),
            child: Wrap(
              children: [
                Text('Archiving the channel will remover it from the channel list, and close it from all members. ',
                style: descriptionStyle(),),
                Text('All chats and files will still be stored and searchable',
                style: descriptionStyle(),)
              ]
            ),
          ), SizedBox(height: 24)
    ]
                  ),
    );
  }
}
