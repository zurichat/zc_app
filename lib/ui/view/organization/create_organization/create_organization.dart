import 'package:flutter/material.dart';
import 'package:hng/constants/app_strings.dart';
import 'package:hng/ui/shared/colors.dart';
import 'package:stacked/stacked.dart';

import 'create_organization_viewmodel.dart';
import 'company.dart';
import 'invite.dart';
import 'project.dart';

class CreateOrganization extends StatelessWidget {
  //The users email address can be passed in here from the api or database
  final String email;
  const CreateOrganization({Key? key, required this.email}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<CreateOrganizationViewModel>.reactive(
      viewModelBuilder: () => CreateOrganizationViewModel(),
      builder: (context, model, child) => Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          leading: TextButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: Image.asset(CancelLogo),
          ),
        ),
        body: Stack(
          children: [
            Positioned(
              left: 0,
              right: 0,
              top: 0,
              bottom: 0,
              child: PageView(
                controller: model.pageController,
                children: [
                  CompanyPage(email: email),
                  const ProjectPage(),
                  const InvitePage(),
                ],
              ),
            ),
            Positioned(
              left: 0,
              right: 0,
              top: 0,
              bottom: 0,
              child: Visibility(
                visible: model.isBusy,
                child: const Center(
                  child: CircularProgressIndicator(
                    color: AppColors.zuriPrimaryColor,
                  ),
                ),
                replacement: Container(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
