import 'package:flutter/material.dart';
import 'package:hng/models/user_model.dart';
import 'package:hng/ui/shared/bottom_sheets/profile_botton_sheet/custom_user_bottom_sheet_viewmodel.dart';
import 'package:hng/ui/shared/shared.dart';
import '../../../../general_widgets/custom_text.dart';
import '../../../shared/colors.dart';
import 'package:stacked/stacked.dart';

class ProfilePageHead extends StatelessWidget {
  const ProfilePageHead({Key? key, this.image, this.name, this.currentStatus})
      : super(key: key);

  final String? image;
  final String? name;
  final String? currentStatus;

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<CustomUserBottomSheetViewModel>.reactive(
      builder: (context, model, child) {
        UserModel? user = model.userModel; 
        return Row(
          mainAxisAlignment: MainAxisAlignment.start,
          mainAxisSize: MainAxisSize.max,
          children: [
            Container(
              width: 75,
              height: 75,
              child: Stack(
                children: [
                  Align(
                    alignment: Alignment.bottomLeft,
                    child: Container(
                      height: 70,
                      width: 70,
                      decoration: BoxDecoration(
                        color: AppColors.shadowColor,
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: Center(
                        child: Image(
                          image: AssetImage(image ?? dummyUserImage),
                        ),
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.topRight,
                    child: Icon(
                      Icons.circle,
                      size: 15,
                      color: AppColors.zuriPrimaryColor,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(width: 10),
            Flexible(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomText(
                    text: user?.displayName ?? '',
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                    lineHeight: 1.5,
                  ),
                  CustomText(
                    text: "$currentStatus",
                    color: AppColors.greyishColor,
                    fontSize: 15,
                    lineHeight: 1.5,
                  ),
                ],
              ),
            ),
          ],
        );
      },
      
    viewModelBuilder: () => CustomUserBottomSheetViewModel(),
  );
    
  }
}
