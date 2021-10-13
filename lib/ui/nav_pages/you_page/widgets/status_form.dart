import 'package:flutter/material.dart';
import 'package:hng/constants/app_strings.dart';
import 'package:hng/ui/shared/colors.dart';

class StatusForm extends StatelessWidget {
  const StatusForm({Key? key, this.onPressed, this.iconData, this.statusText})
      : super(key: key);
  final void Function()? onPressed;
  final IconData? iconData;
  final String? statusText;

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      textColor: AppColors.greyishColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(5),
        side: BorderSide(
          width: 1,
          color: Theme.of(context).textTheme.bodyText1!.color ??
              AppColors.zuriPrimaryColor,
        ),
      ),
      padding: const EdgeInsets.all(12),
      elevation: 3,
      onPressed: onPressed,
      child: Row(
        children: [
          Icon(iconData ?? bubble),
          const SizedBox(width: 7),
          Flexible(
            child: Text(statusText ?? 'What\'s your status'),
            fit: FlexFit.tight,
          ),
          const Icon(Icons.close_rounded),
        ],
      ),
    );
  }
}
