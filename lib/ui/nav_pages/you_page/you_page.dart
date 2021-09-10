import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:stacked/stacked.dart';

import 'package:hng/general_widgets/custom_text.dart';
import 'package:hng/ui/nav_pages/you_page/you_page_viewmodel.dart';
import 'package:hng/ui/shared/shared.dart';
import '../../../general_widgets/custom_text.dart';
import '../../shared/colors.dart';
import '../../shared/shared.dart';
import 'you_page_viewmodel.dart';

class YouPage extends StatelessWidget {
  const YouPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // return ViewModelBuilder<YouPageViewModel>.reactive(
    //     viewModelBuilder: () => YouPageViewModel(),
    //     disposeViewModel: true,
    //     builder: (context, viewModel, child) {
    //       return Scaffold(
    //         appBar: AppBar(
    //           title: CustomText(text: "You", fontWeight: FontWeight.bold),
    //           backgroundColor: AppColors.whiteColor,
    //           elevation: 0,
    //         ),
    //         body: Container(
    //           child: Padding(
    //             padding: const EdgeInsets.all(8.0),
    //             child: Column(
    //               children: [
    //                 Row(
    //                   children: [
    //                     Container(
    //                         width: 100,
    //                         height: 100,
    //                         child: CircleAvatar(
    //                           radius: 10,
    //                           backgroundColor: AppColors.whiteColor,
    //                           child: Image.asset(
    //                             viewModel.profileImage,
    //                             fit: BoxFit.fill,
    //                           ),
    //                         )),
    //                     SizedBox(width: 10),
    //                     Padding(
    //                       padding: const EdgeInsets.all(8.0),
    //                       child: Column(
    //                         mainAxisAlignment: MainAxisAlignment.start,
    //                         children: [
    //                           CustomText(
    //                               text: viewModel.username,
    //                               fontWeight: FontWeight.bold,
    //                               fontSize: 18),
    //                           CustomText(
    //                             text: "Active",
    //                             color: AppColors.greyishColor,
    //                             fontSize: 15,
    //                           ),
    //                         ],
    //                       ),
    return ViewModelBuilder<YouPageViewModel>.reactive(
        viewModelBuilder: () => YouPageViewModel(),
        disposeViewModel: true,
        builder: (context, model, child) => Scaffold(
              appBar: AppBar(
                automaticallyImplyLeading: false,
                backgroundColor: AppColors.zuriPrimaryColor,
                // Here we take the value from the
                // MyHomePage object that was created by
                // the App.build method, and use it to set our appbar title.
                title: Text(
                  "You",
                  style: GoogleFonts.lato(
                      fontWeight: FontWeight.w700,
                      fontSize: 20,
                      color: AppColors.whiteColor),
                ),
              ),
              body: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Row(
                            children: [
                              Container(
                                  width: 50,
                                  height: 50,
                                  child: Image(
                                    image:
                                        AssetImage('assets/images/naisu.png'),
                                    fit: BoxFit.cover,
                                  )),
                              SizedBox(width: 10),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    CustomText(
                                        text: 'Oscar',
                                        fontWeight: FontWeight.bold,
                                        fontSize: 18),
                                    CustomText(
                                      text: "Active",
                                      color: AppColors.greyishColor,
                                      fontSize: 15,
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      SizedBox(height: 20),
                      Container(
                        decoration: BoxDecoration(
                          border: Border.all(
                              width: 0.5, color: AppColors.greyishColor),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: TextField(
                          decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: 'What\'s your status?',
                              prefixIcon:
                                  Icon(Icons.chat_bubble_outline_rounded),
                              suffixIcon: Icon(Icons.close)),
                        ),
                      ),
                      SizedBox(height: 32),
                      Row(
                        children: [
                          Icon(Icons.notifications_off_outlined,
                              size: 20, color: AppColors.greyishColor),
                          SizedBox(width: 10),
                          CustomText(
                              text: "Pause Notifications",
                              color: Colors.black87),
                        ],
                      ),
                      SizedBox(height: 16),
                      Row(
                        children: [
                          Icon(Icons.circle_outlined,
                              size: 20, color: AppColors.greyishColor),
                          SizedBox(width: 10),
                          CustomText(text: "Set yourself as "),
                          Text(
                            "away",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          )
                        ],
                      ),
                      SizedBox(height: 16),
                      Divider(
                        color: AppColors.greyishColor,
                        thickness: 0.5,
                        height: 1,
                      ),
                      SizedBox(height: 16),
                      Row(
                        children: [
                          Icon(Icons.bookmark_outline,
                              color: AppColors.greyishColor),
                          SizedBox(width: 10),
                          Text("Saved Items"),
                        ],
                      ),
                      SizedBox(height: 16),
                      Row(
                        children: [
                          Icon(Icons.person_outline,
                              color: AppColors.greyishColor),
                          SizedBox(width: 10),
                          Text("View Profile"),
                        ],
                      ),
                      SizedBox(height: 16),
                      Row(
                        children: [
                          Icon(Icons.circle_notifications_outlined,
                              color: AppColors.greyishColor),
                          SizedBox(width: 10),
                          Text("Notifications"),
                        ],
                      ),
                      SizedBox(height: 16),
                      Row(
                        children: [
                          Icon(Icons.settings_outlined,
                              color: AppColors.greyishColor),
                          SizedBox(width: 10),
                          Text("Preferences"),
                        ],
                      ),
                    ]),
              ),
            ));
    // });
    //                 ],
    //               ),
    //               SizedBox(height: 20),
    //               // Container(
    //               //   decoration: BoxDecoration(
    //               //     border:
    //               //         Border.all(width: 0.5, color: AppColors.greyishColor),
    //               //     borderRadius: BorderRadius.circular(10),
    //               //   ),
    //               //   child: TextField(
    //               //     decoration: InputDecoration(
    //               //         border: InputBorder.none,
    //               //         prefixIcon: Icon(Icons.chat_bubble_outline_rounded),
    //               //         suffixIcon: Icon(Icons.close)),
    //               //   ),
    //               // ),
    //             ],
    //           ),
    //           SizedBox(
    //             height: 15,
    //           ),
    //           OutlinedButton.icon(
    //             icon: Icon(Icons.messenger_outline_sharp, size: 18),
    //             onPressed: () {},
    //             style: ButtonStyle(
    //               fixedSize: MaterialStateProperty.all(Size(500, 20)),

