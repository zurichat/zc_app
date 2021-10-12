import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hng/constants/app_strings.dart';
import 'package:hng/ui/shared/colors.dart';
import 'package:hng/ui/shared/zuri_loader.dart';
import 'package:stacked/stacked.dart';

import 'create_organization_viewmodel.dart';
import 'company.dart';
import 'invite.dart';
import 'project.dart';

class CreateOrganization extends HookWidget {
  //The users email address can be passed in here from the api or database
  final String email;
  const CreateOrganization({Key? key, required this.email}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final pageController = usePageController();
    return ViewModelBuilder<CreateOrganizationViewModel>.reactive(
      viewModelBuilder: () => CreateOrganizationViewModel(),
      onModelReady: (model) => model.init(email),
      builder: (context, model, child) => Scaffold(
        appBar: AppBar(
          backgroundColor: AppColors.whiteColor,
          leading: TextButton(
            onPressed: () => model.back(),
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
                controller: pageController,
                children: [
                  CompanyPage(pageController: pageController),
                  ProjectPage(pageController: pageController),
                  InvitePage(pageController: pageController),
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
                  child: ZuriLoader(),
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
