import 'dart:core';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:zurichat/utilities/constants/app_strings.dart';
import 'package:zurichat/utilities/constants/text_styles.dart';
import 'package:zurichat/utilities/internationalization/app_localization.dart';
import 'package:page_view_dot_indicator/page_view_dot_indicator.dart';
import 'package:stacked/stacked.dart';

import '../../shared/shared.dart';

import 'onboarding_viewmodel.dart';

class OnboardingView extends StatelessWidget {
  const OnboardingView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final local = AppLocalization.of(context);
    final List<Widget> pages = [
      PageViewOnboarding(
          title: local!.onboardingTitleOne,
          subtitle: local.onboardingSubtitleOne,
          image: OnboardingOne),
      PageViewOnboarding(
        title: local.onboardingTitleTwo,
        subtitle: local.onboardingSubtitleTwo,
        image: OnboardingTwo,
      ),
      PageViewOnboarding(
        title: local.onboardingTitleThree,
        subtitle: local.onboardingSubtitleThree,
        image: OnboardingThree,
      ),
    ];

    final Size _size = MediaQuery.of(context).size;

    return ViewModelBuilder<OnboardingViewModel>.reactive(
      builder: (context, model, child) => Scaffold(
        body: SafeArea(
            child: Container(
          padding: const EdgeInsets.only(top: 20, right: 25),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Align(
                alignment: Alignment.centerRight,
                child: model.currentIndex < 2
                    ? TextButton(
                        onPressed: model.navigateToNext,
                        child: Text(
                          local.skip,
                          style: AppTextStyle.greenSize20Bold,
                        ),
                      )
                    : Container(),
              ),
              const SizedBox(height: 20),
              Expanded(
                child: PageView.builder(
                  controller: model.controller,
                  onPageChanged: model.setCurrentIndex,
                  itemCount: pages.length,
                  itemBuilder: (context, idx) {
                    return pages[idx];
                  },
                ),
              ),
              PageViewDotIndicator(
                  currentItem: model.currentIndex,
                  count: pages.length,
                  unselectedColor: AppColors.lightGreen,
                  selectedColor: AppColors.zuriPrimaryColor,
                  size: const Size(12, 12),
                  unselectedSize: const Size(8, 8),
                  duration: const Duration(milliseconds: 200),
                  margin: const EdgeInsets.symmetric(horizontal: 8)),
              const SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.only(left: 15),
                child: MaterialButton(
                  color: AppColors.zuriPrimaryColor,
                  height: 50,
                  minWidth: _size.width * 0.8,
                  child: Text(
                    model.currentIndex < 2 ? Next : GetStarted,
                    style: AppTextStyle.whiteSize16,
                  ),
                  onPressed: model.currentIndex < 2
                      ? () => model.animateToPage(model.currentIndex)
                      : () => model.navigateToNext(),
                ),
              ),
              const SizedBox(height: 20),
            ],
          ),
        )),
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
        mainAxisSize: MainAxisSize.min,
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
            style: AppTextStyle.darkGreySize20Bold,
          ),
          const SizedBox(height: 20),
          Text(
            subtitle!,
            textAlign: TextAlign.center,
            style: AppTextStyle.lightGreySize16,
          ),
        ],
      ),
    );
  }
}
