import 'package:flutter/material.dart';
import 'package:hng/ui/shared/shared.dart';

import '../../../../utilities/constants.dart';

class ZuriLogo extends StatelessWidget {
  const ZuriLogo({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Image(
          image: appBarLogo,
          fit: BoxFit.cover,
          height: 30,
        ),
        const SizedBox(
          width: 5,
        ),
        Text('ZURI', style: AppTextStyles.zuriAppBarWordLogo),
      ],
    );
  }
}
