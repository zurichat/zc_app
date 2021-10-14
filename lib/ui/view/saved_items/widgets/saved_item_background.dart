import 'package:flutter/material.dart';
import 'package:hng/general_widgets/custom_text.dart';
import 'package:hng/ui/shared/colors.dart';

class SavedItemBackground extends StatelessWidget {
  const SavedItemBackground({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _size = MediaQuery.of(context).size;
    return SizedBox(
      width: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        children: [
          Icon(
            Icons.bookmark_border_outlined,
            size: _size.height * .3,
            color: AppColors.greyishColor,
          ),
          const CustomText(
            text: 'No saved items',
            fontWeight: FontWeight.w600,
          ),
          const SizedBox(height: 10),
          const Text(
            'Add messages and files to easily \ncome back to them later.',
            maxLines: 2,
            textAlign: TextAlign.center,
            style: TextStyle(color: AppColors.greyishColor, fontSize: 16),
          ),
        ],
      ),
    );
  }
}
