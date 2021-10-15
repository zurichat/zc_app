import 'package:flutter/material.dart';
import 'package:hng/models/user_model.dart';

import 'package:hng/ui/shared/text_styles.dart';
import 'package:hng/ui/shared/zuri_appbar.dart';
import 'package:hng/ui/shared/zuri_loader.dart';
import 'package:hng/utilities/internalization/localization/app_localization.dart';

import 'package:stacked/stacked.dart';

import 'edit_profile_viewmodel.dart';
import 'widget/edit_profile_body.dart';

class EditProfileView extends StatelessWidget {
  final UserModel user;
  const EditProfileView({Key? key, required this.user}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final local = AppLocalization.of(context);
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
            local!.editProfileButton,
            style: AppTextStyle.darkGreySize18Bold,
          ),
          actions: [
            TextButton(
              onPressed: () => viewModel.onSave(),
              child: Text(
                local.save.toUpperCase(),
                style: viewModel.hasDataChanged
                    ? AppTextStyle.darkGreySize16Bold
                    : AppTextStyle.lightGreySize16,
              ),
            ),
          ],
        ),
        body: Visibility(
            visible: !viewModel.isBusy,
            child: Body(size: _size),
            replacement: const ZuriLoader()),
      ),
    );
  }
}
