import 'package:flutter/material.dart';
import 'package:hng/ui/shared/text_styles.dart';
import 'package:stacked/stacked.dart';
import 'package:hng/constants/app_strings.dart';
import 'package:hng/models/organization_model.dart';
import 'package:hng/ui/shared/colors.dart';
import 'package:hng/ui/shared/zuri_appbar.dart';

import 'organization_settings_view_model.dart';

class OrganizationSettingsView extends StatelessWidget {
  final OrganizationModel org;
  const OrganizationSettingsView({Key? key, required this.org})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<OrganizationSettingsViewModel>.reactive(
      viewModelBuilder: () => OrganizationSettingsViewModel(),
      onModelReady: (model) => model.init(org.name!, org.organizationUrl!),
      builder: (context, model, child) {
        return Scaffold(
          appBar: ZuriAppBar(
            title: OrgSettings,
            subtitle: org.name,
            whiteBackground: true,
            leading: Icons.chevron_left,
            leadingPress: () => model.back(),
          ),
          body: Container(
            margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
            decoration: const BoxDecoration(
              color: AppColors.whiteColor,
              boxShadow: [
                BoxShadow(
                  color: AppColors.shadowColor,
                  spreadRadius: 10,
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
                          style: AppTextStyle.blackSize18Bold
                              .copyWith(color: AppColors.blackColor),
                        ),
                        const SizedBox(height: 10),
                        Text(
                          EditOrgIconDesc,
                          style: AppTextStyle.lightGreySize16.copyWith(
                              fontSize: 15, color: AppColors.greyColor),
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
                          style: AppTextStyle.blackSize18Bold
                              .copyWith(color: AppColors.blackColor),
                        ),
                        const SizedBox(height: 10),
                        Text.rich(
                          TextSpan(
                            children: [
                              TextSpan(
                                text: EditOrgNameUrlDesc1,
                                style: AppTextStyle.lightGreySize16.copyWith(
                                    fontSize: 15, color: AppColors.greyColor),
                              ),
                              TextSpan(
                                text: org.name,
                                style: AppTextStyle.blackSize18Bold.copyWith(
                                  fontSize: 15,
                                  color: AppColors.blackColor,
                                ),
                              ),
                              TextSpan(
                                text: EditOrgNameUrlDesc2,
                                style: AppTextStyle.lightGreySize16.copyWith(
                                    fontSize: 15, color: AppColors.greyColor),
                              ),
                              TextSpan(
                                text: org.organizationUrl ?? '',
                                style: AppTextStyle.blackSize18Bold.copyWith(
                                  fontSize: 15,
                                  color: AppColors.blackColor,
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
