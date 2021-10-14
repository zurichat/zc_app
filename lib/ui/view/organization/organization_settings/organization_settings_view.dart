import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:zurichat/models/organization_model.dart';
import 'package:zurichat/ui/shared/colors.dart';
import 'package:zurichat/ui/shared/styles.dart';
import 'package:zurichat/ui/shared/zuri_appbar.dart';

import 'organization_settings_view_model.dart';

class OrganizationSettingsView extends StatelessWidget {
  final OrganizationModel org;
  const OrganizationSettingsView({Key? key, required this.org})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<OrganizationSettingsViewModel>.reactive(
      viewModelBuilder: () => OrganizationSettingsViewModel(),
      builder: (context, model, child) {
        return Scaffold(
          appBar: ZuriAppBar(
            title: 'Workspace Settings',
            subtitle: 'zuri chat',
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
                          'Edit Workspace Icon',
                          style: AppTextStyles.heading4
                              .copyWith(color: AppColors.blackColor),
                        ),
                        const SizedBox(height: 10),
                        Text(
                          'Workspace icon is used in the desktop and mobile apps where it\'s useful in helping to quickly identify this workspace.',
                          style: AppTextStyles.bodyRegular.copyWith(
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
                          'Edit Workspace Name & URL',
                          style: AppTextStyles.heading4
                              .copyWith(color: AppColors.blackColor),
                        ),
                        const SizedBox(height: 10),
                        Text.rich(
                          TextSpan(
                            children: [
                              TextSpan(
                                text: 'Your workspace name is ',
                                style: AppTextStyles.bodyRegular.copyWith(
                                    fontSize: 15, color: AppColors.greyColor),
                              ),
                              TextSpan(
                                text: org.name,
                                style: AppTextStyles.bodyBig.copyWith(
                                  fontSize: 15,
                                  color: AppColors.blackColor,
                                ),
                              ),
                              TextSpan(
                                text: ' and your URL is ',
                                style: AppTextStyles.bodyRegular.copyWith(
                                    fontSize: 15, color: AppColors.greyColor),
                              ),
                              TextSpan(
                                text: org.organizationUrl ?? '',
                                style: AppTextStyles.bodyBig.copyWith(
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
