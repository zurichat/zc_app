import 'package:flutter/material.dart';
import 'package:hng/constants/app_strings.dart';
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
<<<<<<< HEAD
        Text(
          'ZURI',
          style: AppTextStyles.zuriAppBarWordLogo
        ),
=======
        Text(Zuri, style: AppTextStyles.zuriAppBarWordLogo),
>>>>>>> 6ac6c85e6c499e4ce561dab8d84b37a74fd447f6
      ],
    );
  }
}
