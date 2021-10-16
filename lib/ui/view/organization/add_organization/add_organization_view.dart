import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:zurichat/constants/app_strings.dart';
import 'package:zurichat/ui/shared/colors.dart';

import 'package:zurichat/ui/shared/text_styles.dart';
import 'package:zurichat/ui/shared/shared.dart';
import 'package:zurichat/ui/shared/zuri_appbar.dart';
import 'package:zurichat/utilities/enums.dart';
import 'package:zurichat/utilities/internalization/localization/app_localization.dart';
import 'package:stacked/stacked.dart';

import 'add_organization_viewmodel.dart';

//The Add Organization page, where user can add a new organization
//The route to this page is '/add-organization-view'
class AddOrganizationView extends StatelessWidget {
  const AddOrganizationView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final local = AppLocalization.of(context);
    return ViewModelBuilder<AddOrganizationViewModel>.reactive(
      //this parameter allows us to reuse the view model to persist the state
      disposeViewModel: false,
      //initialise the view model only once
      initialiseSpecialViewModelsOnce: true,
      viewModelBuilder: () => AddOrganizationViewModel(),
      builder: (context, model, child) {
        return Scaffold(
            backgroundColor: Theme.of(context).brightness == Brightness.dark
                ? AppColors.blackColor
                : AppColors.whiteColor,
            appBar: ZuriAppBar(
              leading: Icons.arrow_back_ios,
              orgTitle: Text(
                local!.addOrganizations,
                style: AppTextStyle.darkGreySize18Bold.copyWith(
                    color: Theme.of(context).textTheme.bodyText1!.color),
              ),
              isDarkMode: Theme.of(context).brightness == Brightness.dark,
              whiteBackground: true,
              leadingPress: model.back,
            ),
            body: InkWell(
              onTap: () => FocusScope.of(context).unfocus(),
              child: Column(children: [
                const SizedBox(height: 5),
                Container(
                  margin: const EdgeInsets.all(16.0),
                  decoration: BoxDecoration(
                    color: Theme.of(context).brightness == Brightness.dark
                        ? AppColors.darkThemePrimaryColor
                        : AppColors.whiteColor,
                    borderRadius: BorderRadius.circular(3),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        InkWell(
                          onTap: () => model.navigateToSelectEmail(
                              OrganizationSwitchMethod.signIn),
                          child: Padding(
                            padding: const EdgeInsets.all(12.0),
                            child: Row(
                              children: [
                                const Icon(
                                  Icons.grid_view,
                                ),
                                const SizedBox(width: 16),
                                Text(
                                  local.signInWorkspace,
                                  style: AppTextStyle.darkGreySize16,
                                ),
                              ],
                            ),
                          ),
                        ),
                        const Divider(color: AppColors.dividerColor),
                        InkWell(
                          onTap: () => model.navigateToSelectEmail(
                              OrganizationSwitchMethod.join),
                          child: Padding(
                            padding: const EdgeInsets.all(12.0),
                            child: Row(
                              children: [
                                SvgPicture.asset(
                                  Add_Organization,
                                  color: AppColors.darkGreyColor,
                                  width: 18,
                                  height: 18,
                                ),
                                const SizedBox(width: 16),
                                Text(
                                  local.joinWorkspace,
                                  style: AppTextStyle.darkGreySize16,
                                ),
                              ],
                            ),
                          ),
                        ),
                        const Divider(color: AppColors.dividerColor),
                        InkWell(
                          onTap: () => model.navigateToSelectEmail(
                              OrganizationSwitchMethod.create),
                          child: Padding(
                            padding: const EdgeInsets.all(12.0),
                            child: Row(
                              children: [
                                const Icon(
                                  Icons.edit_outlined,
                                ),
                                const SizedBox(width: 16),
                                Text(
                                  local.createWorkspace,
                                  style: AppTextStyle.darkGreySize16,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                )
              ]),
            ));
      },
    );
  }
}
