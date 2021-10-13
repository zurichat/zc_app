import 'package:flutter/material.dart';
import 'package:hng/ui/shared/zuri_appbar.dart';
import 'package:hng/utilities/internalization/localization/app_localization.dart';
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
    final local = AppLocalization.of(context);
    return ViewModelBuilder<SelectEmailViewModel>.nonReactive(
      viewModelBuilder: () => SelectEmailViewModel(),
      builder: (context, model, child) => Scaffold(
        backgroundColor: Theme.of(context).brightness == Brightness.dark
            ? AppColors.blackColor
            : AppColors.whiteColor,
        appBar: ZuriAppBar(
          orgTitle: Text(
            model.getScreenTitle(method),
            style: AppTextStyles.heading4.copyWith(
              color: Theme.of(context).textTheme.bodyText1!.color,
            ),
          ),
          whiteBackground: true,
          isDarkMode: Theme.of(context).brightness == Brightness.dark,
          leading: Icons.arrow_back_ios_outlined,
          leadingPress: () => model.back(),
        ),
        body: Container(
          margin: const EdgeInsets.fromLTRB(8.0, 20.0, 8.0, 0.0),
          decoration: BoxDecoration(
              color: Theme.of(context).brightness == Brightness.dark
                  ? AppColors.darkThemePrimaryColor
                  : AppColors.whiteColor,
              borderRadius: BorderRadius.circular(2.0),
              boxShadow: const [
                BoxShadow(
                  color: AppColors.darkGreyColor,
                  blurRadius: 1,
                  offset: Offset(0, 1),
                ),
              ]),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 16, horizontal: 8),
                child: Text(local!.selectEmailToUse,
                    style: AppTextStyles.body1Bold),
              ),
              InkWell(
                onTap: () {
                  model.onEmailTap(method);
                },
                child: Padding(
                  padding:
                      const EdgeInsets.only(left: 17.5, top: 24, bottom: 24),
                  child: Row(
                    children: [
                      const Icon(
                        Icons.email_outlined,
                        size: 20,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 25.5),
                        child: Text(
                          model.userEmail ?? '',
                          style: const TextStyle(
                            fontSize: 14,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(left: 57.0),
                child: Divider(
                  thickness: 1,
                  height: 9,
                  color: AppColors.greyishColor,
                ),
              ),
              InkWell(
                onTap: () => model.navigateToDifferentEmail(method),
                child: Padding(
                  padding:
                      const EdgeInsets.only(left: 17.5, top: 24, bottom: 24),
                  child: Row(
                    children: [
                      const Icon(
                        Icons.email_outlined,
                        size: 20,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                          left: 25.5,
                        ),
                        child: GestureDetector(
                          child: Text(
                            model.anotherEmail,
                            style: const TextStyle(
                                color: AppColors.deepBlackColor, fontSize: 14),
                          ),
                          onTap: () => model.navigateToUseDifferentEmailView(),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
