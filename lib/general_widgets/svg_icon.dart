import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SvgAssets {
  static final SvgData threads = SvgData('assets/icons/svg_icons/threads.svg');
  static final SvgData dm = SvgData('assets/icons/svg_icons/dm.svg');
  static final SvgData home = SvgData('assets/icons/svg_icons/home.svg');
  static final SvgData you = SvgData('assets/icons/svg_icons/you.svg');
  static final SvgData hashTag = SvgData('assets/icons/svg_icons/hash_tag.svg');
  static final SvgData locked = SvgData('assets/icons/svg_icons/lock1.svg');
  static final SvgData lockedOutline =
      SvgData('assets/icons/svg_icons/lock_outline.svg');
  static final SvgData addChannels =
      SvgData('assets/icons/svg_icons/add_channel.svg');
}

class SvgData {
  final String data;
  SvgData(this.data);
}

///Use SvgAsset.iconName to specify the svg icon
class SvgIcon extends StatelessWidget {
  final SvgData svgIcon;
  final Color? color;
  final double? size;

  const SvgIcon({
    Key? key,
    required this.svgIcon,
    this.color,
    this.size,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      svgIcon.data,
      color: color,
      height: size,
    );
  }
}
