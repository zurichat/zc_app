import 'package:flutter/material.dart';
import 'package:hng/ui/nav_pages/plugin_page/widgets/custom_search_field.dart';
import 'package:hng/ui/shared/styles.dart';
import 'package:hng/ui/shared/zuri_appbar.dart';
import 'package:hng/utilities/internalization/localization/app_localization.dart';
import 'package:stacked/stacked.dart';

import '../invite_via_email/invite_viewmodel.dart';

class ImportContacts extends StatelessWidget {
  const ImportContacts({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final local = AppLocalization.of(context);
    return ViewModelBuilder<InviteViewModel>.reactive(
      viewModelBuilder: () => InviteViewModel(),
      builder: (BuildContext context, InviteViewModel model, Widget? children) {
        return Scaffold(
          appBar: ZuriAppBar(
            leading: Icons.close,
            leadingPress: () {
              model.navigateBack();
            },
            whiteBackground: true,
            orgTitle: Text(
              local!.chooseContacts,
              style: AppTextStyles.heading7,
            ),
            actions: [
              Padding(
                padding: const EdgeInsets.fromLTRB(0.0, 16.0, 20.0, 0.0),
                child: InkWell(
                    child: Text(
                      "Add",
                      style: AppTextStyles.body1Green,
                    ),
                    highlightColor: Colors.transparent,
                    splashColor: Colors.transparent,
                    onTap: () {
                      model.navigateToInvitationSent();
                    }),
              ),
            ],
          ),
          body: Padding(
            padding: const EdgeInsets.fromLTRB(16.0, 24.0, 16.0, 24.0),
            child: ListView(
              children: [
                const SizedBox(
                  height: 40.0,
                  child: CustomSearchField(
                    searchHint: 'Select or type an email address',
                  ),
                ),
                const SizedBox(
                  height: 40.0,
                ),
                ListTile(
                  leading: CircleAvatar(
                    child: Image.asset("assets/images/avatar.png"),
                  ),
                  title: const Text("BrodaDemi"),
                ),
                const SizedBox(
                  height: 40.0,
                ),
                ListTile(
                  leading: CircleAvatar(
                    child: Image.asset("assets/images/avatar.png"),
                  ),
                  title: const Text("BrodaDemi"),
                ),
                const SizedBox(
                  height: 40.0,
                ),
                ListTile(
                  leading: CircleAvatar(
                    child: Image.asset("assets/images/avatar.png"),
                  ),
                  title: const Text("BrodaDemi"),
                ),
                const SizedBox(
                  height: 40.0,
                ),
                ListTile(
                  leading: CircleAvatar(
                    child: Image.asset("assets/images/avatar.png"),
                  ),
                  title: const Text("BrodaDemi"),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}