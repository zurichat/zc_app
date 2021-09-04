import 'package:flutter/material.dart';
import '../../../app/app.locator.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import '../../../app/app.router.dart';
import 'onboarding_viewmodel.dart';

class OnboardingView extends StatefulWidget {
  const OnboardingView({Key? key}) : super(key: key);

  @override
  _OnboardingViewState createState() => _OnboardingViewState();
}

class _OnboardingViewState extends State<OnboardingView> {
  final introKey = GlobalKey<IntroductionScreenState>();
  final navigator = locator<NavigationService>();

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<OnboardingViewModel>.nonReactive(
      builder: (context, model, child) => SafeArea(
        child: IntroductionScreen(
          key: introKey,
          globalBackgroundColor: Colors.white,
          pages: [
            PageViewModel(
                title: 'Perfect Collaboration App For Teams',
                body: '''Chat with other team members'''
                    ''' without any distractions from the world''',
                image: Image.asset('assets/images/onboarding_screen_0.png')),
            PageViewModel(
                title: 'Music Room',
                body: '''Now you can listen to your favourite'''
                    ''' tracks right in the App''',
                image: Image.asset('assets/images/onboarding_screen_1.png')),
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
          onDone: () => navigator.navigateTo(Routes.loginView),
          showDoneButton: true,
          showNextButton: false,
        ),
      ),
      disposeViewModel: true,
      viewModelBuilder: () => OnboardingViewModel(),
    );
  }
}
