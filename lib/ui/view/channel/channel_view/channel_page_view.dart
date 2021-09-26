import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hng/general_widgets/custom_text.dart';
import 'package:hng/models/channel_model.dart';
import 'package:hng/ui/shared/smart_widgets/thread_card/thread_card_view.dart';
import 'package:hng/ui/view/channel/channel_view/widgets/custom_appbar.dart';
import 'package:hng/ui/view/channel/channel_view/widgets/custom_row.dart';
import 'package:hng/ui/view/dm_user/icons/zap_icon.dart';
import 'package:hng/utilities/utilities.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import '../../../../app/app.locator.dart';
import '../../../../app/app.router.dart';
import '../../../../models/static_user_model.dart';
import '../../../shared/colors.dart';
import '../../../shared/shared.dart';

import 'package:stacked/stacked.dart';
import 'package:stacked/stacked_annotations.dart';

import '../../../shared/colors.dart';
import '../../../shared/styles.dart';
import 'channel_page_view.form.dart';
import 'channel_page_viewmodel.dart';
import 'widgets/custom_appbar.dart';
import 'widgets/custom_row.dart';

@FormView(
  fields: [
    FormTextField(name: 'editor'),
  ],
)
class ChannelPageView extends StatelessWidget with $ChannelPageView {
  ChannelPageView({
    Key? key,
    required this.channelname,
    required this.channelId,
    required this.membersCount,
    required this.public,
  }) : super(key: key);
  static String name = "general";
  final String? channelname;
  final String? channelId;
  final int? membersCount;
  final bool? public;

