import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

import 'package:zurichat/ui/shared/dumb_widgets/zuri_loader.dart';
import 'package:zurichat/ui/shared/dumb_widgets/zuri_appbar.dart';
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
    final bool dark = Theme.of(context).brightness == Brightness.dark;

    return ViewModelBuilder<CreateOrganizationViewModel>.reactive(
      viewModelBuilder: () => CreateOrganizationViewModel(),
      onModelReady: (model) => model.init(email),
      builder: (context, model, child) => Scaffold(
        appBar: ZuriAppBar(
            whiteBackground: true,
            isDarkMode: dark,
            leadingPress: () => model.back(),
            leading: Icons.close_outlined),
        body: Stack(
          children: [
            Positioned(
              left: 0,
              right: 0,
              top: 0,
              bottom: 0,
              child: PageView(
                controller: pageController,
                allowImplicitScrolling: false,
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
                replacement: Container(),
                child: const Center(
                  child: ZuriLoader(),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
