import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:zurichat/utilities/constants/app_strings.dart';
import 'package:zurichat/models/organization_model.dart';
import 'package:zurichat/utilities/constants/text_styles.dart';
import 'package:zurichat/ui/shared/dumb_widgets/zuri_loader.dart';
import 'package:zurichat/utilities/internationalization/app_localization.dart';
import 'package:stacked/stacked.dart';
import '../../../../models/organization_model.dart';
import '../../../shared/shared.dart';
import 'organization_viewmodel.dart';

class OrganizationView extends StatelessWidget {
  const OrganizationView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final local = AppLocalization.of(context);
    final bool _dark = Theme.of(context).brightness == Brightness.dark;
    TextStyle _tileStyle =
        _dark ? AppTextStyle.whiteSize16 : AppTextStyle.darkGreySize16;
    return ViewModelBuilder<OrganizationViewModel>.reactive(
      onModelReady: (viewModel) => viewModel.initViewModel(),
      disposeViewModel: false,
      builder: (context, viewModel, child) {
        return Scaffold(
          body: SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    local!.workspaces,
                    style: _dark
                        ? AppTextStyle.bigWhiteText
                        : AppTextStyle.bigBlackText,
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.01,
                  ),
                  Expanded(
                    child: Visibility(
                      visible: !viewModel.isBusy,
                      child: RefreshIndicator(
                        color: AppColors.zuriPrimaryColor,
                        onRefresh: viewModel.initViewModel,
                        child: SingleChildScrollView(
                          physics: const BouncingScrollPhysics(),
                          child: viewModel.organizations.isEmpty
                              ? Center(
                                  child: Container(
                                    alignment: Alignment.center,
                                    padding: const EdgeInsets.only(top: 50.0),
                                    child: Text(
                                      local.notJoinedOrg,
                                      style: _dark
                                          ? AppTextStyle.whiteSize14
                                          : AppTextStyle.darkGreySize14,
                                    ),
                                  ),
                                )
                              : Column(
                                  children: [
                                    SizedBox(
                                      height:
                                          MediaQuery.of(context).size.height *
                                              0.005,
                                    ),
                                    ListView.builder(
                                      physics:
                                          const NeverScrollableScrollPhysics(),
                                      itemCount: viewModel.organizations.length,
                                      shrinkWrap: true,
                                      itemBuilder: (context, i) {
                                        final org = viewModel.organizations[i];

                                        return OrganizationTile(org: org);
                                      },
                                    ),
                                  ],
                                ),
                        ),
                      ),
                      replacement: const Center(child: ZuriLoader()),
                    ),
                  ),
                  SizedBox(
                    width: double.infinity,
                    child: Column(
                      children: [
                        ListTile(
                          onTap: () => viewModel.navigateToNewOrganization(),
                          leading: const Icon(Icons.add_box_outlined),
                          contentPadding: EdgeInsets.zero,
                          title: Text(
                            local.addOrg,
                            style: _tileStyle,
                          ),
                        ),
                        ListTile(
                          onTap: () => viewModel.viewPreferences(),
                          leading: const Icon(Icons.settings),
                          contentPadding: EdgeInsets.zero,
                          title: Text(
                            local.preferences,
                            style: _tileStyle,
                          ),
                        ),
                        // ListTile(
                        //   leading: const Icon(Icons.help_outline),
                        //   contentPadding: EdgeInsets.zero,
                        //   title: Text(
                        //     local.help,
                        //     style: _tileStyle,
                        //   ),
                        // ),
                        ListTile(
                          onTap: () => viewModel.signOutAllOrg(),
                          leading: const Icon(Icons.logout_sharp),
                          contentPadding: EdgeInsets.zero,
                          title: Text(
                            local.signOutAccount,
                            style: _tileStyle,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
      viewModelBuilder: () => OrganizationViewModel(),
    );
  }
}

class OrganizationTile extends ViewModelWidget<OrganizationViewModel> {
  const OrganizationTile({
    Key? key,
    required this.org,
  }) : super(key: key);

  final OrganizationModel org;

  @override
  Widget build(BuildContext context, OrganizationViewModel viewModel) {
    final bool _dark = Theme.of(context).brightness == Brightness.dark;

    return ListTile(
        onTap: () => viewModel.onTap(org),
        leading: Container(
          height: MediaQuery.of(context).size.height * 0.06,
          width: MediaQuery.of(context).size.height * 0.06,
          padding: const EdgeInsets.all(2),
          decoration: BoxDecoration(
            color: viewModel.currentOrgId == org.id
                ? Theme.of(context).brightness == Brightness.dark
                    ? AppColors.whiteColor
                    : AppColors.blackColor
                : Theme.of(context).brightness == Brightness.dark
                    ? AppColors.blackColor
                    : AppColors.whiteColor,
            borderRadius: BorderRadius.circular(5),
          ),
          child: Container(
            height: MediaQuery.of(context).size.height * 0.05,
            width: MediaQuery.of(context).size.height * 0.05,
            decoration: BoxDecoration(
              color: !_dark ? AppColors.darkModeColor : AppColors.whiteColor,
              borderRadius: BorderRadius.circular(5),
            ),
            clipBehavior: Clip.hardEdge,
            //TODO : Add the org image here
            child: org.logoUrl != null && org.logoUrl!.isNotEmpty
                ? CachedNetworkImage(
                    imageUrl: org.logoUrl!,
                    fit: BoxFit.cover,
                  )
                : Image.asset(
                    NewZuriLogo,
                    fit: BoxFit.cover,
                  ),
          ),
        ),
        //TODO : Add the org name here
        title: Text(
          org.name ?? '',
          overflow: TextOverflow.ellipsis,
          softWrap: false,
          maxLines: 2,
          style: _dark
              ? AppTextStyle.whiteSize16Bold
              : AppTextStyle.darkGreySize16Bold,
        ),
        contentPadding: EdgeInsets.zero,
        subtitle: Container(
          padding: const EdgeInsets.only(top: 5.0),
          child: Text(
            org.organizationUrl ?? '',
            style: AppTextStyle.lightGreySize14,
          ),
        ),
        trailing: GestureDetector(
            onTap: () {
              viewModel.showSignOutBottomSheet(org);
            },
            child: const Icon(Icons.more_vert)));
  }
}
