import 'package:flutter/material.dart';

///Adds ripple to the main widget
///Note: if a color is set to the child it won't work
class Ripple extends StatelessWidget {
  final double radius;
  final Color? splashColor;
  final Function()? onTap;
  final Widget? child;

  const Ripple({
    Key? key,
    this.radius = 5,
    this.splashColor,
    this.onTap,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      type: MaterialType.transparency,
      child: InkWell(
        onTap: () async {
          await Future.delayed(Duration(milliseconds: 200));
          var func = onTap ?? () {};
          func();
        },
        borderRadius: BorderRadius.circular(radius),
        splashColor: splashColor ?? Colors.grey[300],
        child: child ?? Container(),
      ),
    );
  }
}
