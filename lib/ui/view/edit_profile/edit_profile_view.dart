import 'package:flutter/material.dart';
import 'package:hng/constants/app_strings.dart';

import 'package:hng/ui/shared/shared.dart';

import 'package:stacked/stacked.dart';

import 'edit_profile_viewmodel.dart';
import 'widget/edit_profile_body.dart';

class EditProfileView extends StatelessWidget {
  const EditProfileView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size _size = MediaQuery.of(context).size;
    return ViewModelBuilder<EditProfileViewModel>.reactive(
      viewModelBuilder: () => EditProfileViewModel(),
      builder: (context, viewModel, child) => Scaffold(
        appBar: AppBar(
          elevation: 0,
          leading: IconButton(
              onPressed: viewModel.close,
              icon: const Icon(Icons.close_rounded)),
          title: const Text(EditProfile),
          actions: [
            TextButton(
              onPressed: () {},
              child: const Text(
                Save,
                style: TextStyle(color: AppColors.zuriTextBodyColor),
              ),
            )
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
