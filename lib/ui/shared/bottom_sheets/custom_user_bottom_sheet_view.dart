import 'package:flutter/material.dart';
import 'package:hng/general_widgets/custom_text.dart';
import 'package:hng/ui/shared/bottom_sheets/profile_botton_sheet/widgets/profile_head.dart';
import 'package:hng/ui/shared/colors.dart';
import 'package:stacked_services/stacked_services.dart';

import 'package:stacked/stacked.dart';

import 'custom_user_bottom_sheet_viewmodel.dart';
import 'profile_botton_sheet/widgets/custom_button.dart';
import 'profile_botton_sheet/widgets/custom_profile_tile.dart';

class CustomUserBottomSheetView extends StatelessWidget {
  final SheetRequest request;
  final Function(SheetResponse) completer;

  const CustomUserBottomSheetView({
    Key? key,
    required this.request,
    required this.completer,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return ViewModelBuilder<CustomUserBottomSheetViewModel>.reactive(
      builder: (context, model, child) => DraggableScrollableSheet(
        maxChildSize: .97,
        initialChildSize: 0.8,
        minChildSize: 0.8,
        builder: (BuildContext context, ScrollController scrollController) {
          return Container(
            height: height * .97,
            color: Colors.white,
            child: SingleChildScrollView(
              controller: scrollController,
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Container(
                    height: height * .3,
                    child: ProfileHead(),
                  ),
                  Container(
                    height: height * .1,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        CustomButton(text: "Message", onPressed: () {}),
                        CustomButton(
                            text: "Edit Profile", onPressed: model.editProfile),
                        CustomButton.icon(
                            icon: Icons.more_horiz_rounded, onPressed: () {}),
                      ],
                    ),
                  ),
                  Divider(),
                  CustomProfileTile(title: "What I do", subtitle: "Mobile Dev"),
                  Divider(),
                  CustomProfileTile(
                      title: "Display Name", subtitle: "pauleke65"),
                  Divider(),
                  ListTile(
                    title:
                        CustomText(text: "Status", fontWeight: FontWeight.w300),
                    subtitle: Align(
                        alignment: Alignment.centerLeft,
                        child: Icon(Icons.looks_5, color: Colors.blue)),
                    shape: Border(
                      top: BorderSide(width: .5, color: AppColors.greyishColor),
                    ),
                    onTap: model.setStatus,
                    trailing:
                        IconButton(onPressed: () {}, icon: Icon(Icons.cancel)),
                  ),
                  Divider(),
                  CustomProfileTile(
                      title: "Mobile Number", subtitle: "+2347023456789"),
                  Divider(),
                  CustomProfileTile(
                      title: "Email Address", subtitle: "myemail@mail.com"),
                ],
              ),
            ),
          );
        },
      ),
      viewModelBuilder: () => CustomUserBottomSheetViewModel(),
    );
  }
}
