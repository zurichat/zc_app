import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hng/ui/shared/long_button.dart';
import 'package:hng/ui/shared/ui_helpers.dart';
import 'package:hng/ui/shared/zuri_appbar.dart';
import 'package:hng/ui/view/organization/invite_to_organization/invite_viewmodel.dart';
import 'package:stacked/stacked.dart';

class InvitationSent extends StatelessWidget {
  const InvitationSent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
          ),
          body: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 8.0, vertical: 64.0,
            ),
            child: Column(
              children: [
                SvgPicture.asset(
                  'assets/icons/svg_icons/invite.svg',
                  width: 50,
                ),
                UIHelper.verticalSpaceLarge,
                const Text("Invitation sent"),
                UIHelper.verticalSpaceLarge,
                const ListTile(
                  leading: Icon(
                    Icons.email_outlined,
                  ),
                  title: Text("thepump@gmail.com"),
                ),
                UIHelper.verticalSpaceLarge,
               const Center(
                  child: Text(
                      "Has been invited as a member of zuri chat. \n They’ll be able to receive and reply in messages by email until they join."),
                ),
                UIHelper.customVerticalSpace(560),
                LongButton(
                  onPressed: () {},
                  label: "Done",
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
