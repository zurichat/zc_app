import 'package:flutter/material.dart';
import 'package:hng/ui/shared/colors.dart';

class StatusForm extends StatelessWidget {
  const StatusForm({Key? key, this.onPressed}) : super(key: key);
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      textColor: AppColors.greyishColor,
      color: AppColors.whiteColor,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5),
          side: const BorderSide(width: 1, color: AppColors.shadowColor)),
      padding: const EdgeInsets.all(12),
      elevation: 3,
      onPressed: onPressed,
      child: Row(
        children: const [
          Icon(Icons.chat_bubble_outline_rounded),
          SizedBox(width: 7),
          Flexible(
            child: Text("What's your status?"),
            fit: FlexFit.tight,
          ),
          Icon(Icons.close_rounded),
        ],
      ),
    );
  }
}
