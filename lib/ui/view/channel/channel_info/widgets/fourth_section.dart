import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hng/ui/shared/colors.dart';
import 'package:hng/ui/view/channel/channel_info/widgets/textstyles.dart';

class FourthSection extends StatelessWidget {
  const FourthSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 56.0,
      margin: EdgeInsets.only(left: 5, right: 5),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(6.0),
        ),
        color: AppColors.whiteColor,
        elevation: 1.0,
        child: Row(
          children: [
            SizedBox(
              width: 16.0,
            ),
            Container(
              child: SvgPicture.asset(
                'assets/channel_page/pin.svg',
                width: 20,
              ),
            ),
            SizedBox(
              width: 25.0,
            ),
            Container(
              child: Text(
                'Pinned messages (1)',
                style: nameStyle(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
