import 'package:flutter/material.dart';
import 'package:hng/general_widgets/custom_text.dart';
import 'package:hng/ui/shared/colors.dart';

class ProfileHead extends StatelessWidget {
  const ProfileHead({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return Stack(
      alignment: AlignmentDirectional.center,
      children: [
        Image.asset("assets/background/appBarLogo.png"),
        Align(
          alignment: Alignment.bottomCenter,
          child: Container(
              height: height * 0.15,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.bottomCenter,
                  end: Alignment.topCenter,
                  colors: [
                    Colors.black54,
                    Colors.transparent,
                  ],
                ),
              ),
              padding: EdgeInsets.symmetric(horizontal: 15, vertical: 20),
              child: Align(
                alignment: Alignment.bottomLeft,
                child: Row(
                  children: [
                    Flexible(
                      fit: FlexFit.loose,
                      child: CustomText(
                        text: "Paul Imoke Eke",
                        color: AppColors.whiteColor,
                        fontWeight: FontWeight.bold,
                        fontSize: height * 0.025,
                        maxLines: 3,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(5),
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