import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hng/ui/shared/shared.dart';
import 'package:hng/ui/shared/styles.dart';
import 'package:page_view_dot_indicator/page_view_dot_indicator.dart';
import 'package:stacked/stacked.dart';
import 'onboarding_viewmodel.dart';
import 'dart:core';

class OnboardingView extends StatelessWidget {
  const OnboardingView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<OnboardingViewModel>.reactive(
      builder: (context, model, child) => Scaffold(
        body: SafeArea(
          child: PageView.builder(
            controller: model.controller,
            itemBuilder: (context, index) {
              return ListView(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      index < 2
                          ? TextButton(
                              onPressed: () => model.navigateToNext(),
                              child: Text(
                                "Skip",
                                style: AppTextStyles.heading8.copyWith(
                                    decoration: TextDecoration.underline,
                                    fontSize: 18),
                              ),
                            )
                          : SizedBox(height: 50),
                    ],
                  ),
                  pages[index],
                  SizedBox(height: 20),
                  PageViewDotIndicator(
                      currentItem: index,
                      count: pages.length,
                      unselectedColor: AppColors.lightGreen,
                      selectedColor: AppColors.zuriPrimaryColor,
                      size: const Size(12, 12),
                      unselectedSize: const Size(8, 8),
                      duration: const Duration(milliseconds: 200),
                      margin: const EdgeInsets.symmetric(horizontal: 8)),
                  SizedBox(height: 70),
                  InkWell(
                    onTap: index < 2
                        ? () => model.animateToPage(index)
                        : () => model.navigateToNext(),
                    child: Container(
                      height: 50,
                      alignment: Alignment.center,
                      margin: const EdgeInsets.symmetric(horizontal: 30),
                      child: Text(index < 2 ? 'Next' : 'Get Started',
                          style: AppTextStyles.buttonText),
                      width: double.infinity,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: AppColors.zuriPrimaryColor,
                      ),
                    ),
                  ),
                  SizedBox(height: 50),
                ],
              );
            },
            itemCount: pages.length,
          ),
        ),
      ),
      viewModelBuilder: () => OnboardingViewModel(),
    );
  }
}

class PageViewOnboarding extends StatelessWidget {
  final String? image, title, subtitle;
  const PageViewOnboarding({
    Key? key,
    this.image,
    this.title,
    this.subtitle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            height: theme.height * .45,
            width: theme.width * .85,
            child: Image.asset(image!, fit: BoxFit.fill),
          ),
          SizedBox(height: 30),
          Text(
            title!,
            textAlign: TextAlign.center,
            style: AppTextStyles.heading7,
          ),
          SizedBox(height: 20),
          Text(
            subtitle!,
            textAlign: TextAlign.center,
            style: AppTextStyles.body1Regular,
          ),
        ],
      ),
    );
  }
}

final List<Widget> pages = [
  PageViewOnboarding(
      title: 'Perfect Collaboration App For Teams',
      subtitle: '''Chat with other team members'''
          ''' without any distractions from the world''',
      image: 'assets/images/onboarding_screen_0.png'),
  PageViewOnboarding(
    title: 'Music Room',
    subtitle: '''Now you can listen to your favourite'''
        ''' tracks right in the App''',
    image: 'assets/images/onboarding_screen_1.png',
  ),
  PageViewOnboarding(
    title: 'Chess Room',
    subtitle: '''Chat with other team members without'''
        ''' any distractions from the world''',
    image: 'assets/images/onboarding_screen_2.png',
  ),
];
