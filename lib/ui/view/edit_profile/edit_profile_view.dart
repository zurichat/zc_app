import 'package:flutter/material.dart';
import 'package:hng/constants/app_strings.dart';
import 'package:hng/models/user_model.dart';

import 'package:hng/ui/shared/shared.dart';
import 'package:hng/ui/shared/zuri_appbar.dart';

import 'package:stacked/stacked.dart';

import 'edit_profile_viewmodel.dart';
import 'widget/edit_profile_body.dart';

class EditProfileView extends StatelessWidget {
  final UserModel user;
  const EditProfileView({Key? key, required this.user}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size _size = MediaQuery.of(context).size;
    return ViewModelBuilder<EditProfileViewModel>.reactive(
      viewModelBuilder: () => EditProfileViewModel(),
      onModelReady: (model) => model.onInit(user),
      builder: (context, viewModel, child) => Scaffold(
        appBar: ZuriAppBar(
          whiteBackground: true,
          leading: Icons.close_rounded,
          leadingPress: () => viewModel.close(),
          orgTitle: Text(
            "Edit Profile",
            style: AppTextStyles.heading7,
          ),
          actions: [
            TextButton(
              onPressed: () => viewModel.onSave(),
              child: Text(
                Save.toUpperCase(),
                style: AppTextStyles.body1Bold,
              ),
            ),
          ],
        ),
        body: Visibility(
          visible: !viewModel.isBusy,
          child: Body(size: _size),
          replacement: Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Text(GettingYourData),
                CircularProgressIndicator(
                  color: AppColors.zuriPrimaryColor,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
