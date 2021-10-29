import 'package:flutter/material.dart';
import 'package:zurichat/utilities/constants/text_styles.dart';
import 'package:stacked/stacked.dart';
import 'package:zurichat/utilities/constants/app_strings.dart';
import 'package:zurichat/models/organization_model.dart';
import 'package:zurichat/utilities/constants/colors.dart';
import 'package:zurichat/ui/shared/dumb_widgets/long_button.dart';
import 'package:zurichat/ui/shared/dumb_widgets/zuri_appbar.dart';
import 'package:zurichat/ui/shared/dumb_widgets/zuri_loader.dart';
import 'package:zurichat/ui/view/organization/organization_settings/organization_settings_view_model.dart';

class OrganizationLogo extends StatelessWidget {
  final OrganizationModel org;
  const OrganizationLogo({Key? key, required this.org}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bool _dark = Theme.of(context).brightness == Brightness.dark;

    return ViewModelBuilder<OrganizationSettingsViewModel>.reactive(
      viewModelBuilder: () => OrganizationSettingsViewModel(),
      builder: (context, model, child) {
        return Scaffold(
          appBar: ZuriAppBar(
            isDarkMode: _dark,
            whiteBackground: true,
            leading: Icons.chevron_left,
            leadingPress: () => model.back(),
            orgTitle: Text(
              OrgIcon,
              style: AppTextStyle.organizationNameText,
            ),
            actions: [
              TextButton(
                onPressed: () => model.updateOrgLogo(org.id.toString()),
                child: Text(
                  Save,
                  style: AppTextStyle.lightGreySize16.copyWith(
                    color: AppColors.zuriPrimaryColor,
                  ),
                ),
              ),
            ],
          ),
          body: Stack(
            fit: StackFit.expand,
            children: [
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      height: 150,
                      width: 150,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                      ),
                      clipBehavior: Clip.hardEdge,
                      child: model.tempImage == null && org.logoUrl!.isEmpty
                          ? Image.asset(
                              ZuriWordLogo,
                              fit: BoxFit.cover,
                            )
                          : model.tempImage != null
                              ? Image.file(
                                  model.tempImage!,
                                  fit: BoxFit.cover,
                                )
                              : Image.network(
                                  org.logoUrl!,
                                  fit: BoxFit.cover,
                                ),
                    ),
                    const SizedBox(height: 20),
                    LongButton(
                      onPressed: () => model.selectImage(),
                      label: UploadLogo,
                      width: 200,
                    ),
                    const SizedBox(height: 30),
                    Text(OrgIconGuide,
                        style: _dark
                            ? AppTextStyle.whiteSize18Bold
                            : AppTextStyle.blackSize18Bold),
                    const SizedBox(height: 10),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Text(OrgIconGuideDesc,
                          style: AppTextStyle.lightGreySize16),
                    ),
                  ],
                ),
              ),
              Visibility(
                visible: model.isBusy,
                child: Container(
                  alignment: Alignment.center,
                  height: 100,
                  child: const ZuriLoader(isTransparent: true),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
