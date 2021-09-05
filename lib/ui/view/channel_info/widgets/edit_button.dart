import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:hng/ui/shared/colors.dart';
import 'package:hng/ui/view/channel_info/widgets/textstyles.dart';

class EditButton extends StatelessWidget {
  const EditButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      width: MediaQuery.of(context).size.width,
      alignment: Alignment.center,
      margin: const EdgeInsets.only(right: 5, left: 5, bottom: 15),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(2),
          border: Border.all(width: 1.0, color: AppColors.borderColor)),
      child: Text(
        'Edit',
        style: greenTextStyle(),
      ),
    );
  }
}
