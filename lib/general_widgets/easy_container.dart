import 'package:flutter/material.dart';

///An alternative to conatainer
///you can use padding and margin in list form using
///* [left, top, right, bottom]
///* [left&right, top& bottom]
///* or as an integer for all the sides
class EasyContainer extends StatelessWidget {
  ///creates a widget
  final double? height;
  final AlignmentGeometry? alignment;
  final double? width;
  final Color? color;
  final double? radius;
  final List<double>? unevenRadius;
  final double? borderWidth;
  final Color? borderColor;
  final bool? circular;
  final Widget? child;

  ///you can use padding and margin in list form using
  ///* [left, top, rigt bottom]
  ///* [left&right, top& bottom]
  ///* or as an integer for all the sides
  final margin;

  ///you can use padding and margin in list form using
  ///* [left, top, right bottom]
  ///* [left&right, top& bottom]
  ///* or as an integer for all the sides
  final padding;
  final List<BoxShadow>? boxShadow;
  final Gradient? gradient;

  EasyContainer({
    Key? key,
    this.height,
    this.width,
    this.color,
    this.radius,
    this.child,
    this.unevenRadius,
    this.circular,
    this.margin,
    this.alignment,
    this.padding,
    this.borderWidth,
    this.boxShadow,
    this.gradient,
    this.borderColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    BorderRadius? borderRadius;
    List<double> uneven = unevenRadius ?? [];

    if (unevenRadius == null) {
      borderRadius = circular == null
          ? BorderRadius.circular(radius ?? 0)
          : BorderRadius.all(Radius.elliptical(radius ?? 0, radius ?? 0));
    } else {
      if (uneven.length == 4) {
        borderRadius = BorderRadius.only(
          topLeft: Radius.circular(uneven[0]),
          topRight: Radius.circular(uneven[1]),
          bottomLeft: Radius.circular(uneven[2]),
          bottomRight: Radius.circular(uneven[3]),
        );
      }
    }

    bool noBoxDeco = color == null &&
        radius == null &&
        borderWidth == null &&
        borderColor == null &&
        boxShadow == null &&
        gradient == null;

    return Container(
      margin: getInsets(margin),
      padding: getInsets(padding),
      height: height,
      width: width,
      alignment: alignment,
      decoration: noBoxDeco
          ? null
          : BoxDecoration(
              color: color,
              borderRadius: borderRadius,
              border: Border.all(
                width: borderWidth ?? 0,
                color: borderColor ?? Colors.transparent,
              ),
              boxShadow: boxShadow,
              gradient: gradient,
            ),
      child: child,
    );
  }

  EdgeInsetsGeometry? getInsets(var type) {
    EdgeInsetsGeometry inset = EdgeInsets.all(0);

    if (type is int || type is double) {
      inset = EdgeInsets.all(type.toDouble());
    } else if (type is List) {
      //

      if (type.length == 1) {
        EdgeInsets.all(type[0]);
      } else if (type.length < 4) {
        inset = EdgeInsets.fromLTRB(
          type[0].toDouble(),
          type[1].toDouble(),
          type[0].toDouble(),
          type[1].toDouble(),
        );
      } else
        inset = EdgeInsets.fromLTRB(
          type[0].toDouble(),
          type[1].toDouble(),
          type[2].toDouble(),
          type[3].toDouble(),
        );
    } else
      return type;

    return inset;
  }
}

BorderRadius getUnevenRadius(List<double> uneven) {
  BorderRadius borderRadius = BorderRadius.circular(0);

  if (uneven.length == 4) {
    borderRadius = BorderRadius.only(
      topLeft: Radius.circular(uneven[0]),
      topRight: Radius.circular(uneven[1]),
      bottomLeft: Radius.circular(uneven[2]),
      bottomRight: Radius.circular(uneven[3]),
    );
  }

  return borderRadius;
}
