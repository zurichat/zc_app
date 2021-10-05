import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hng/constants/app_strings.dart';
import 'package:hng/ui/shared/colors.dart';
import 'package:hng/ui/shared/styles.dart';
import 'package:hng/utilities/enums.dart';
import 'package:stacked/stacked.dart';
import 'add_organization_viewmodel.dart';

//The Add Organization page, where user can add a new organization
//The route to this page is '/add-organization-view'
class AddOrganizationView extends StatelessWidget {
  const AddOrganizationView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<AddOrganizationViewModel>.reactive(
      //this parameter allows us to reuse the view model to persist the state
      disposeViewModel: false,
      //initialise the view model only once
      initialiseSpecialViewModelsOnce: true,
      viewModelBuilder: () => AddOrganizationViewModel(),
      builder: (context, model, child) {
        return Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.white,
            elevation: 8,
            shadowColor: Colors.black38,
            title: Text(
              AddOrganisations,
              style: AppTextStyles.heading4,
            ),
          ),
          body: GestureDetector(
            onTap: () => FocusScope.of(context).unfocus(),
            child: Column(children: [
              const SizedBox(height: 16),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(3),
                      boxShadow: const [
                        BoxShadow(
                          color: Colors.black26,
                          blurRadius: 8,
                          offset: Offset(0, 2),
                        ),
                      ]),
                  child: Padding(
                    padding:
                        const EdgeInsets.only(left: 8.0, top: 8.0, bottom: 8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        GestureDetector(
                          onTap: () => model.navigateToSelectEmail(
                              OrganizationSwitchMethod.create),
                          child: Padding(
                            padding: const EdgeInsets.all(12.0),
                            child: Row(
                              children: [
                                const Icon(
                                  Icons.edit_outlined,
                                  color: AppColors.blackColor,
                                ),
                                const SizedBox(width: 16),
                                Text(
                                  CreateNewOrg,
                                  style: AppTextStyles.regular,
                                ),
                              ],
                            ),
                          ),
                        ),
                        Row(
                          children: const [
                            SizedBox(width: 32),
                            Expanded(
                              child: Divider(
                                color: AppColors.dividerColor,
                              ),
                            ),
                          ],
                        ),
                        GestureDetector(
                          onTap: () => model.navigateToSelectEmail(
                              OrganizationSwitchMethod.signIn),
                          child: Padding(
                            padding: const EdgeInsets.all(12.0),
                            child: Row(
                              children: [
                                const Icon(
                                  Icons.grid_view,
                                  color: AppColors.blackColor,
                                ),
                                const SizedBox(width: 16),
                                Text(
                                  SignInNewOrg,
                                  style: AppTextStyles.regular,
                                ),
                              ],
                            ),
                          ),
                        ),
                        Row(
                          children: const [
                            SizedBox(width: 48),
                            Expanded(
                              child: Divider(
                                color: AppColors.dividerColor,
                              ),
                            ),
                          ],
                        ),
                        GestureDetector(
                          onTap: () => model.navigateToSelectEmail(
                              OrganizationSwitchMethod.join),
                          child: Padding(
                            padding: const EdgeInsets.all(12.0),
                            child: Row(
                              children: [
                                const Icon(
                                  Icons.add_box_outlined,
                                  color: AppColors.blackColor,
                                ),
                                const SizedBox(width: 16),
                                Text(
                                  JoinAnotherOrg,
                                  style: AppTextStyles.regular,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              const Spacer(),
              Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.2),
                      blurRadius: 5,
                      offset: const Offset(0, 2),
                    )
                  ],
                ),
              )
            ]),
          ),
        );
      },
    );
  }
}
