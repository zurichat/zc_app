import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import '../../shared/colors.dart';
import 'splashscreen_viewmodel.dart';

class Splashview extends StatelessWidget {
  const Splashview({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<SplashscreenViewModel>.reactive(
      viewModelBuilder: () => SplashscreenViewModel(),
      onModelReady: SplashscreenViewModel().init(),
      builder: (context, model, child) => Scaffold(
        backgroundColor: AppColors.whiteColor,
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
               Image(
                image: AssetImage('assets/logo/splash_image.png'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
