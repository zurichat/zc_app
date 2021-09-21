import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hng/ui/shared/styles.dart';
import '../../../../shared/colors.dart';

class SecondSection extends StatelessWidget {
  const SecondSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.only(left: 5, right: 5),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(6.0),
        ),
        color: AppColors.whiteColor,
        elevation: 1.0,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: const EdgeInsets.only(
                left: 18,
                top: 24,
                right: 25,
              ),
              child: SvgPicture.asset(
                'assets/channel_page/bell.svg',
                width: 20,
              ),
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 24.0,
                  ),
                  Container(
                    child: Text(
                      'Notification',
                      style: AppTextStyles.namesStyle,
                    ),
                  ),
                  SizedBox(
                    height: 6.0,
                  ),
                  Container(
                    child: Text(
                      'Every New Message',
                      style: AppTextStyles.body1Grey,
                    ),
                  ),
                  SizedBox(
                    height: 18.0,
                  ),
                  Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          child: Text(
                            'Mute Channel',
                            style: AppTextStyles.descriptionStyle,
                          ),
                        ),
                        Container(
                            child: Switch(
                          value: false,
                          onChanged: (bool value) {},
                        ))
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 26.0,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
