import 'dart:core';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hng/constants/app_strings.dart';
import 'package:page_view_dot_indicator/page_view_dot_indicator.dart';
import 'package:stacked/stacked.dart';

import '../../shared/shared.dart';
import '../../shared/styles.dart';
import 'onboarding_viewmodel.dart';

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
                                Skip,
                                style: AppTextStyles.heading8.copyWith(
                                    decoration: TextDecoration.underline,
                                    fontSize: 18),
                              ),
                            )
                          : const SizedBox(height: 50),
                    ],
                  ),
                  pages[index],
                  const SizedBox(height: 20),
                  PageViewDotIndicator(
                      currentItem: index,
                      count: pages.length,
                      unselectedColor: AppColors.lightGreen,
                      selectedColor: AppColors.zuriPrimaryColor,
                      size: const Size(12, 12),
                      unselectedSize: const Size(8, 8),
                      duration: const Duration(milliseconds: 200),
                      margin: const EdgeInsets.symmetric(horizontal: 8)),
                  const SizedBox(height: 70),
                  InkWell(
                    onTap: index < 2
                        ? () => model.animateToPage(index)
                        : () => model.navigateToNext(),
                    child: Container(
                      height: 50,
                      alignment: Alignment.center,
                      margin: const EdgeInsets.symmetric(horizontal: 30),
                      child: Text(index < 2 ? Next : GetStarted,
                          style: AppTextStyles.buttonText),
                      width: double.infinity,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: AppColors.zuriPrimaryColor,
                      ),
                    ),
                  ),
                  const SizedBox(height: 50),
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
          SizedBox(
            height: theme.height * .45,
            width: theme.width * .85,
            child: Image.asset(image!, fit: BoxFit.fill),
          ),
          const SizedBox(height: 30),
          Text(
            title!,
            textAlign: TextAlign.center,
            style: AppTextStyles.heading7,
          ),
          const SizedBox(height: 20),
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
  const PageViewOnboarding(
      title: OnboardingOneTitle,
      subtitle: OnboardingOneSubtitle,
      image: OnboardingOne),
  const PageViewOnboarding(
    title: OnboardingTwoTitle,
    subtitle: OnboardingTwoSubtitle,
    image: OnboardingTwo,
  ),
  const PageViewOnboarding(
    title: OnboardingThreeTitle,
    subtitle: OnboardingThreeSubtitle,
    image: OnboardingThree,
  ),
];
