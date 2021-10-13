import 'package:flutter/material.dart';
import 'package:zurichat/constants/app_strings.dart';
import 'package:zurichat/general_widgets/custom_text.dart';
import 'package:zurichat/ui/shared/colors.dart';
import 'package:stacked/stacked.dart';

import '../custom_user_bottom_sheet_viewmodel.dart';

class ProfileHead extends ViewModelWidget<CustomUserBottomSheetViewModel> {
  const ProfileHead({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, CustomUserBottomSheetViewModel viewModel) {
    final height = MediaQuery.of(context).size.height;
    return Stack(
      alignment: AlignmentDirectional.center,
      children: [
        Image.asset(ZuriAppbarLogo),
        Align(
          alignment: Alignment.bottomCenter,
          child: Container(
              height: height * 0.15,
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.bottomCenter,
                  end: Alignment.topCenter,
                  colors: [
                    Colors.black54,
                    Colors.transparent,
                  ],
                ),
              ),
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
              child: Align(
                alignment: Alignment.bottomLeft,
                child: Row(
                  children: [
                    Flexible(
                      fit: FlexFit.loose,
                      child: CustomText(
                        text: viewModel.userModel!.fullName!,
                        color: AppColors.whiteColor,
                        fontWeight: FontWeight.bold,
                        fontSize: height * 0.025,
                        maxLines: 3,
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.all(5),
                      child: Icon(
                        Icons.circle,
                        size: 10,
                        color: AppColors.zuriPrimaryColor,
                      ),
                    ),
                  ],
                ),
              )),
        ),
      ],
    );
  }
}
