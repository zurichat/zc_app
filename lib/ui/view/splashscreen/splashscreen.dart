import 'package:flutter/material.dart';
import 'package:zurichat/constants/app_strings.dart';
import 'package:stacked/stacked.dart';
import 'splashscreen_viewmodel.dart';

class Splashview extends StatelessWidget {
  const Splashview({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<SplashscreenViewModel>.reactive(
      viewModelBuilder: () => SplashscreenViewModel(),
      onModelReady: (model) => model.init(),
      builder: (context, model, child) => Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              Image(
                image: AssetImage(SplashScreen),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
