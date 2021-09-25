import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

/// Contains useful consts to reduce boilerplate and duplicate code
class UIHelper {
  static const double _VerticalSpaceExtraSmall = 4.0;
  static const double _VerticalSpaceSmall = 8.0;
  static const double _VerticalSpaceMedium = 16.0;
  static const double _VerticalSpaceLarge = 32.0;

  static const double _HorizontalSpaceSmall = 8.0;
  static const double _HorizontalSpaceExtraSmall = 8.0;
  static const double _HorizontalSpaceMedium = 16.0;
  static const double _HorizontalSpaceLarge = 32.0;
  static Widget verticalSpaceExtraSmall = const SizedBox(
    height: _VerticalSpaceExtraSmall,
  );
  static Widget verticalSpaceSmall = const SizedBox(
    height: _VerticalSpaceSmall,
  );
  static Widget verticalSpaceMedium =
      const SizedBox(height: _VerticalSpaceMedium);
  static Widget verticalSpaceLarge =
      const SizedBox(height: _VerticalSpaceLarge);
  static Widget horizontalSpaceExtraSmall =
      SizedBox(width: _HorizontalSpaceExtraSmall.w);
  static Widget horizontalSpaceSmall = SizedBox(width: _HorizontalSpaceSmall.w);
  static Widget horizontalSpaceMedium =
      SizedBox(width: _HorizontalSpaceMedium.w);
  static Widget horizontalSpaceLarge = SizedBox(width: _HorizontalSpaceLarge.w);
  static Widget customVerticalSpace(double value) => SizedBox(height: value);
  static Widget customHorizontalSpace(double value) => SizedBox(width: value);
}

double screenAwareSize(double value, BuildContext context,
    {bool width = false}) {
  if (width) {
    return MediaQuery.of(context).size.width * (value / 411);
  } else {
    return MediaQuery.of(context).size.height * (value / 823);
  }
}