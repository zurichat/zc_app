import 'package:flutter/material.dart';
import 'package:zurichat/constants/app_strings.dart';
import 'package:zurichat/models/user_model.dart';

import 'package:zurichat/ui/shared/shared.dart';
import 'package:zurichat/ui/shared/zuri_appbar.dart';
import 'package:zurichat/ui/shared/zuri_loader.dart';

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
            style: AppTextStyles.heading4,
          ),
          actions: [
            TextButton(
              onPressed: () => viewModel.onSave(),
              child: Text(
                Save.toUpperCase(),
                style: AppTextStyles.body1Bold.copyWith(
                    color: viewModel.hasDataChanged
                        ? AppColors.deepBlackColor
                        : AppColors.zuriGrey),
              ),
            ),
          ],
        ),
        body: Visibility(
          visible: !viewModel.isBusy,
          child: Body(size: _size),
          replacement: const ZuriLoader(),
        ),
      ),
    );
  }
}