    //               // padding: MaterialStateProperty.all(EdgeInsets.only(right: 250)),

    //               // elevation: MaterialStateProperty.all(3) ,
    //               // backgroundColor: MaterialStateProperty.all(Colors.white),
    //             ),
    //             label: Row(
    //               mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    //               children: [
    //                 // Icon(Icons.messenger_outline_sharp),
    //                 SizedBox(
    //                   width: 50,
    //                 ),
    //                 Text("What\'s your status? ",
    //                     style: TextStyle(color: Colors.grey[700])),
    //                 SizedBox(
    //                   width: 110,
    //                 ),
    //               ],
    //             ),
    //           ),
    //           ProfileButton(
    //             icon: Icons.notifications_off_outlined,
    //             label: "Pause Notifications",
    //             onPressed: () {},
    //           ),
    //           ProfileButton(
    //             icon: Icons.circle,
    //             label: "Set yourself as ",
    //             onPressed: () {},
    //           ),
    //           Divider(
    //             color: Colors.grey,
    //           ),
    //           ProfileButton(
    //             icon: Icons.bookmark_outline_outlined,
    //             label: "Saved Item",
    //             onPressed: () {},
    //           ),
    //           ProfileButton(
    //             icon: Icons.account_circle_outlined,
    //             label: "View Profile",
    //             onPressed: () {},
    //           ),
    //           ProfileButton(
    //             icon: Icons.trip_origin,
    //             label: "Notification",
    //             onPressed: () {},
    //           ),
    //           ProfileButton(
    //             icon: Icons.settings,
    //             label: "Preferences",
    //             onPressed: () {},
    //           ),
    //         ],
    //       ),
    //     ),
    //     // This trailing comma makes auto-formatting nicer for build methods.
    //   ),
    // );
  }
}
