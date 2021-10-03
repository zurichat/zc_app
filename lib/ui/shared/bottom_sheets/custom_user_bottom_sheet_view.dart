import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hng/general_widgets/custom_text.dart';
import 'package:hng/ui/shared/bottom_sheets/widgets/custom_button.dart';
import 'package:hng/ui/shared/bottom_sheets/widgets/custom_profile_tile.dart';
import 'package:hng/ui/shared/bottom_sheets/widgets/profile_head.dart';
import 'package:hng/ui/shared/colors.dart';
import 'package:stacked_services/stacked_services.dart';

import 'package:stacked/stacked.dart';

import 'custom_user_bottomsheet/custom_user_bottom_sheet_viewmodel.dart';

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
    ScreenUtil.init(
      BoxConstraints(
        maxWidth: MediaQuery.of(context).size.width,
        maxHeight: MediaQuery.of(context).size.height,
      ),
      designSize: Size(411, 823)
    );
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
                return Container(
                  // height: height * .97,
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
                            children: [
                              SizedBox(
                                width: 24.5.w,
                              ),
                              SizedBox(
                                  width: 123.w,
                                  height: 40.0.h,
                                  child: CustomButton(
                                      text: 'Message', onPressed: () {})),
                              SizedBox(
                                width: 20.w,
                              ),
                              SizedBox(
                                width: 123.w,
                                height: 40.0.h,
                                child: CustomButton(
                                  text: 'Edit Profile',
                                  onPressed: () =>
                                      model.navigateToEditProfile(),
                                ),
                              ),
                              SizedBox(
                                width: 20.w,
                              ),
                              SizedBox(
                                width: 75.0.w,
                                height: 40.0.h,
                                child: CustomButton.icon(
                                    icon: Icons.more_horiz_rounded,
                                    onPressed: () {}),
                              ),
                            ],
                          ),
                        ),
                        Divider(),
                        CustomProfileTile(
                            title: 'What I do', subtitle: 'Mobile Dev'),
                        Divider(),
                        CustomProfileTile(
                            title: 'Display Name', subtitle: '${model.userModel?.lastName}'),
                        Divider(),
                        ListTile(
                          title: CustomText(
                              text: 'Status', fontWeight: FontWeight.w300),
                          subtitle: Align(
                              alignment: Alignment.centerLeft,
                              child: Icon(Icons.looks_5, color: Colors.blue)),
                          shape: Border(
                            top: BorderSide(
                                width: .5, color: AppColors.greyishColor),
                          ),
                          onTap: () => model.navigateToSetStatus(),
                          trailing: IconButton(
                              onPressed: () {}, icon: Icon(Icons.cancel)),
                        ),
                        Divider(),
                        CustomProfileTile(
                            title: 'Mobile Number',
                            subtitle: '${model.userModel?.phoneNumber}'),
                        Divider(),
                        CustomProfileTile(
                            title: 'Email Address',
                            subtitle: '${model.userModel!.email.toString()}'),
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
