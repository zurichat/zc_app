import 'package:flutter/material.dart';
import 'package:hng/app/app.locator.dart';
import 'package:hng/services/local_storage_services.dart';
import 'package:hng/ui/shared/shared.dart';
import 'package:hng/utilities/storage_keys.dart';
import 'package:stacked/stacked.dart';

import 'edit_profile_viewmodel.dart';

class EditProfileView extends StatelessWidget {
  const EditProfileView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final storageService = locator<SharedPreferenceLocalStorage>();

    Size _size = MediaQuery.of(context).size;
    return ViewModelBuilder<EditProfileViewModel>.reactive(
      onModelReady: (model) => model.fetchUser(),
      builder: (context, model, child) => Scaffold(
        appBar: AppBar(
          elevation: 0,
          leading: IconButton(
              onPressed: model.exitPage, icon: Icon(Icons.close_rounded)),
          title: Text("Edit Profile"),
          actions: [
            TextButton(
              onPressed: () {
                model.updateProfile();
                model.test();
              },
              child: Text(
                "Save",
                style: TextStyle(color: AppColors.zuriTextBodyColor),
              ),
            )
          ],
        ),
        body: Body(size: _size),
      ),
      viewModelBuilder: () => EditProfileViewModel(),
    );
  }
}
//C:\Users\USER\AppData\Local\Android
// class Body extends StatelessWidget {
//   const Body({
//     Key? key,
//     required Size size,
//   }) : _size = size, super(key: key);

//   final Size _size;

//   @override
//   Widget build(BuildContext context) {
//     return
//   }
// }
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
                      controller: model.fullNameEd,
                      decoration: InputDecoration(
                        labelText: "Full Name",
                      ),
                    ),
                  )
                ],
              ),
            ),
            TextFormField(
              controller: model.displayNameEd,
              decoration: InputDecoration(
                labelText: "Display Name",
                helperText:
                    "This is how your name will show up in Zuri Chat. It’s best kept simple: whatever people call you in everyday conversation.",
                helperMaxLines: 3,
              ),
            ),
            TextFormField(
              controller: model.statusEd,
              decoration: InputDecoration(
                  labelText: "What I do", helperText: "HNGi9 X I4G"),
            ),
            TextFormField(
              controller: model.phoneNumEd,
              decoration: InputDecoration(
                  labelText: "Phone", helperText: "Enter your phone number"),
            ),
          ],
        ),
      ),
    );
  }
}

class NextButton extends ViewModelWidget<EditProfileViewModel> {
  NextButton({Key? key}) : super(key: key, reactive: true);

  @override
  Widget build(BuildContext context, EditProfileViewModel model) {
    return Container();
  }
}
