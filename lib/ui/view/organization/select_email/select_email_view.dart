import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import '../../../../utilities/enums.dart';
import '../../../shared/shared.dart';
import 'select_email_viewmodel.dart';

class SelectEmail extends StatelessWidget {
  final OrganizationSwitchMethod method;

  //The users email address can be passed in here from the api or database

  const SelectEmail({Key? key, required this.method}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<SelectEmailViewModel>.nonReactive(
      viewModelBuilder: () => SelectEmailViewModel(),
      builder: (context, model, child) => Scaffold(
        appBar: AppBar(
          leading: IconButton(
              icon: const Icon(Icons.arrow_back_ios),
              color: AppColors.deepBlackColor,
              onPressed: model.back),
          title: Text(
            model.getScreenTitle(method),
            style: AppTextStyles.heading4,
          ),
          backgroundColor: Colors.white,
        ),
        body: Container(
          margin: const EdgeInsets.all(16),
          height: 172.0,
          width: 395.0,
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(2.0),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 1,
                  blurRadius: 5,
                ),
              ]),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 16, horizontal: 8),
                child: Text(
                  'Select an email address to use:',
                  style: AppTextStyles.body3Medium.copyWith(
                      color: AppColors.zuriTextBodyColor,
                      fontSize: 16,
                      fontWeight: FontWeight.bold),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 8, top: 24),
                child: Row(
                  children: [
                    const Icon(
                      Icons.email_outlined,
                      size: 20,
                      color: AppColors.deepBlackColor,
                    ),
                    const SizedBox(width: 16),
                    GestureDetector(
                      onTap: () => model.onEmailTap(method),
                      child: Text(
                        model.userEmail ?? '',
                        style: AppTextStyles.body3Medium.copyWith(
                            fontSize: 16, color: AppColors.zuriTextBodyColor),
                      ),
                    ),
                  ],
                ),
              ),
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 16),
                child: Divider(color: AppColors.dividerColor),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: Row(
                  children: [
                    const Icon(
                      Icons.email_outlined,
                      size: 20,
                      color: AppColors.deepBlackColor,
                    ),
                    const SizedBox(width: 16),
                    GestureDetector(
                        child: Text(
                          model.anotherEmail,
                          style: AppTextStyles.body3Medium.copyWith(
                              fontSize: 16, color: AppColors.zuriTextBodyColor),
                        ),
                        onTap: () => model.navigateToUseDifferentEmailView())
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
