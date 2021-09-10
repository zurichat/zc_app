import 'package:flutter/material.dart';
import 'package:hng/ui/shared/shared.dart';
import 'package:stacked/stacked.dart';

import 'edit_profile_viewmodel.dart';

class EditProfileView extends StatelessWidget {
  const EditProfileView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size _size = MediaQuery.of(context).size;
    return ViewModelBuilder<EditProfileViewModel>.reactive(
      builder: (context, model, child) => Scaffold(
        appBar: AppBar(
          elevation: 0,
          leading: IconButton(
              onPressed: model.exitPage, icon: Icon(Icons.close_rounded)),
          title: Text("Edit Profile"),
          actions: [
            TextButton(
              onPressed: () {},
              child: Text(
                "Save",
                style: TextStyle(color: AppColors.zuriTextBodyColor),
              ),
            )
          ],
        ),
        body: Container(
          padding: EdgeInsets.symmetric(
              vertical: _size.height * 0.02, horizontal: _size.width * 0.05),
          child: Column(
            children: [
              Container(
                height: _size.height * 0.14,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Container(
                      width: _size.width * 0.3,
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
                            onPressed: () {}, icon: Icon(Icons.add_a_photo)),
                      ),
                    ),
                    Spacer(),
                    Container(
                      width: _size.width * 0.55,
                      child: TextField(
                        decoration: InputDecoration(
                          labelText: "Full Name",
                        ),
                      ),
                    )
                  ],
                ),
              ),
              TextField(
                decoration: InputDecoration(
                  labelText: "Display Name",
                  helperText:
                      "This is how your name will show up in Zuri Chat. It’s best kept simple: whatever people call you in everyday conversation.",
                  helperMaxLines: 3,
                ),
              ),
              TextField(
                decoration: InputDecoration(
                    labelText: "What I do", helperText: "HNGi9 X I4G"),
              ),
              TextField(
                decoration: InputDecoration(
                    labelText: "Phone", helperText: "Enter your phone number"),
              ),
            ],
          ),
        ),
      ),
      viewModelBuilder: () => EditProfileViewModel(),
    );
  }
}
