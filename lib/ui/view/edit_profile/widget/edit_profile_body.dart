import 'package:flutter/material.dart';
import 'package:zurichat/constants/app_strings.dart';
import 'package:zurichat/ui/shared/shared.dart';
//import 'package:zurichat/utilities/internalization/localization/app_localization.dart';
import 'package:stacked/stacked.dart';

import '../edit_profile_viewmodel.dart';

class Body extends ViewModelWidget<EditProfileViewModel> {
  final Size _size;
  const Body({
    Key? key,
    required Size size,
  })  : _size = size,
        super(key: key, reactive: true);
  @override
  Widget build(BuildContext context, EditProfileViewModel viewModel) {
    return Container(
      padding: EdgeInsets.symmetric(
          vertical: _size.height * 0.02, horizontal: _size.width * 0.05),
      child: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: _size.height * 0.14,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Container(
                    width: _size.height * 0.14,
                    height: double.maxFinite,
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage(ZuriAppbarLogo),
                        fit: BoxFit.contain,
                      ),
                      borderRadius: BorderRadius.all(
                        Radius.circular(10),
                      ),
                      color: AppColors.greyishColor,
                    ),
                    child: Align(
                      alignment: Alignment.bottomRight,
                      child: IconButton(
                        onPressed: () {},
                        icon: Icon(
                          Icons.add_a_photo,
                          size: _size.width * 0.06,
                          color: AppColors.whiteColor,
                        ),
                      ),
                    ),
                  ),
                  const Spacer(),
                  SizedBox(
                    width: _size.width * 0.55,
                    child: TextFormField(
                      initialValue: viewModel.userModel.fullName,
                      onChanged: (value) => viewModel.onChanged(name: value),
                      decoration: const InputDecoration(
                        labelText: FullName,
                      ),
                    ),
                  )
                ],
              ),
            ),
            TextFormField(
              initialValue: viewModel.userModel.displayName,
              onChanged: (value) => viewModel.onChanged(disp: value),
              decoration: const InputDecoration(
                labelText: DisplayName,
                helperText: DisplayNameDescription,
                helperMaxLines: 3,
              ),
            ),
            TextFormField(
              initialValue: viewModel.userModel.bio,
              onChanged: (value) => viewModel.onChanged(bo: value),
              decoration: const InputDecoration(
                  labelText: Track, helperText: TrackDescription),
            ),
            TextFormField(
              initialValue: viewModel.userModel.phoneNumber,
              onChanged: (value) => viewModel.onChanged(phn: value),
              decoration: const InputDecoration(
                  labelText: Phone, helperText: PhoneDescription),
            ),
          ],
        ),
      ),
    );
  }
}
