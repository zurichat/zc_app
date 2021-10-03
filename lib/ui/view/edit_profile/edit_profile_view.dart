import 'package:flutter/material.dart';
import 'package:hng/constants/app_strings.dart';

import 'package:hng/ui/shared/shared.dart';

import 'package:stacked/stacked.dart';

import 'edit_profile_viewmodel.dart';

// ignore: use_key_in_widget_constructors
class EditProfileView extends StatelessWidget {
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
          child: Container(
            padding: EdgeInsets.symmetric(
                vertical: _size.height * 0.02, horizontal: _size.width * 0.05),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  // ignore: sized_box_for_whitespace
                  Container(
                    height: _size.height * 0.14,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Container(
                          width: _size.height * 0.14,
                          height: double.maxFinite,
                          decoration: const BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage(
                                  "assets/background/appBarLogo.png"),
                              fit: BoxFit.contain,
                            ),
                            // ignore: prefer_const_constructors
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
                                )),
                          ),
                        ),
                        const Spacer(),
                        // ignore: sized_box_for_whitespace
                        Container(
                          width: _size.width * 0.55,
                          child: TextFormField(
                            initialValue: viewModel.currentUserData.firstName,
                            onChanged: (value) {
                              viewModel.updateString(value, '', '', '');
                            },
                            decoration: const InputDecoration(
                              labelText: "Full Name",
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  TextFormField(
                    initialValue: viewModel.currentUserData.displayName,
                    onChanged: (value) {
                      viewModel.updateString('', value, '', '');
                    },
                    decoration: const InputDecoration(
                      labelText: "Display Name",
                      helperText:
                          "This is how your name will show up in Zuri Chat. It’s best kept simple: whatever people call you in everyday conversation.",
                      helperMaxLines: 3,
                    ),
                  ),
                  TextFormField(
                    initialValue: viewModel.currentUserData.status,
                    onChanged: (value) {
                      viewModel.updateString('', '', value, '');
                    },
                    decoration: const InputDecoration(
                        labelText: "What I do", helperText: "HNGi9 X I4G"),
                  ),
                  TextFormField(
                    initialValue: viewModel.currentUserData.phoneNum,
                    onChanged: (value) {
                      viewModel.updateString('', '', '', value);
                    },
                    decoration: const InputDecoration(
                        labelText: "Phone",
                        helperText: "Enter your phone number"),
                  ),
                ],
              ),
            ),
          ),
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
