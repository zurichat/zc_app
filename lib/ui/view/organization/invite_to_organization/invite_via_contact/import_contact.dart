import 'package:flutter/material.dart';
import 'package:zurichat/ui/nav_pages/plugin_page/widgets/custom_search_field.dart';
import 'package:zurichat/ui/shared/text_styles.dart';
import 'package:zurichat/ui/shared/zuri_appbar.dart';
import 'package:zurichat/utilities/internalization/localization/app_localization.dart';
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

            isDarkMode: Theme.of(context).brightness == Brightness.dark,

            leading: Icons.close,
            leadingPress: () {
              model.navigateBack();
            },
            whiteBackground: true,
            orgTitle: Text(

              local!.chooseContacts,
              style: TextStyle(
                color: Theme.of(context).textTheme.bodyText1!.color,
              ),

            ),
            actions: [
              Padding(
                padding: const EdgeInsets.fromLTRB(0.0, 16.0, 20.0, 0.0),
                child: InkWell(
                    child: Text(
                      "Add",

                      style: AppTextStyle.greenSize16,

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
