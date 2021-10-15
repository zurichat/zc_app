import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:hng/constants/app_strings.dart';
import 'package:hng/models/organization_model.dart';
import 'package:hng/ui/shared/colors.dart';
import 'package:hng/ui/shared/long_button.dart';
import 'package:hng/ui/shared/styles.dart';
import 'package:hng/ui/shared/zuri_appbar.dart';
import 'package:hng/ui/shared/zuri_loader.dart';
import 'package:hng/ui/view/organization/organization_settings/organization_settings_view_model.dart';

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
            leading: Icons.chevron_left,
            leadingPress: () => model.back(),
            title: OrgIcon,
            subtitle: '',
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
                        // border: Border.all(color: AppColors.greyColor, width: 1),
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
                    Text(
                      OrgIconGuide,
                      style: AppTextStyles.heading4
                          .copyWith(color: AppColors.blackColor, fontSize: 20),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      OrgIconGuideDesc,
                      style: AppTextStyles.bodyRegular.copyWith(
                          fontSize: 17, color: AppColors.greyishColor),
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
