import 'package:flutter/material.dart';
import 'package:hng/app/app.locator.dart';
import 'package:hng/constants/app_strings.dart';
import 'package:hng/general_widgets/custom_text.dart';
import 'package:hng/services/local_storage_services.dart';
import 'package:hng/ui/shared/bottom_sheets/custom_user_bottomsheet/custom_user_bottom_sheet_viewmodel.dart';
import 'package:hng/ui/shared/colors.dart';
import 'package:stacked/stacked.dart';

// ignore: use_key_in_widget_constructors
class ProfileHead extends StatelessWidget {
  final storageService = locator<SharedPreferenceLocalStorage>();

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return ViewModelBuilder<CustomUserBottomSheetViewModel>.reactive(
      onModelReady: (model) => model.futureToRun(),
        viewModelBuilder: () => CustomUserBottomSheetViewModel(),
        builder: (context, model, child) => Stack(
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
                      padding: const EdgeInsets.symmetric(
                          horizontal: 15, vertical: 20),
                      child: Align(
                        alignment: Alignment.bottomLeft,
                        child: Row(
                          children: [
                            Flexible(
                              fit: FlexFit.loose,
                              child: CustomText(
                                text: model.currentUserData.firstName.toString(),
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
            ));
  }
}
