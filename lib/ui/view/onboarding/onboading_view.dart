import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:stacked/stacked.dart';

import 'onboarding_viewmodel.dart';

class OnboardingView extends StatefulWidget {
  const OnboardingView({Key? key}) : super(key: key);

  @override
  _OnboardingViewState createState() => _OnboardingViewState();
}

class _OnboardingViewState extends State<OnboardingView> {
  final introKey = GlobalKey<IntroductionScreenState>();

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<OnboardingViewModel>.nonReactive(
      builder: (context, model, child) {
        return Scaffold(
          backgroundColor: Colors.white,
          body: Padding(
            padding: const EdgeInsets.all(32.0),
            child: IntroductionScreen(
              key: introKey,
              pages: [
                PageViewModel(
                    title: 'Perfect Collaboration App For Teams',
                    body: '''Chat with other team members'''
                        ''' without any distractions from the world''',
                    image:
                        Image.asset('assets/images/onboarding_screen_0.png')),
                PageViewModel(
                  title: 'Music Room',
                  body: '''Now you can listen to your favourite'''
                      ''' tracks right in the App''',
                  image: Image.asset('assets/images/onboarding_screen_1.png'),
                ),
                PageViewModel(
                  title: 'Chess Room',
                  body: '''Chat with other team members without'''
                      ''' any distractions from the world''',
                  image: Image.asset('assets/images/onboarding_screen_2.png'),
                ),
              ],
              done: const Text(
                'Done',
                style: TextStyle(fontWeight: FontWeight.w600),
              ),
              onDone: () => model.navigateToNext(),
              showDoneButton: true,
              showNextButton: false,
            ),
          ),
        );
      },
      disposeViewModel: true,
      viewModelBuilder: () => OnboardingViewModel(),
    );
  }
}
