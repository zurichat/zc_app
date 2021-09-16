import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'package:hng/general_widgets/easy_container.dart';
import 'package:hng/ui/shared/colors.dart';
import 'package:hng/ui/shared/text_styles.dart';

class ThreadTextAndIcon extends StatelessWidget {
  const ThreadTextAndIcon({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return _TextAndIcon(
      text: 'Threads',
      indicatorCount: 0,
      icon: SvgPicture.asset("assets/icons/svg_icons/lock1.svg"),
    );
  }
}

///Specify the noTopPad as true for all the first child
///
//Expanded tile don't allow sizing so we have to decrease
//the top pad of the first child to make it look visually ok
class DMTextAndIcon extends StatelessWidget {
  final String text;
  final int? indicatorCount;
  final bool? noTopPad;

  const DMTextAndIcon({
    Key? key,
    required this.text,
    this.indicatorCount,
    this.noTopPad,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return _TextAndIcon(
      text: text,
      indicatorCount: indicatorCount,
      icon: Container(
        alignment: Alignment.centerLeft,
        child: EasyContainer(
          height: 22,
          width: 22,
          radius: 3,
          color: AppColors.paleGreen,
        ),
      ),
    );
  }
}

///Specify the noTopPad as true for all the first child
///
//Expanded tile don't allow sizing so we have to decrease
//the top pad of the first child to make it look visually ok
class ChannelTextAndIcon extends StatelessWidget {
  final bool? isLocked;
  final String text;
  final int? indicatorCount;
  final bool? noTopPad;

  const ChannelTextAndIcon({
    Key? key,
    this.isLocked,
    required this.text,
    this.noTopPad,
    this.indicatorCount,
  }) : super(key: key);

  Widget prefixIcon() {
    if (isLocked == true) {
      return Container();
    }
    return Text(
      '#',
      style: ZuriTextStyle.largeNormal(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return _TextAndIcon(
      text: text,
      indicatorCount: indicatorCount,
      icon: prefixIcon(),
    );
  }
}

///Specify the noTopPad as true for all the first child
///
///Expanded tile don't allow sizing so we have to remove
///the top pad of the first child to make it look visually ok
///Shows text and Icon together in a Row
class _TextAndIcon extends StatelessWidget {
  final String text;
  final int? indicatorCount;
  final Widget icon;
  final bool? noTopPad;

  const _TextAndIcon({
    Key? key,
    required this.text,
    required this.indicatorCount,
    required this.icon,
    this.noTopPad,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //Expanded tile don't allow sizing so we have to decrease
    //the top pad of the first child to make it look visually ok
    double topPad = 12;
    if (noTopPad == true) {
      topPad = 5;
    }

    //Todo: make text thickness change based on the unreads and read
    return Padding(
      padding: EdgeInsets.fromLTRB(0, topPad, 0, 12),
      child: Row(
        children: [
          Container(
            width: 25,
            alignment: Alignment.center,
            child: icon,
          ),
          SizedBox(
            width: 9,
          ),
          Text(
            text,
            style: ZuriTextStyle.mediumNormal(
              color: Colors.grey[600],
            ),
          )
        ],
      ),
    );
  }
}
