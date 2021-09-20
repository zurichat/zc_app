import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:hng/ui/view/channel/channel_info/channel_info_view_model.dart';
import '../../../../shared/colors.dart';
import 'textstyles.dart';

class EditButton extends StatelessWidget {
  ChannelInfoViewModel model;
  EditButton({Key? key, required this.model}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      //height: 48,
      width: MediaQuery.of(context).size.width,
      alignment: Alignment.center,
      //margin: const EdgeInsets.only(right: 5, left: 5, bottom: 15),
      /*decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(2),
          border: Border.all(width: 1.0, color: AppColors.borderColor)),*/
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Text(
          'Edit',
          style: greenTextStyle(),
        ),
      ),
    );
  }
}
