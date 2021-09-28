import 'package:flutter/material.dart';
import 'package:hng/ui/shared/bottom_sheets/custom_user_bottomsheet/custom_user_bottom_sheet_viewmodel.dart';
import 'package:hng/ui/view/edit_profile/edit_profile_view.form.dart';
import 'package:stacked/stacked_annotations.dart';

import 'package:hng/ui/shared/shared.dart';

import 'package:stacked/stacked.dart';

import 'edit_profile_viewmodel.dart';

@FormView(
  fields: [
    FormTextField(name: 'full_name'),
    FormTextField(name: 'display_name'),
    FormTextField(name: 'phone_number'),
  ]
)

class EditProfileView extends StatelessWidget with $EditProfileView {
  // const EditProfileView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size _size = MediaQuery.of(context).size;
    return ViewModelBuilder<EditProfileViewModel>.reactive(
      viewModelBuilder: () => EditProfileViewModel(),
      builder: (context, model, child) => Scaffold(
        appBar: AppBar(
          elevation: 0,
          leading: IconButton(
              onPressed: model.exitPage, icon: Icon(Icons.close_rounded)),
          title: Text("Edit Profile"),
          actions: [
            TextButton(
              onPressed: () async {
                await model.updateDetails();
              },
              child: Text(
                "Save",
                style: TextStyle(color: AppColors.zuriTextBodyColor),
              ),
            )
          ],
        ),
        body: Visibility(
          visible: !model.isBusy,
          child: Body(size: _size),
          replacement: Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Getting Your data...'),
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
  Body({
    Key? key,
    required Size size,
  })  : _size = size,
        super(key: key, reactive: true);
  @override
  Widget build(BuildContext context, EditProfileViewModel model) {
    return Container(
      padding: EdgeInsets.symmetric(
          vertical: _size.height * 0.02, horizontal: _size.width * 0.05),
      child: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: _size.height * 0.14,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Container(
                    width: _size.height * 0.14,
                    height: double.maxFinite,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage("assets/background/appBarLogo.png"),
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
                          )),
                    ),
                  ),
                  Spacer(),
                  Container(
                    width: _size.width * 0.55,
                    child: TextFormField(
                      initialValue: model.userModel?.firstName,
                      controller: full_nameController,
                      decoration: InputDecoration(
                        labelText: "Full Name",
                      ),
                    ),
                  )
                ],
              ),
            ),
            TextFormField(
              initialValue: model.userModel?.lastName,
              controller: display_nameController,
              decoration: InputDecoration(
                labelText: "Display Name",
                helperText:
                    "This is how your name will show up in Zuri Chat. It’s best kept simple: whatever people call you in everyday conversation.",
                helperMaxLines: 3,
              ),
            ),
            TextFormField(
              decoration: InputDecoration(
                  labelText: "What I do", helperText: "HNGi9 X I4G"),
            ),
            TextFormField(
              initialValue: model.userModel?.phoneNumber,
              controller: phone_numberController,
              decoration: InputDecoration(
                  labelText: "Phone", helperText: "Enter your phone number"),
            ),
          ],
        ),
      ),
      )
      ),
      viewModelBuilder: () => EditProfileViewModel(),
    );
  }
}
