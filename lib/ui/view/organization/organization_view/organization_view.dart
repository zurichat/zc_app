import 'package:flutter/material.dart';
import 'package:hng/models/organization_model.dart';
import 'package:hng/ui/shared/text_styles.dart';
import 'package:hng/ui/shared/zuri_loader.dart';
import 'package:hng/utilities/internalization/localization/app_localization.dart';
import 'package:stacked/stacked.dart';
import '../../../../models/organization_model.dart';
import '../../../shared/shared.dart';
import 'organization_viewmodel.dart';

class OrganizationView extends StatelessWidget {
  const OrganizationView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final local = AppLocalization.of(context);
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
                    style: AppTextStyle.bigBlackText,
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
                                      style: AppTextStyle.darkGreySize14,
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
                            style: AppTextStyle.lightGreySize16,
                          ),
                        ),
                        ListTile(
                          onTap: () => viewModel.viewPreferences(),
                          leading: const Icon(Icons.settings),
                          contentPadding: EdgeInsets.zero,
                          title: Text(
                            local.preferences,
                            style: AppTextStyle.lightGreySize16,
                          ),
                        ),
                        ListTile(
                          leading: const Icon(Icons.help_outline),
                          contentPadding: EdgeInsets.zero,
                          title: Text(
                            local.help,
                            style: AppTextStyle.lightGreySize16,
                          ),
                        ),
                        ListTile(
                          onTap: () => viewModel.signOutAllOrg(),
                          leading: const Icon(Icons.logout_sharp),
                          contentPadding: EdgeInsets.zero,
                          title: Text(
                            local.signOutAccount,
                            style: AppTextStyle.lightGreySize16,
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
    return ListTile(
        onTap: () => viewModel.onTap(
            org.id, org.name, org.organizationUrl, org.userIdInOrg),
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
              border: Border.all(
                color: AppColors.whiteColor,
                width: 2,
                style: BorderStyle.solid,
              ),
              color: AppColors.greyishColor,
              borderRadius: BorderRadius.circular(5),
            ),
            clipBehavior: Clip.antiAlias,
            //TODO : Add the org image here
            child: Container(
              height: MediaQuery.of(context).size.height * 0.05,
              width: MediaQuery.of(context).size.width * 0.5,
              color: Colors.grey,
            ),
          ),
        ),
        //TODO : Add the org name here
        title: Text(
          org.name ?? '',
          overflow: TextOverflow.ellipsis,
          softWrap: false,
          maxLines: 2,
          style: AppTextStyle.darkGreySize16Bold,
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
