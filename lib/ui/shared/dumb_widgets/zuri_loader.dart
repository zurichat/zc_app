import 'package:flutter/material.dart';
import 'package:zurichat/utilities/constants/app_strings.dart';
import 'package:zurichat/utilities/constants/colors.dart';

class ZuriLoader extends StatefulWidget {
  final bool isTransparent;
  const ZuriLoader({Key? key, this.isTransparent = false}) : super(key: key);

  @override
  ZuriLoaderState createState() => ZuriLoaderState();
}

class ZuriLoaderState extends State<ZuriLoader> with TickerProviderStateMixin {
  late final AnimationController _controller = AnimationController(
    duration: const Duration(seconds: 2),
    vsync: this,
  )..repeat(reverse: false);
  late final Animation<double> _animation = CurvedAnimation(
    parent: _controller,
    curve: Curves.linear,
  );

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final bool dark = Theme.of(context).brightness == Brightness.dark;
    return Scaffold(
      backgroundColor: widget.isTransparent
          ? Colors.transparent
          : dark
              ? AppColors.darkModeColor
              : AppColors.whiteColor,
      body: Center(
        child: RotationTransition(
          turns: _animation,
          child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                height: 50,
                width: 50,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    fit: BoxFit.fill,
                    image: AssetImage(NewZuriLogo),
                  ),
                ),
              )),
        ),
      ),
    );
  }
}
