import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:stacked/stacked.dart';
import 'package:zurichat/models/organization_model.dart';
import 'package:zurichat/ui/shared/text_styles.dart';
import 'package:zurichat/ui/view/organization/organization_settings/organization_settings_view_model.dart';
import 'package:zurichat/constants/app_strings.dart';
import 'package:zurichat/ui/shared/colors.dart';
import 'package:zurichat/ui/shared/text_field.dart';
import 'package:zurichat/ui/shared/zuri_appbar.dart';
import 'package:zurichat/ui/shared/zuri_loader.dart';

class OrganizationNameUrl extends HookWidget {
  final OrganizationModel org;

  OrganizationNameUrl({Key? key, required this.org}) : super(key: key);
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    final _orgNameController = useTextEditingController(text: org.name);
    final _orgUrlController =
        useTextEditingController(text: org.organizationUrl?.split('.').first);
    final bool _dark = Theme.of(context).brightness == Brightness.dark;
    return ViewModelBuilder<OrganizationSettingsViewModel>.reactive(
      viewModelBuilder: () => OrganizationSettingsViewModel(),
      onModelReady: (model) => model.init(org.name!, org.organizationUrl!),
      builder: (context, viewModel, child) {
        return Scaffold(
          appBar: ZuriAppBar(
            whiteBackground: true,
            isDarkMode: _dark,
            title: OrgnameUrl,
            subtitle: '',
            leading: Icons.close,
            leadingPress: () => viewModel.back(),
            actions: [
              TextButton(
                onPressed: () {
                  if (!_formKey.currentState!.validate()) return;
                  viewModel.updateOrgNameAndUrl(org.id.toString(),
                      _orgNameController.text, _orgUrlController.text);
                },
                child: Text(
                  Save,
                  style: _dark
                      ? AppTextStyle.lightGreySize16
                      : AppTextStyle.darkGreySize16,
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
                      padding: const EdgeInsets.symmetric(
                          horizontal: 25, vertical: 20),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            OrgName,
                            style: AppTextStyle.blackSize18Bold.copyWith(
                                color: _dark
                                    ? AppColors.whiteColor
                                    : AppColors.blackColor),
                          ),
                          const SizedBox(height: 15),
                          Flexible(
                            child: BorderTextField(
                              hint: CompanyNameHint,
                              controller: _orgNameController,
                              textCapitalization: TextCapitalization.words,
                              validator: (val) =>
                                  viewModel.validateNotEmptyField(val!),
                            ),
                          ),
                          const SizedBox(height: 15),
                          Text(
                            OrgNameDesc,
                            style: _dark
                                ? AppTextStyle.lightGreySize16
                                : AppTextStyle.darkGreySize16,
                          ),
                        ],
                      ),
                    ),
                    const Divider(color: AppColors.greyColor, thickness: 1),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 25, vertical: 20),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            OrgUrl,
                            style: AppTextStyle.blackSize18Bold.copyWith(
                                color: _dark
                                    ? AppColors.whiteColor
                                    : AppColors.blackColor),
                          ),
                          const SizedBox(height: 15),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Flexible(
                                child: BorderTextField(
                                  hint: "hng_i8",
                                  controller: _orgUrlController,
                                  textCapitalization: TextCapitalization.none,
                                  validator: viewModel.vaidateOrgUrl,
                                  textAlign: TextAlign.end,
                                ),
                              ),
                              const SizedBox(width: 10),
                              Text(
                                '.zurichat.com',
                                style: _dark
                                    ? AppTextStyle.lightGreySize16
                                    : AppTextStyle.darkGreySize16,
                              ),
                            ],
                          ),
                          const SizedBox(height: 15),
                          Text(
                            OrgUrlDesc,
                            style: _dark
                                ? AppTextStyle.lightGreySize16
                                : AppTextStyle.darkGreySize16,
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
      },
    );
  }
}
