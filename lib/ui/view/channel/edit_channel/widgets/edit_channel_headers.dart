import 'package:flutter/cupertino.dart';
import 'package:hng/ui/shared/colors.dart';
import 'package:hng/ui/shared/shared.dart';

class TextHeader extends StatelessWidget {
  final String headerText;
  TextHeader({
    Key? key,
    required this.headerText,
  });
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      color: AppColors.ZuriBGLightgrey,
      height: 48,
      child: Padding(
        padding: const EdgeInsets.only(left: 25.0),
        child: Align(
          alignment: Alignment.centerLeft,
          child: Text(
            headerText,
            style: AppTextStyles.body2_400,
          ),
        ),
      ),
    );
  }
}