  @override
  Widget build(BuildContext context) {
    ScrollController _scrollController = ScrollController();
    TextEditingController _messageController = TextEditingController();
    return ViewModelBuilder<ChannelPageViewModel>.reactive(
      onModelReady: (model) {
        model.joinChannel("$channelId");
        model.fetchMessages("$channelId");

        model.getChannelSocketId("$channelId");
        model.listenToNewMessages("$channelId");
      },
      //this parameter allows us to reuse the view model to persist the state

      viewModelBuilder: () => ChannelPageViewModel(),
      builder: (context, viewModel, child) {
        return Scaffold(
          appBar: CustomAppBars(
            channelName: "#$channelname",
            numberOfMembers: membersCount,
            model: viewModel,
          ),
          body: Column(
            children: [
              channelName("#$channelname"),
              SizedBox(
                height: 10.0,
              ),
              Container(
                child: channelInfo('@mark',
                    ' created this channel on August 12, 2021. This is the very beginning of the #$name channel.'),
              ),
              const SizedBox(height: 20),

              CustomRow(model: viewModel),
              const SizedBox(height: 20),
              dateBuilder(context),
              const SizedBox(height: 7),
              Expanded(
                child: !nullListChecker(viewModel.channelUserMessages)
                    ? ListView.builder(
                        controller: _scrollController,
                        itemCount: viewModel.channelUserMessages!.length,
                        itemBuilder: (context, index) =>
                            ThreadCardView.threadChannelMain(
                                viewModel.channelUserMessages![index]),
                      )
                    : Container(),
              ),
              //message starts here
              Align(
                alignment: Alignment.bottomCenter,
                child: Material(
                  color: Colors.white,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Divider(height: 0, color: Color(0xFF999999)),
                      Row(
                        children: [
                          Expanded(
                            child: Container(
                              height: 56,
                              margin: EdgeInsets.only(left: 13.0),
                              alignment: Alignment.centerLeft,
                              child: FocusScope(
                                child: Focus(
                                  onFocusChange: (focus) {
                                    if (focus) {
                                      viewModel.onMessageFieldTap();
                                    } else {
                                      viewModel.onMessageFocusChanged();
                                    }
                                  },
                                  child: TextField(
                                    controller: _messageController,
                                    expands: true,
                                    maxLines: null,
                                    textAlignVertical: TextAlignVertical.center,
                                    decoration: InputDecoration.collapsed(
                                        hintText: 'Add a Reply',
                                        hintStyle: AppTextStyles.faintBodyText),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Visibility(
                            visible: !viewModel.isVisible,
                            child: Row(
                              children: [
                                IconButton(
                                  icon: Icon(
                                    Icons.camera_alt_outlined,
                                    color: AppColors.darkGreyColor,
                                  ),
                                  onPressed: () {},
                                ),
                                IconButton(
                                  icon: Icon(
                                    Icons.attach_file_outlined,
                                    color: AppColors.darkGreyColor,
                                  ),
                                  onPressed: () {},
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                      Visibility(
                          visible: viewModel.isVisible,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  IconButton(
                                      onPressed: () {},
                                      icon: Icon(
                                        AppIcons.shapezap,
                                        color: AppColors.darkGreyColor,
                                      )),
                                  IconButton(
                                      onPressed: () {},
                                      icon: Icon(
                                        Icons.alternate_email_outlined,
                                        color: AppColors.darkGreyColor,
                                      )),
                                  IconButton(
                                      onPressed: () {},
                                      icon: Icon(
                                        Icons.tag_faces_sharp,
                                        color: AppColors.darkGreyColor,
                                      )),
                                  IconButton(
                                      onPressed: () {},
                                      icon: Icon(
                                        Icons.camera_alt_outlined,
                                        color: AppColors.darkGreyColor,
                                      )),
                                  IconButton(
                                      onPressed: () {},
                                      icon: Icon(
                                        Icons.attach_file_outlined,
                                        color: AppColors.darkGreyColor,
                                      )),
                                ],
                              ),
                              IconButton(
                                  onPressed: () {
                                    if (_messageController.text
                                        .toString()
                                        .isNotEmpty) {
                                      viewModel.sendMessage(
                                          _messageController.text,
                                          "$channelId");

                                      _messageController.text = "";
                                      FocusScope.of(context)
                                          .requestFocus(FocusNode());
                                      _scrollController.jumpTo(_scrollController
                                          .position.maxScrollExtent);
                                    }
                                  },
                                  icon: Icon(
                                    Icons.send,
                                    color: AppColors.darkGreyColor,
                                  ))
                            ],
                          ))
                    ],
                  ),
                ),
              )
              // ListTile(
              //   leading: Image.asset('assets/channel_page/female.png'),
              //   title: Row(
              //     children: [
              //       Text(
              //         'Clutch',
              //         style: AppTextStyles.nameStyle,
              //       ),
              //       const SizedBox(width: 10),
              //       Text(
              //         '12:30pm',
              //         style: AppTextStyles.smallText,
              //       ),
              //     ],
              //   ),
              //   subtitle: Text('Joined #$name'),
              // ),
              // ListTile(
              //   leading: Image.asset('assets/channel_page/femaleuser.png'),
              //   title: Row(
              //     children: [
              //       Text(
              //         'Ali',
              //         style: AppTextStyles.nameStyle,
              //       ),
              //       const SizedBox(width: 10),
              //       Text(
              //         '12:30pm',
              //         style: AppTextStyles.smallText,
              //       ),
              //     ],
              //   ),
              //   subtitle: Text('Joined #$name'),
              // ),
            ],
          ),
          //  bottomSheet: sendMessageArea(name, editorController),
        );
      },
    );
  }
}

AppBar appBar(
  String text,
  String nexttext,
  BuildContext context,
  Function backNavigation,
  Function infoNavigation,
) {
  return AppBar(
    elevation: 1,
    backgroundColor: AppColors.whiteColor,
    leading: GestureDetector(
      onTap: () {
        backNavigation();
      },
      child: const Icon(
        CupertinoIcons.back,
        color: AppColors.deepBlackColor,
      ),
    ),
    title: Column(
      children: [
        Row(
          children: [
            Text(
              text,
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w700,
                fontStyle: FontStyle.normal,
                color: AppColors.deepBlackColor,
              ),
            ),
          ],
        ),
        const SizedBox(height: 10),
        Row(
          children: [
            Text(
              nexttext,
              style: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w400,
                fontStyle: FontStyle.normal,
                color: AppColors.deepBlackColor,
              ),
            ),
          ],
        ),
      ],
    ),
    actions: [
      Padding(
          padding: const EdgeInsets.only(right: 20.0),
          child: GestureDetector(
            onTap: () {},
            child: const Icon(
              CupertinoIcons.search,
              color: AppColors.deepBlackColor,
              size: 22.0,
            ),
          )),
      Padding(
        padding: const EdgeInsets.only(right: 20.0),
        child: GestureDetector(
          onTap: () {
            infoNavigation();
          },
          child: const Icon(
            CupertinoIcons.info,
            color: AppColors.deepBlackColor,
            size: 29.0,
          ),
        ),
      ),
    ],
  );
}

Padding channelName(String text) {
  return Padding(
    padding: const EdgeInsets.only(left: 10, top: 200),
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          text,
          style: const TextStyle(
            fontSize: 20.0,
            fontWeight: FontWeight.w700,
            fontStyle: FontStyle.normal,
          ),
        )
      ],
    ),
  );
}

