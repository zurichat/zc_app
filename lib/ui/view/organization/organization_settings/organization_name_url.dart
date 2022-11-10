import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:zurichat/models/organization_model.dart';
import 'package:zurichat/utilities/constants/text_styles.dart';
import 'package:zurichat/ui/view/organization/organization_settings/organization_settings_view_model.dart';
import 'package:zurichat/utilities/constants/app_strings.dart';
import 'package:zurichat/utilities/constants/colors.dart';
import 'package:zurichat/ui/shared/dumb_widgets/text_field.dart';
import 'package:zurichat/ui/shared/dumb_widgets/zuri_appbar.dart';
import 'package:zurichat/ui/shared/dumb_widgets/zuri_loader.dart';
import 'package:stacked_hooks/stacked_hooks.dart';

class OrganizationNameUrl
    extends HookViewModelWidget<OrganizationSettingsViewModel> {
  final OrganizationModel org;

  OrganizationNameUrl({Key? key, required this.org}) : super(key: key);
  final _formKey = GlobalKey<FormState>();
  @override
  Widget buildViewModelWidget(
      BuildContext context, OrganizationSettingsViewModel viewModel) {
    final orgNameController = useTextEditingController(text: org.name);
    final orgUrlController =
        useTextEditingController(text: org.organizationUrl?.split('.').first);
    return Scaffold(
      appBar: ZuriAppBar(
        whiteBackground: true,
        title: OrgnameUrl,
        subtitle: '',
        leading: Icons.chevron_left,
        leadingPress: () => viewModel.back(),
        actions: [
          TextButton(
            onPressed: () {
              if (!_formKey.currentState!.validate()) return;
              viewModel.updateOrgNameAndUrl(org.id.toString(),
                  orgNameController.text, orgUrlController.text);
            },
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
          Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 25, vertical: 20),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        OrgName,
                        style: AppTextStyle.blackSize18Bold.copyWith(
                            color: AppColors.blackColor, fontSize: 18),
                      ),
                      const SizedBox(height: 15),
                      Flexible(
                        child: BorderTextField(
                          hint: CompanyNameHint,
                          controller: orgNameController,
                          textCapitalization: TextCapitalization.words,
                          validator: (val) =>
                              viewModel.validateNotEmptyField(val!),
                        ),
                      ),
                      const SizedBox(height: 15),
                      Text(
                        OrgNameDesc,
                        style: AppTextStyle.lightGreySize16
                            .copyWith(fontSize: 15, color: AppColors.greyColor),
                      ),
                    ],
                  ),
                ),
                const Divider(color: AppColors.greyColor, thickness: 1),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 25, vertical: 20),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        OrgUrl,
                        style: AppTextStyle.blackSize18Bold.copyWith(
                            color: AppColors.blackColor, fontSize: 18),
                      ),
                      const SizedBox(height: 15),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Flexible(
                            child: BorderTextField(
                              hint: "hng_i8",
                              controller: orgUrlController,
                              textCapitalization: TextCapitalization.none,
                              validator: viewModel.vaidateOrgUrl,
                              textAlign: TextAlign.end,
                            ),
                          ),
                          const SizedBox(width: 10),
                          Text(
                            '.zurichat.com',
                            style: AppTextStyle.lightGreySize16
                                .copyWith(fontSize: 15),
                          ),
                        ],
                      ),
                      const SizedBox(height: 15),
                      Text(
                        OrgUrlDesc,
                        style: AppTextStyle.lightGreySize16
                            .copyWith(fontSize: 15, color: AppColors.greyColor),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Visibility(
            visible: viewModel.isBusy,
            child: Container(
              alignment: Alignment.center,
              height: 100,
              child: const ZuriLoader(isTransparent: true),
            ),
          ),
        ],
      ),
    );
  }
}
