import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hng/ui/shared/colors.dart';
import 'package:hng/ui/view/channel/channel_info/widgets/textstyles.dart';

class SixthSection extends StatelessWidget {
  const SixthSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 5, right: 5),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(6.0),
        ),
        color: AppColors.whiteColor,
        elevation: 1.0,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(
              width: 16.0,
            ),
            Container(
              child: SvgPicture.asset(
                'assets/channel_page/archive.svg',
                width: 20,
              ),
            ),
            SizedBox(
              width: 25.0,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    child: Text(
                      'Archive Channel',
                      style: archiveTextStyle(),
                    ),
                  ),
                  SizedBox(
                    height: 6.0,
                  ),
                  Container(
                      width: MediaQuery.of(context).size.width,
                      child: const Text(
                        'Archiving the channel will remove it from the channel list, and close it from all members.'
                        'All chats and filse will still be stored and searchable',
                        style: TextStyle(),
                        textAlign: TextAlign.justify,
                      )),
                  SizedBox(
                    height: 42.0,
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