Container channelInfo(String text, String nexttext) {
  return Container(
    child: Padding(
      padding: const EdgeInsets.only(left: 10.0, top: 1.0, right: 20),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: RichText(
              maxLines: 2,
              overflow: TextOverflow.clip,
              text: TextSpan(
                text: text,
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  color: AppColors.zuriPrimaryColor,
                ),
                children: <TextSpan>[
                  TextSpan(
                    text: nexttext,
                    style: TextStyle(
                      height: 1.5,
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      color: AppColors.greyishColor,
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    ),
  );
}

Row row() {
  final navigator = locator<NavigationService>();
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    // crossAxisAlignment: CrossAxisAlignment.center,
    children: [
      Column(
        children: [
          GestureDetector(
            onTap: () {},
            child: const CircleAvatar(
                radius: 30,
                backgroundColor: AppColors.lightGreen,
                child: ImageIcon(AssetImage('assets/channel_page/edit.png'))),
          ),
          const SizedBox(height: 5),
          const Text(
            'Add Description',
            style: TextStyle(
              color: AppColors.greyishColor,
              fontSize: 14,
            ),
          )
        ],
      ),
      const SizedBox(width: 30),
      Column(
        children: [
          GestureDetector(
            onTap: () => navigator.navigateTo(Routes.addPeopleView),
            child: const CircleAvatar(
              radius: 30,
              backgroundColor: AppColors.lightGreen,
              child: Icon(
                Icons.person_add_alt_1_sharp,
                color: AppColors.greyishColor,
              ),
            ),
          ),
          const SizedBox(height: 5),
          const Text(
            'Add People',
            style: TextStyle(
              color: AppColors.greyishColor,
              fontSize: 14,
            ),
          )
        ],
      ),
    ],
  );
}

sendMessageArea() {
  return Container(
    padding: const EdgeInsets.symmetric(horizontal: 8),
    height: 70,
    color: Colors.white,
    child: Row(
      children: <Widget>[
        const Expanded(
          child: TextField(
            decoration: InputDecoration.collapsed(
              hintText: 'Message #teamsocrates',
              hintStyle: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w400,
                color: AppColors.greyishColor,
              ),
            ),
            textCapitalization: TextCapitalization.sentences,
          ),
        ),
        const ImageIcon(AssetImage('assets/channel_page/light.png')),
        const SizedBox(width: 22),
        const Icon(CupertinoIcons.camera),
        const SizedBox(width: 22),
        const ImageIcon(AssetImage('assets/channel_page/attach.png')),
      ],
    ),
  );
}

dateBuilder(BuildContext context) {
  return Row(children: <Widget>[
    const Expanded(
        child: Divider(
      endIndent: 1,
      color: AppColors.greyishColor,
    )),
    Padding(
      padding: const EdgeInsets.only(left: 0.0, right: 0.0),
      child: Container(
        width: 50,
        height: 20,
        decoration: BoxDecoration(
          border: Border.all(width: 1),
          borderRadius: BorderRadius.circular(40),
        ),
        child: const Text(
          'today',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w400,
          ),
        ),
      ),
    ),
    const Expanded(
        child: Divider(
      indent: 1,
      color: Colors.black,
    )),
  ]);
}



// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:hng/models/channel_members.dart';
// import 'package:hng/models/channel_model.dart';
// import 'package:stacked/stacked.dart';
// import 'package:stacked_services/stacked_services.dart';
// import '../../../../app/app.locator.dart';
// import '../../../../app/app.router.dart';
// import '../../../../models/static_user_model.dart';
// import '../../../shared/colors.dart';
// import '../../../shared/shared.dart';

// import 'channel_page_viewmodel.dart';

// class ChannelPageView extends StatelessWidget {
//   ChannelModel channelDetail;
//   List <ChannelMembermodel>channelMembers;
// ChannelPageView({required this.channelDetail,required this.channelMembers});
//   @override
//   Widget build(BuildContext context) {
//     final usermodel = [
//       StaticUserModel(
//         userName: 'Clutch',
//         joinInfo: 'Joined #teamsocrates',
//         time: '12:30pm',
//         userimg: 'assets/channel_page/female.png',
//       ),
//       StaticUserModel(
//         userName: 'Ali',
//         joinInfo: 'Joined #teamsocrates',
//         time: '12:30pm',
//         userimg: 'assets/channel_page/femaleuser.png',
//       )
//     ];
//     return ViewModelBuilder<ChannelPageViewModel>.reactive(
//       //this parameter allows us to reuse the view model to persist the state
//       disposeViewModel: false,
//       //initialise the view model only once
//       initialiseSpecialViewModelsOnce: true,
//       viewModelBuilder: () => ChannelPageViewModel(),
//       builder: (context, viewModel, child) {
//         return Scaffold(
//           appBar: appBar('${channelDetail.name}', "${channelMembers.length.toString()} members", 
//           context,viewModel.goBack, 
//           //(){
// //viewModel.navigateToChannelInfoScreen(channelMembers.length,channelMembers,channelDetail)
//           //} 
//             ),
         
//           body: SingleChildScrollView(
//             scrollDirection: Axis.vertical,
//             child: Column(
//               children: [
//                 Column(
//                   children: [
//                     channelName('${channelDetail.name}'),
//                   ],
//                 ),
//                 Row(
//                   children: [
//                     Expanded(
//                       child: channelInfo('@mark', '''
//  created this channel on August 12, 2021. This is the very beginning of the #teamsocrates channel.'''),
//                     ),
//                   ],
//                 ),
//                 const SizedBox(height: 20),
//                 row(viewModel.navigateToAddPeople() ),
//                 const SizedBox(height: 20),
//                 dateBuilder(context),
//                 const SizedBox(height: 7),
//                 ListTile(
//                   leading: Image.asset('assets/channel_page/female.png'),
//                   title: Row(
//                     children: [
//                       const Text(
//                         'Clutch',
//                         style: TextStyle(
//                           fontSize: 14,
//                           fontWeight: FontWeight.w700,
//                           color: AppColors.deepBlackColor,
//                         ),
//                       ),
//                       const SizedBox(width: 10),
//                       const Text(
//                         '12:30pm',
//                         style: TextStyle(
//                           fontSize: 10,
//                           fontWeight: FontWeight.w400,
//                           color: AppColors.greyishColor,
//                         ),
//                       ),
//                     ],
//                   ),
//                   subtitle: const Text('Joined #teamsocrates'),
//                 ),
//                 ListTile(
//                   leading: Image.asset('assets/channel_page/femaleuser.png'),
//                   title: Row(
//                     children: [
//                       const Text(
//                         'Ali',
//                         style: TextStyle(
//                           fontSize: 14,
//                           fontWeight: FontWeight.w700,
//                           color: AppColors.deepBlackColor,
//                         ),
//                       ),
//                       const SizedBox(width: 10),
//                       const Text(
//                         '12:30pm',
//                         style: TextStyle(
//                           fontSize: 10,
//                           fontWeight: FontWeight.w400,
//                           color: AppColors.greyishColor,
//                         ),
//                       ),
//                     ],
//                   ),
//                   subtitle: const Text('Joined #teamsocrates'),
//                 ),
//               ],
//             ),
//           ),
//           bottomSheet: sendMessageArea(),
//         );
//       },
//     );
//   }
// }

// AppBar appBar(String text, String nexttext, BuildContext context,
// Function backNavigation,
// //Function infoNavigation, 
// ) {

//   return AppBar(
//     elevation: 1,
//     backgroundColor: AppColors.whiteColor,
//     leading: GestureDetector(
//       onTap: () {
//         backNavigation();
//       },
//       child: const Icon(
//         CupertinoIcons.back,
//         color: AppColors.deepBlackColor,
//       ),
//     ),
//     title: Column(
//       children: [
//         Row(
//           children: [
//             Text(
//               text,
//               style: const TextStyle(
//                 fontSize: 20,
//                 fontWeight: FontWeight.w700,
//                 fontStyle: FontStyle.normal,
//                 color: AppColors.deepBlackColor,
//               ),
//             ),
//           ],
//         ),
//         const SizedBox(height: 10),
//         Row(
//           children: [
//             Text(
//               nexttext,
//               style: const TextStyle(
//                 fontSize: 14,
//                 fontWeight: FontWeight.w400,
//                 fontStyle: FontStyle.normal,
//                 color: AppColors.deepBlackColor,
//               ),
//             ),
//           ],
//         ),
//       ],
//     ),
//     actions: [
//       Padding(
//           padding: const EdgeInsets.only(right: 20.0),
//           child: GestureDetector(
//             onTap: () {

//             },
//             child: const Icon(
//               CupertinoIcons.search,
//               color: AppColors.deepBlackColor,
//               size: 22.0,
//             ),
//           )),
//       Padding(
//         padding: const EdgeInsets.only(right: 20.0),
//         child: GestureDetector(
//           onTap:(){
//             //infoNavigation();
//           } ,
//           child: const Icon(
//             CupertinoIcons.info,
//             color: AppColors.deepBlackColor,
//             size: 29.0,
//           ),
//         ),
//       ),
//     ],
//   );
// }

// Padding channelName(String text) {
//   return Padding(
//     padding: const EdgeInsets.only(left: 10, top: 200),
//     child: Row(
//       crossAxisAlignment: CrossAxisAlignment.center,
//       children: [
//         Text(
//           text,
//           style: const TextStyle(
//             fontSize: 20.0,
//             fontWeight: FontWeight.w700,
//             fontStyle: FontStyle.normal,
//           ),
//         )
//       ],
//     ),
//   );
// }

// Container channelInfo(String text, String nexttext) {
//   return Container(
//     child: Padding(
//       padding: const EdgeInsets.only(left: 10.0, top: 1.0, right: 20),
//       child: Row(
//         crossAxisAlignment: CrossAxisAlignment.center,
//         children: [
//           Expanded(
//             child: RichText(
//               maxLines: 2,
//               overflow: TextOverflow.clip,
//               text: TextSpan(
//                 text: text,
//                 style: TextStyle(
//                   fontSize: 14,
//                   fontWeight: FontWeight.w400,
//                   color: AppColors.zuriPrimaryColor,
//                 ),
//                 children: <TextSpan>[
//                   TextSpan(
//                     text: nexttext,
//                     style: TextStyle(
//                       height: 1.5,
//                       fontSize: 14,
//                       fontWeight: FontWeight.w400,
//                       color: AppColors.greyishColor,
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           )
//         ],
//       ),
//     ),
//   );
// }

