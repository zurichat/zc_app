import 'package:flutter/material.dart';
import 'package:zurichat/utilities/constants/text_styles.dart';
import 'package:stacked/stacked.dart';
import 'package:zurichat/utilities/constants/app_strings.dart';
import 'package:zurichat/models/organization_model.dart';
import 'package:zurichat/utilities/constants/colors.dart';
import 'package:zurichat/ui/shared/dumb_widgets/zuri_appbar.dart';

import 'organization_settings_view_model.dart';

class OrganizationSettingsView extends StatelessWidget {
  final OrganizationModel org;
  const OrganizationSettingsView({Key? key, required this.org})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bool dark = Theme.of(context).brightness == Brightness.dark;

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
            isDarkMode: dark,
          ),
          body: Container(
            margin: const EdgeInsets.all(20),
            decoration: const BoxDecoration(
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
                        Text(EditOrgIcon,
                            style: dark
                                ? AppTextStyle.whiteSize18Bold
                                : AppTextStyle.darkGreySize18Bold),
                        const SizedBox(height: 10),
                        Text(EditOrgIconDesc,
                            style: dark
                                ? AppTextStyle.whiteSize14
                                : AppTextStyle.lightGreySize14),
                      ],
                    ),
                  ),
                ),
                // const Divider(color: AppColors.greyColor),
                // InkWell(
                //   onTap: () => model.navigateToWorkspaceName(org),
                //   child: Padding(
                //     padding: const EdgeInsets.all(20),
                //     child: Column(
                //       crossAxisAlignment: CrossAxisAlignment.start,
                //       children: [
                //         Text(
                //           EditOrgNameUrl,
                //           style: _dark
                //               ? AppTextStyle.whiteSize18Bold
                //               : AppTextStyle.darkGreySize18Bold,
                //         ),
                //         const SizedBox(height: 10),
                //         Text.rich(
                //           TextSpan(
                //             children: [
                //               TextSpan(
                //                 text: EditOrgNameUrlDesc1,
                //                 style: _dark
                //                     ? AppTextStyle.whiteSize14
                //                     : AppTextStyle.darkGreySize14,
                //               ),
                //               TextSpan(
                //                   text: org.name,
                //                   style: _dark
                //                       ? AppTextStyle.whiteSize14Bold
                //                       : AppTextStyle.darkGreySize14Bold),
                //               TextSpan(
                //                   text: EditOrgNameUrlDesc2,
                //                   style: _dark
                //                       ? AppTextStyle.whiteSize14
                //                       : AppTextStyle.darkGreySize14),
                //               TextSpan(
                //                   text: org.organizationUrl ?? '',
                //                   style: _dark
                //                       ? AppTextStyle.whiteSize14Bold
                //                       : AppTextStyle.darkGreySize14Bold),
                //             ],
                //           ),
                //         ),
                //       ],
                //     ),
                //   ),
                // ),
              ],
            ),
          ),
        );
      },
    );
  }
}
