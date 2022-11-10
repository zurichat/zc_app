import 'package:flutter/material.dart';

import 'package:zurichat/utilities/constants/colors.dart';
import 'package:zurichat/utilities/constants/text_styles.dart';
import 'package:zurichat/utilities/internationalization/app_localization.dart';

class SavedItemBackground extends StatelessWidget {
  const SavedItemBackground({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final local = AppLocalization.of(context);
    final size = MediaQuery.of(context).size;
    final bool dark = Theme.of(context).brightness == Brightness.dark;

    return SizedBox(
      width: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        children: [
          Icon(
            Icons.bookmark_border_outlined,
            size: size.height * .3,
            color: AppColors.greyishColor,
          ),
          Text(
            local!.noSavedItems,
            style:
                dark ? AppTextStyle.whiteSize16 : AppTextStyle.darkGreySize16,
          ),
          const SizedBox(height: 10),
          Text(
            local.noSavedItemsSubtitle,
            maxLines: 2,
            textAlign: TextAlign.center,
            style: const TextStyle(color: AppColors.greyishColor, fontSize: 16),
          ),
        ],
      ),
    );
  }
}