// Row row(Function()? pressed) {
//   return Row(
//     mainAxisAlignment: MainAxisAlignment.center,
//     // crossAxisAlignment: CrossAxisAlignment.center,
//     children: [
//       Column(
//         children: [
//           GestureDetector(
//             onTap: () {},
//             child: const CircleAvatar(
//                 radius: 30,
//                 backgroundColor: AppColors.lightGreen,
//                 child: ImageIcon(AssetImage('assets/channel_page/edit.png'))),
//           ),
//           const SizedBox(height: 5),
//           const Text(
//             'Add Description',
//             style: TextStyle(
//               color: AppColors.greyishColor,
//               fontSize: 14,
//             ),
//           )
//         ],
//       ),
//       const SizedBox(width: 30),
//       Column(
//         children: [
//           GestureDetector(
//             onTap: pressed,
//             child: const CircleAvatar(
//               radius: 30,
//               backgroundColor: AppColors.lightGreen,
//               child: Icon(
//                 Icons.person_add_alt_1_sharp,
//                 color: AppColors.greyishColor,
//               ),
//             ),
//           ),
//           const SizedBox(height: 5),
//           const Text(
//             'Add People',
//             style: TextStyle(
//               color: AppColors.greyishColor,
//               fontSize: 14,
//             ),
//           )
//         ],
//       ),
//     ],
//   );
// }

