// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:hng/general_widgets/custom_text.dart';
// import 'package:hng/ui/shared/bottom_sheets/custom_user_bottomsheet/widgets/custom_profile_tile.dart';
// import 'package:hng/ui/shared/bottom_sheets/widgets/custom_button.dart';
// import 'package:hng/ui/shared/bottom_sheets/widgets/profile_head.dart';
// import 'package:hng/ui/shared/colors.dart';
// import 'package:stacked_services/stacked_services.dart';

// import 'package:stacked/stacked.dart';

// import 'custom_user_bottomsheet/custom_user_bottom_sheet_viewmodel.dart';

// class CustomUserBottomSheetView extends StatelessWidget {
//   final SheetRequest request;
//   final Function(SheetResponse) completer;

//   const CustomUserBottomSheetView({
//     Key? key,
//     required this.request,
//     required this.completer,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     ScreenUtil.init(
//       BoxConstraints(
//         maxWidth: MediaQuery.of(context).size.width,
//         maxHeight: MediaQuery.of(context).size.height,
//       ),
//       designSize: const Size(411, 823)
//     );
//     double height = MediaQuery.of(context).size.height;
//     return ViewModelBuilder<CustomUserBottomSheetViewModel>.reactive(
//       builder: (context, model, child) => model.isBusy
//           // ignore: prefer_const_constructors
//           ? Center(child: CircularProgressIndicator())
//           : DraggableScrollableSheet(
//               maxChildSize: 0.97,
//               initialChildSize: 0.7,
//               minChildSize: 0.5,
//               builder:
//                   (BuildContext context, ScrollController scrollController) {
//                 return Container(
//                   // height: height * .97,
//                   color: Colors.white,
//                   child: SingleChildScrollView(
//                     controller: scrollController,
//                     child: Column(
//                       mainAxisSize: MainAxisSize.max,
//                       children: [
//                         // ignore: sized_box_for_whitespace
//                         Container(
//                           height: height * .3,
//                           // ignore: prefer_const_constructors
//                           child: ProfileHead(),
//                         ),
//                         // ignore: sized_box_for_whitespace
//                         Container(
//                           height: height * .1,
//                           child: Row(
//                             children: [
//                               SizedBox(
//                                 width: 24.5.w,
//                               ),
//                               SizedBox(
//                                   width: 123.w,
//                                   height: 40.0.h,
//                                   child: CustomButton(
//                                       text: 'Message', onPressed: () {})),
//                               SizedBox(
//                                 width: 20.w,
//                               ),
//                               SizedBox(
//                                 width: 123.w,
//                                 height: 40.0.h,
//                                 child: CustomButton(
//                                   text: 'Edit Profile',
//                                   onPressed: () =>
//                                       model.navigateToEditProfile(),
//                                 ),
//                               ),
//                               SizedBox(
//                                 width: 20.w,
//                               ),
//                               SizedBox(
//                                 width: 75.0.w,
//                                 height: 40.0.h,
//                                 child: CustomButton.icon(
//                                     icon: Icons.more_horiz_rounded,
//                                     onPressed: () {}),
//                               ),
//                             ],
//                           ),
//                         ),
//                         // ignore: prefer_const_constructors
//                         Divider(),
//                         // ignore: prefer_const_constructors
//                         CustomProfileTile(
//                             title: 'What I do', subtitle: 'Mobile Dev'),
//                         // ignore: prefer_const_constructors
//                         Divider(),
//                         CustomProfileTile(
//                             title: 'Display Name', subtitle: '${model.userModel?.lastName}'),
//                         // ignore: prefer_const_constructors
//                         Divider(),
//                         ListTile(
//                           // ignore: prefer_const_constructors
//                           title: CustomText(
//                               text: 'Status', fontWeight: FontWeight.w300),
//                           // ignore: prefer_const_constructors
//                           subtitle: Align(
//                               alignment: Alignment.centerLeft,
//                               // ignore: prefer_const_constructors
//                               child: Icon(Icons.looks_5, color: Colors.blue)),
//                           // ignore: prefer_const_constructors
//                           shape: Border(
//                             // ignore: prefer_const_constructors
//                             top: BorderSide(
//                                 width: .5, color: AppColors.greyishColor),
//                           ),
//                           onTap: () => model.navigateToSetStatus(),
//                           trailing: IconButton(
//                               // ignore: prefer_const_constructors
//                               onPressed: () {}, icon: Icon(Icons.cancel)),
//                         ),
//                         // ignore: prefer_const_constructors
//                         Divider(),
//                         CustomProfileTile(
//                             title: 'Mobile Number',
//                             subtitle: '${model.userModel?.phoneNumber}'),
//                         // ignore: prefer_const_constructors
//                         Divider(),
//                         CustomProfileTile(
//                             title: 'Email Address',
//                             subtitle: '${model.userModel!.email.toString()}'),
//                       ],
//                     ),
//                   ),
//                 );
//               },
//             ),
//       viewModelBuilder: () => CustomUserBottomSheetViewModel(),
//     );
//   }
// }
