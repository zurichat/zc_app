import 'package:flutter/material.dart';
import 'package:hng/constants/app_strings.dart';

import 'package:hng/ui/shared/shared.dart';

import 'package:stacked/stacked.dart';

import 'edit_profile_viewmodel.dart';

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
              onPressed: viewModel.exitPage,
              icon: const Icon(Icons.close_rounded)),
          title: const Text(EditProfile),
          actions: [
            TextButton(
              onPressed: () async {
                await viewModel.updateProfile();
              },
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
                          onPressed: () {
                            viewModel.uploadImage;
                          },
                          icon: Icon(
                            Icons.add_a_photo,
                            size: _size.width * 0.06,
                          )),
                    ),
                  ),
                  const Spacer(),
                  SizedBox(
                    width: _size.width * 0.55,
                    child: TextFormField(
                      initialValue: viewModel.userData.firstName,
                      onChanged: (value) {
                        viewModel.updateString(value, '', '', '');
                      },
                      decoration: const InputDecoration(
                        labelText: FullName,
                      ),
                    ),
                  )
                ],
              ),
            ),
            TextFormField(
              initialValue: viewModel.userData.displayName,
              onChanged: (value) {
                viewModel.updateString('', value, '', '');
              },
              decoration: const InputDecoration(
                labelText: DisplayName,
                helperText: DisplayNameDescription,
                helperMaxLines: 3,
              ),
            ),
            TextFormField(
              initialValue: viewModel.userData.status,
              onChanged: (value) {
                viewModel.updateString('', '', value, '');
              },
              decoration: const InputDecoration(
                  labelText: Track, helperText: TrackDescription),
            ),
            TextFormField(
              initialValue: viewModel.userData.phoneNum,
              onChanged: (value) {
                viewModel.updateString('', '', '', value);
              },
              decoration: const InputDecoration(
                  labelText: Phone, helperText: PhoneDescription),
            ),
          ],
        ),
      ),
    );
  }
}
