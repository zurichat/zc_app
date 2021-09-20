import 'package:flutter/cupertino.dart';
import 'package:hng/ui/shared/colors.dart';

class TextHeader extends StatelessWidget {
  final Color headingColor = const Color(0xFFF7F7F7);
  final String headerText;
  TextHeader({
    Key? key,
    required this.headerText,
  });
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      color: headingColor,
      height: 48,
      child: Padding(
        padding: const EdgeInsets.only(left: 25.0),
        child: Align(
          alignment: Alignment.centerLeft,
          child: Text(
            headerText,
            style: TextStyle(color: AppColors.zuriDarkGrey, fontSize: 14),
          ),
        ),
      ),
    );
  }
}
