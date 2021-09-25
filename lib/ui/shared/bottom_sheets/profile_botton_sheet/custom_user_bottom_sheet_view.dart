import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import '../../../../general_widgets/custom_text.dart';
import '../../../../models/user_model.dart';
import '../../colors.dart';
import 'custom_user_bottom_sheet_viewmodel.dart';
import 'widgets/custom_button.dart';
import 'widgets/custom_profile_tile.dart';
import 'widgets/profile_head.dart';

class CustomUserBottomSheetView extends StatelessWidget {
  final SheetRequest? request;
  final Function(SheetResponse?)? completer;

  const CustomUserBottomSheetView({
    Key? key,
    this.request,
    this.completer,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return ViewModelBuilder<CustomUserBottomSheetViewModel>.reactive(
      builder: (context, model, child) => model.isBusy
          ? Center(child: CircularProgressIndicator())
          : DraggableScrollableSheet(
              maxChildSize: 0.97,
              initialChildSize: 0.7,
              minChildSize: 0.5,
              builder:
                  (BuildContext context, ScrollController scrollController) {
                UserModel? user = model.userModel;
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
                          child: ProfileHead(
                            name:
                                '${model.userModel!.firstName} ${model.userModel!.lastName}',
                          ),
                        ),
                        Container(
                          height: height * .1,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              CustomButton(
                                  text: 'Message',
                                  onPressed: () => model.navigateToDm()),
                              CustomButton(
                                text: 'Edit Profile',
                                onPressed: () => model.navigateToEditProfile(),
                              ),
                              MaterialButton(
                                onPressed: () {},
                                shape:
                                    Border.all(color: AppColors.greyishColor),
                                child: PopupMenuButton(
                                  padding: EdgeInsets.zero,
                                  itemBuilder: (BuildContext context) => [
                                    PopupMenuItem(
                                        child: Text('View files',
                                            style: TextStyle(
                                                color: AppColors.greyishColor)))
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        Divider(),
                        CustomProfileTile(
                            title: 'What I do', subtitle: 'Mobile Dev'),
                        Divider(),
                        CustomProfileTile(
                            title: 'Display Name',
                            subtitle: user?.displayName ?? ''),
                        Divider(),
                        ListTile(
                          title: CustomText(
                              text: 'Status', fontWeight: FontWeight.w300),
                          subtitle: Visibility(
                            visible: !model.cleared,
                            child: Align(
                                alignment: Alignment.centerLeft,
                                child: Icon(Icons.looks_5, color: Colors.blue)),
                          ),
                          shape: Border(
                            top: BorderSide(
                                width: .5, color: AppColors.greyishColor),
                          ),
                          onTap: () => model.navigateToSetStatus(),
                          trailing: IconButton(
                              onPressed: () => model.clear(),
                              icon: Icon(Icons.cancel)),
                        ),
                        Divider(),
                        CustomProfileTile(
                            title: 'Mobile Number',
                            subtitle: user?.phoneNumber ?? ''),
                        Divider(),
                        CustomProfileTile(
                            title: 'Email Address', subtitle: '${user?.email}'),
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
