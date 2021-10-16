import 'package:flutter/material.dart';
import 'package:zurichat/ui/shared/text_styles.dart';
import 'package:stacked/stacked.dart';

import '../../../colors.dart';
import '../custom_user_bottom_sheet_viewmodel.dart';

class ProfileHead extends StatelessWidget {
  const ProfileHead({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;

    return ViewModelBuilder<CustomUserBottomSheetViewModel>.reactive(
      builder: (context, model, child) {
        return Stack(
          alignment: AlignmentDirectional.center,
          children: [
            Image.asset('assets/background/appBarLogo.png'),
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
                  padding:
                      const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
                  child: Align(
                    alignment: Alignment.bottomLeft,
                    child: Row(
                      children: [
                        Flexible(
                          fit: FlexFit.loose,
                          child: Text(
                            '${model.userModel!.firstName} ${model.userModel!.lastName}',
                            style: AppTextStyle.whiteSize16,
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
      },
      viewModelBuilder: () => CustomUserBottomSheetViewModel(),
    );
  }
}
