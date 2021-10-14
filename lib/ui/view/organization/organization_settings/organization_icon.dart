import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:zurichat/constants/app_strings.dart';
import 'package:zurichat/models/organization_model.dart';
import 'package:zurichat/ui/shared/colors.dart';
import 'package:zurichat/ui/shared/long_button.dart';
import 'package:zurichat/ui/shared/styles.dart';
import 'package:zurichat/ui/shared/zuri_appbar.dart';
import 'package:zurichat/ui/view/organization/organization_settings/organization_settings_view_model.dart';

class OrganizationLogo extends StatelessWidget {
  final OrganizationModel org;
  const OrganizationLogo({Key? key, required this.org}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<OrganizationSettingsViewModel>.reactive(
      viewModelBuilder: () => OrganizationSettingsViewModel(),
      builder: (context, model, child) {
        return Scaffold(
          appBar: ZuriAppBar(
            whiteBackground: true,
            title: 'Workspace Icon',
            actions: [
              TextButton(
                onPressed: () => model.updateOrgLogo(org.id.toString()),
                child: Text(
                  Save,
                  style: AppTextStyles.bodyRegular.copyWith(
                    color: AppColors.zuriPrimaryColor,
                  ),
                ),
              ),
            ],
          ),
          body: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  height: 150,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    // border: Border.all(color: AppColors.greyColor, width: 1),
                  ),
                  clipBehavior: Clip.hardEdge,
                  child: model.tempImage == null && org.logoUrl!.isEmpty
                      ? Image.asset('assets/logo/zuri_word_and_logo.png')
                      : model.tempImage != null
                          ? Image.file(model.tempImage!)
                          : Image.network(org.logoUrl!),
                ),
                const SizedBox(height: 20),
                LongButton(
                  onPressed: () => model.selectImage(),
                  label: 'Upload Icon',
                  width: 200,
                ),
                const SizedBox(height: 30),
                Text(
                  'Workspace Icon guideline',
                  style: AppTextStyles.heading4
                      .copyWith(color: AppColors.blackColor, fontSize: 20),
                ),
                const SizedBox(height: 10),
                Text(
                  '''Your workspace icon is a way for you to visually identify the Clutch king workspace. It is used in the desktop and mobile apps, and on your workspace admin site. It's most helpful when you are on multiple ZuriChat workspaces.''',
                  style: AppTextStyles.bodyRegular
                      .copyWith(fontSize: 17, color: AppColors.greyishColor),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
