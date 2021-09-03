import 'package:flutter/material.dart';
import 'package:hng/app/app.router.dart';
import 'package:hng/ui/view/home/home_view.dart';
import 'package:introduction_screen/introduction_screen.dart';

class OnboardingPage extends StatefulWidget {
  const OnboardingPage({Key? key}) : super(key: key);

  @override
  _OnboardingPageState createState() => _OnboardingPageState();
}

class _OnboardingPageState extends State<OnboardingPage> {
  final introKey = GlobalKey<IntroductionScreenState>();

  @override
  Widget build(BuildContext context) {
    return IntroductionScreen(
      pages: [
        PageViewModel(
            title: 'Perfect Collaboration App For Teams',
            body:
                'Chat with other team members without any distractions from the world',
            image: Image.asset('assets/images/onboarding_screen_0.png')),
        PageViewModel(
            title: 'Music Room',
            body:
                'Now you can listen to your favourite tracks right in the App',
            image: Image.asset('assets/images/onboarding_screen_1.png')),
        PageViewModel(
            title: 'Chess Room',
            body:
                'Chat with other team members without any distractions from the world',
            image: Image.asset('assets/images/onboarding_screen_2.png')),
      ],
      done: const Text('Done', style: TextStyle(fontWeight: FontWeight.w600)),
      onDone: () => Navigator.of(context).pushReplacementNamed(Routes.homeView),
      showDoneButton: true,
      showNextButton: false,
    );
  }
}
