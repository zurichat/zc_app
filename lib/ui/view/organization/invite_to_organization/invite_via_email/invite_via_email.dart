import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked/stacked_annotations.dart';
import 'package:zurichat/ui/shared/colors.dart';
import 'package:zurichat/ui/shared/styles.dart';
import 'package:zurichat/ui/shared/ui_helpers.dart';
import 'package:zurichat/ui/shared/zuri_appbar.dart';
import 'package:zurichat/ui/shared/zuri_loader.dart';
import 'invite_via_email.form.dart';
import 'invite_viewmodel.dart';

@FormView(fields: [
  FormTextField(name: 'email'),
])
class InviteViaEmail extends StatelessWidget with $InviteViaEmail {
  InviteViaEmail({Key? key}) : super(key: key);
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
            orgTitle: Text(
              'Invite',
              style: AppTextStyles.heading7,
            ),
            actions: [
              Padding(
                padding: const EdgeInsets.fromLTRB(0.0, 16.0, 20.0, 0.0),
                child: InkWell(
                  child: Text(
                    "Send Request",
                    style: AppTextStyles.body1Green,
                  ),
                  highlightColor: Colors.transparent,
                  splashColor: Colors.transparent,
                  onTap: () {
                    model.inviteWithMail(emailController.text);
                  },
                ),
              ),
            ],
          ),
          body: model.isBusy == true
              ? const ZuriLoader()
              : Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
                  child: Column(
                    children: [
                      const Center(
                        child: Text(
                          "Fill in who you'd like to invite. Your request will be sent to \n the admin for approval.",
                          //style: AppTextStyles.body2_400,
                        ),
                      ),
                      UIHelper.verticalSpaceLarge,
                      Container(
                        color: AppColors.whiteColor,
                        child: TextField(
                          controller: emailController,
                          cursorColor: AppColors.zuriPrimaryColor,
                          keyboardType: TextInputType.emailAddress,
                          decoration: InputDecoration(
                            prefixIcon: const Icon(
                              Icons.email_outlined,
                              color: AppColors.zuriPrimaryColor,
                            ),
                            labelStyle: const TextStyle(
                              color: AppColors.zuriPrimaryColor,
                            ),
                            labelText: "Add an Email Address",
                            border: border(),
                            focusedBorder: border(),
                            enabledBorder: border(),
                          ),
                        ),
                      ),
                      UIHelper.verticalSpaceLarge,
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          primary: AppColors.whiteColor,
                        ),
                        onPressed: () {
                          model.navigateToContacts();
                        },
                        child: const ListTile(
                          leading: Icon(Icons.person_sharp),
                          title: Text("Invite from contacts"),
                        ),
                      ),
                    ],
                  ),
                ),
        );
      },
    );
  }
}

OutlineInputBorder border({Color? color}) {
  return OutlineInputBorder(
    borderSide: BorderSide(
      color: Colors.grey[300] ?? AppColors.greyColor,
    ),
    borderRadius: BorderRadius.circular(4),
  );
}
