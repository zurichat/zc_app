import 'package:flutter/material.dart';
import 'package:zurichat/constants/app_strings.dart';

import 'package:zurichat/ui/shared/colors.dart';
import 'package:zurichat/ui/shared/text_styles.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import 'custom_user_bottom_sheet_viewmodel.dart';
import 'widgets/custom_button.dart';
import 'widgets/custom_profile_tile.dart';
import 'widgets/profile_head.dart';

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
    final height = MediaQuery.of(context).size.height;
    final bool _dark = Theme.of(context).brightness == Brightness.dark;
    return ViewModelBuilder<CustomUserBottomSheetViewModel>.reactive(
      builder: (context, model, child) => model.isBusy
          ? Container()
          : DraggableScrollableSheet(
              maxChildSize: 0.97,
              initialChildSize: 0.7,
              minChildSize: 0.5,
              builder:
                  (BuildContext context, ScrollController scrollController) {
                return Container(
                  height: height * .97,
                  color: _dark
                      ? AppColors.darkThemePrimaryColor
                      : AppColors.whiteColor,
                  child: SingleChildScrollView(
                    controller: scrollController,
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        SizedBox(
                          height: height * .3,
                          child: const ProfileHead(),
                        ),
                        SizedBox(
                          height: height * .1,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              CustomButton(text: Msg, onPressed: () {}),
                              CustomButton(
                                text: EditProfile,
                                onPressed: () => model.navigateToEditProfile(),
                              ),
                              CustomButton.icon(
                                  icon: Icons.more_horiz_rounded,
                                  onPressed: () {}),
                            ],
                          ),
                        ),
                        const Divider(),
                        const CustomProfileTile(
                            title: Track, subtitle: MobileDev),
                        const Divider(),
                        CustomProfileTile(
                          title: DisplayName,
                          subtitle: model.userModel!.displayName ?? '',
                        ),
                        const Divider(),
                        ListTile(
                          visualDensity:
                              const VisualDensity(horizontal: 0.0, vertical: 0),
                          horizontalTitleGap: 0,
                          dense: true,
                          title: Padding(
                            padding: const EdgeInsets.only(bottom: 3),
                            child: Text(
                              StatusText,
                              style: _dark
                                  ? AppTextStyle.whiteSize16
                                  : AppTextStyle.darkGreySize16,
                            ),
                          ),
                          subtitle: const Align(
                              alignment: Alignment.centerLeft,
                              child: Icon(Icons.looks_5,
                                  color: AppColors.blueTextColor)),
                          shape: const Border(
                            top: BorderSide(
                                width: .5, color: AppColors.greyishColor),
                          ),
                          onTap: () => model.navigateToSetStatus(),
                          trailing: IconButton(
                            onPressed: () {},
                            icon: const Icon(Icons.cancel),
                          ),
                        ),
                        const Divider(),
                        CustomProfileTile(
                          title: Number,
                          subtitle: model.userModel!.phoneNumber ?? '',
                        ),
                        const Divider(),
                        CustomProfileTile(
                          title: EmailAddress,
                          subtitle: model.userModel!.email!,
                        ),
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
