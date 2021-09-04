import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

/// Contains useful consts to reduce boilerplate and duplicate code
class UIHelper {
  static const double _VerticalSpaceSmall = 8.0;
  static const double _VerticalSpaceMedium = 16.0;
  static const double _VerticalSpaceLarge = 32.0;

  static const double _HorizontalSpaceSmall = 8.0;
  static const double _HorizontalSpaceMedium = 16.0;
  static const double _HorizontalSpaceLarge = 32.0;

  static Widget verticalSpaceSmall = SizedBox(height: _VerticalSpaceSmall.h);
  static Widget verticalSpaceMedium = SizedBox(height: _VerticalSpaceMedium.h);
  static Widget verticalSpaceLarge = SizedBox(height: _VerticalSpaceLarge.h);

  static Widget horizontalSpaceSmall = SizedBox(width: _HorizontalSpaceSmall.w);
  static Widget horizontalSpaceMedium =
      SizedBox(width: _HorizontalSpaceMedium.w);
  static Widget horizontalSpaceLarge = SizedBox(width: _HorizontalSpaceLarge.w);
}

double screenAwareSize(double value, BuildContext context,
    {bool width = false}) {
  if (width) {
    return MediaQuery.of(context).size.width * (value / 411);
  } else {
    return MediaQuery.of(context).size.height * (value / 823);
  }
}
