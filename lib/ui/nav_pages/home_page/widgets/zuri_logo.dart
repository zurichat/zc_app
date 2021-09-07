import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hng/ui/shared/colors.dart';
import 'package:hng/ui/shared/constants.dart';
import 'package:hng/ui/shared/styles.dart';

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
        SizedBox(
          width: 5,
        ),
        Text(
          'ZURI',
          style: GoogleFonts.lato(
      fontWeight: FontWeight.w700,
      fontSize: 20,
      letterSpacing: 2.5,
      color: AppColors.whiteColor),
          
        ),
      ],
    );
  }
}