// sendMessageArea() {
//   return Container(
//     padding: const EdgeInsets.symmetric(horizontal: 8),
//     height: 70,
//     color: Colors.white,
//     child: Row(
//       children: <Widget>[
//         const Expanded(
//           child: TextField(
//             decoration: InputDecoration.collapsed(
//               hintText: 'Message #teamsocrates',
//               hintStyle: TextStyle(
//                 fontSize: 16,
//                 fontWeight: FontWeight.w400,
//                 color: AppColors.greyishColor,
//               ),
//             ),
//             textCapitalization: TextCapitalization.sentences,
//           ),
//         ),
//         const ImageIcon(AssetImage('assets/channel_page/light.png')),
//         const SizedBox(width: 22),
//         const Icon(CupertinoIcons.camera),
//         const SizedBox(width: 22),
//         const ImageIcon(AssetImage('assets/channel_page/attach.png')),
//       ],
//     ),
//   );
// }

// dateBuilder(BuildContext context) {
//   return Row(children: <Widget>[
//     const Expanded(
//         child: Divider(
//       endIndent: 1,
//       color: AppColors.greyishColor,
//     )),
//     Padding(
//       padding: const EdgeInsets.only(left: 0.0, right: 0.0),
//       child: Container(
//         width: 50,
//         height: 20,
//         decoration: BoxDecoration(
//           border: Border.all(width: 1),
//           borderRadius: BorderRadius.circular(40),
//         ),
//         child: const Text(
//           'today',
//           textAlign: TextAlign.center,
//           style: TextStyle(
//             fontSize: 12,
//             fontWeight: FontWeight.w400,
//           ),
//         ),
//       ),
//     ),
//     const Expanded(
//         child: Divider(
//       indent: 1,
//       color: Colors.black,
//     )),
//   ]);
// }
