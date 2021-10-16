import 'package:flutter/material.dart';
import 'package:zurichat/ui/shared/text_styles.dart';
import 'package:stacked/stacked.dart';
import 'package:zurichat/constants/app_strings.dart';
import 'package:zurichat/models/organization_model.dart';
import 'package:zurichat/ui/shared/colors.dart';
import 'package:zurichat/ui/shared/zuri_appbar.dart';

import 'organization_settings_view_model.dart';

class OrganizationSettingsView extends StatelessWidget {
  final OrganizationModel org;
  const OrganizationSettingsView({Key? key, required this.org})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bool _dark = Theme.of(context).brightness == Brightness.dark;
    return ViewModelBuilder<OrganizationSettingsViewModel>.reactive(
      viewModelBuilder: () => OrganizationSettingsViewModel(),
      builder: (context, model, child) {
        return Scaffold(
          appBar: ZuriAppBar(
            title: OrgSettings,
            subtitle: org.name,
            whiteBackground: true,
            isDarkMode: _dark,
            leading: Icons.arrow_back_ios_new,
            leadingPress: () => model.back(),
          ),
          body: Container(
            margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
            decoration: BoxDecoration(
              color: _dark ? AppColors.blackColor : AppColors.whiteColor,
              boxShadow: const <BoxShadow>[
                BoxShadow(
                  color: AppColors.shadowColor,
                  spreadRadius: 5,
                  blurRadius: 10,
                ),
              ],
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                InkWell(
                  onTap: () => model.navigateToWorkspaceLogo(org),
                  child: Padding(
                    padding: const EdgeInsets.all(20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          EditOrgIcon,
                          style: AppTextStyle.blackSize18Bold.copyWith(
                              color: _dark
                                  ? AppColors.whiteColor
                                  : AppColors.blackColor),
                        ),
                        const SizedBox(height: 10),
                        Text(
                          EditOrgIconDesc,
                          style: _dark
                              ? AppTextStyle.lightGreySize16
                              : AppTextStyle.darkGreySize16,
                        ),
                      ],
                    ),
                  ),
                ),
                const Divider(color: AppColors.greyColor),
                InkWell(
                  onTap: () => model.navigateToWorkspaceName(org),
                  child: Padding(
                    padding: const EdgeInsets.all(20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          EditOrgNameUrl,
                          style: AppTextStyle.blackSize18Bold.copyWith(
                              color: _dark
                                  ? AppColors.whiteColor
                                  : AppColors.blackColor),
                        ),
                        const SizedBox(height: 10),
                        Text.rich(
                          TextSpan(
                            children: [
                              TextSpan(
                                text: EditOrgNameUrlDesc1,
                                style: _dark
                                    ? AppTextStyle.lightGreySize16
                                    : AppTextStyle.darkGreySize16,
                              ),
                              TextSpan(
                                text: org.name,
                                style: AppTextStyle.blackSize18Bold.copyWith(
                                  fontSize: 16,
                                  color: _dark
                                      ? AppColors.whiteColor
                                      : AppColors.blackColor,
                                ),
                              ),
                              TextSpan(
                                text: EditOrgNameUrlDesc2,
                                style: _dark
                                    ? AppTextStyle.lightGreySize16
                                    : AppTextStyle.darkGreySize16,
                              ),
                              TextSpan(
                                text: org.organizationUrl ?? '',
                                style: AppTextStyle.blackSize18Bold.copyWith(
                                  fontSize: 16,
                                  color: _dark
                                      ? AppColors.whiteColor
                                      : AppColors.blackColor,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
