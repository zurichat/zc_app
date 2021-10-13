import 'package:flutter/material.dart';
import 'package:zurichat/ui/shared/colors.dart';

class StatusForm extends StatelessWidget {
  const StatusForm({Key? key, this.onPressed}) : super(key: key);
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      textColor: AppColors.greyishColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(5),
        side: BorderSide(
          width: 1,
          color: ThemeData.dark().textTheme.bodyText1!.color ??
              AppColors.zuriPrimaryColor,
        ),
      ),
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
