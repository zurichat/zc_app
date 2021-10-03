// import 'package:flutter/material.dart';
// import 'package:hng/general_widgets/custom_text.dart';
// import 'package:hng/ui/shared/bottom_sheets/custom_user_bottomsheet/custom_user_bottom_sheet_viewmodel.dart';
// import 'package:hng/ui/shared/colors.dart';
// import 'package:stacked/stacked.dart';

// class ProfileHead extends StatelessWidget {
//   const ProfileHead({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     double height = MediaQuery.of(context).size.height;
//     return ViewModelBuilder<CustomUserBottomSheetViewModel>.reactive(
//         viewModelBuilder: () => CustomUserBottomSheetViewModel(),
//         builder: (context, model, child) => Stack(
//               alignment: AlignmentDirectional.center,
//               children: [
//                 Image.asset("assets/background/appBarLogo.png"),
//                 Align(
//                   alignment: Alignment.bottomCenter,
//                   child: Container(
//                       height: height * 0.15,
//                       // ignore: prefer_const_constructors
//                       decoration: BoxDecoration(
//                         // ignore: prefer_const_constructors
//                         gradient: LinearGradient(
//                           begin: Alignment.bottomCenter,
//                           end: Alignment.topCenter,
//                           // ignore: prefer_const_literals_to_create_immutables
//                           colors: [
//                             Colors.black54,
//                             Colors.transparent,
//                           ],
//                         ),
//                       ),
//                       padding:
//                           // ignore: prefer_const_constructors
//                           EdgeInsets.symmetric(horizontal: 15, vertical: 20),
//                       child: Align(
//                         alignment: Alignment.bottomLeft,
//                         child: Row(
//                           children: [
//                             Flexible(
//                               fit: FlexFit.loose,
//                               child: CustomText(
//                                 text: "${model.userModel?.firstName}",
//                                 color: AppColors.whiteColor,
//                                 fontWeight: FontWeight.bold,
//                                 fontSize: height * 0.025,
//                                 maxLines: 3,
//                               ),
//                             ),
//                             // ignore: prefer_const_constructors
//                             Padding(
//                               padding: const EdgeInsets.all(5),
//                               // ignore: prefer_const_constructors
//                               child: Icon(
//                                 Icons.circle,
//                                 size: 10,
//                                 color: AppColors.zuriPrimaryColor,
//                               ),
//                             ),
//                           ],
//                         ),
//                       )),
//                 ),
//               ],
//             ));
//   }
// }
