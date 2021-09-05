import 'package:flutter/material.dart';
import 'package:hng/ui/shared/colors.dart';
import 'package:stacked/stacked.dart';
import 'splashscreen_viewmodel.dart';

class Splashview extends StatelessWidget {
  const Splashview({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<SplashscreenViewModel>.reactive(
        builder: (context, model, child) => Scaffold(
              backgroundColor: Colors.white,
              body: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image(
                      image: const AssetImage('assets/logo/splash_image.png'),
                    ),
                  ],
                ),
              ),
            ),
        viewModelBuilder: () => SplashscreenViewModel());
  }
}
