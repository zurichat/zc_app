import 'package:flutter/material.dart';
import 'package:hng/ui/shared/styles.dart';
import 'package:hng/ui/shared/text_styles.dart';

class CustomChannel extends StatelessWidget {
  final text;
  const CustomChannel({Key? key, this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 24,
      width: 211,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(5,0,0,0),
        child: Row(
          children: [
            Text('#',
                style: AppTextStyles.heading7),
            const SizedBox(width: 21.33),
            Text(
              text,
              style: ZuriTextStyle.mediumBold(),
            ),
          ],
        ),
      ),
    );
  }
}
