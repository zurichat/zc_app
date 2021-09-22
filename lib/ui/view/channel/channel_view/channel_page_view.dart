import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hng/models/channel_members.dart';
import 'package:hng/models/channel_model.dart';
import 'package:hng/ui/shared/colors.dart';
import 'package:hng/ui/shared/shared.dart';
//import 'package:hng/ui/view/channel/channel_view/channel_page_view.form.dart';
import 'package:hng/ui/view/channel/channel_view/channel_page_viewmodel.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked/stacked_annotations.dart';

@FormView(
  fields: [
    FormTextField(name: 'editor'),
  ],
)
// class ChannelPageView extends StatelessWidget with $ChannelPageView {
//   ChannelPageView({Key? key}) : super(key: key);

class ChannelPageView extends StatelessWidget {
  ChannelModel channelDetail;
  List <ChannelMembermodel>channelMembers;
ChannelPageView({required this.channelDetail,required this.channelMembers});
  static String name = "general";

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<ChannelPageViewModel>.reactive(
      onModelReady: (model) => listenToFormUpdated(model),
      //this parameter allows us to reuse the view model to persist the state
      //disposeViewModel: false,
      //initialise the view model only once
//      initialiseSpecialViewModelsOnce: true,
      viewModelBuilder: () => ChannelPageViewModel(),
      builder: (context, viewModel, child) {
        return Scaffold(
          appBar: appBar('${channelDetail.name}', "${channelMembers.length.toString()} members", 
          context,viewModel.goBack, (){
viewModel.navigateToChannelInfoScreen(channelMembers.length,channelMembers,channelDetail);
          } 
            ),
          body: SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: Column(
              children: [
                Column(
                  children: [
                    channelName('${channelDetail.name}'),
                  ],
                ),
                Row(
                  children: [
                    Expanded(
                      child: channelInfo('@mark',
                          ' created this channel on August 12, 2021. This is the very beginning of the #$name channel.'),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                row(viewModel.navigateToAddPeople),
                const SizedBox(height: 20),
                dateBuilder(context),
                const SizedBox(height: 7),
                ListTile(
                  leading: Image.asset('assets/channel_page/female.png'),
                  title: Row(
                    children: [
                      const Text(
                        'Naza',
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w700,
                          color: AppColors.deepBlackColor,
                        ),
                      ),
                      const SizedBox(width: 10),
                      const Text(
                        '12:30pm',
                        style: TextStyle(
                          fontSize: 10,
                          fontWeight: FontWeight.w400,
                          color: AppColors.greyishColor,
                        ),
                      ),
                    ],
                  ),
                  subtitle: Text('joined #$name'),
                ),
                /* ListTile(
                  leading: Image.asset('assets/channel_page/femaleuser.png'),
                  title: Row(
                    children: [
                      const Text(
                        'Ali',
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w700,
                          color: AppColors.deepBlackColor,
                        ),
                      ),
                      const SizedBox(width: 10),
                      const Text(
                        '12:30pm',
                        style: TextStyle(
                          fontSize: 10,
                          fontWeight: FontWeight.w400,
                          color: AppColors.greyishColor,
                        ),
                      ),
                    ],
                  ),
                  subtitle: Text('Joined #$name'),
                ), */
              ],
            ),
          ),
          bottomSheet: Container(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            height: 70,
            color: Colors.white,
            child: Row(
              children: <Widget>[
                Expanded(
                  child: TextField(
                    controller: editorController,
                    decoration: InputDecoration.collapsed(
                      hintText: 'Message #$name',
                      hintStyle: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                        color: AppColors.greyishColor,
                      ),
                    ),
                    // textCapitalization: TextCapitalization.sentences,
                  ),
                ),
                /* const ImageIcon(AssetImage('assets/channel_page/light.png')),
                const SizedBox(width: 22),
                const Icon(CupertinoIcons.camera),
                const SizedBox(width: 22),
                const ImageIcon(AssetImage('assets/channel_page/attach.png')), */
                IconButton(
                  icon: Icon(Icons.send),
                  color: AppColors.greyishColor,
                  onPressed: () {},
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

AppBar appBar(String text, String nexttext, BuildContext context,
Function backNavigation,Function infoNavigation, ) {

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
        // const SizedBox(height: 10),
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
            onTap: () {

            },
            child: const Icon(
              CupertinoIcons.search,
              color: AppColors.deepBlackColor,
              size: 22.0,
            ),
          )),
      Padding(
        padding: const EdgeInsets.only(right: 20.0),
        child: GestureDetector(
          onTap:(){
            infoNavigation();
          } ,
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
    padding: const EdgeInsets.only(left: 10, top: 80),
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
          InkWell(
            onTap: () {},
            splashColor: Colors.transparent,
            highlightColor: Colors.transparent,
            child: Container(
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: AppColors.zuriPrimaryColor,
                    width: 1.28,
                  )),
              child: ImageIcon(AssetImage('assets/channel_page/edit.png'),
                  color: AppColors.zuriPrimaryColor),
              height: 60.0,
              width: 60.0,
            ),
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
          InkWell(
            onTap: pressed,
            splashColor: Colors.transparent,
            highlightColor: Colors.transparent,
            child: Container(
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: AppColors.zuriPrimaryColor,
                    width: 1.28,
                  )),
              child: Icon(
                Icons.person_add_alt_1_outlined,
                color: AppColors.zuriPrimaryColor,
              ),
              height: 60.0,
              width: 60.0,
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

/* sendMessageArea() {
  return Container(
    padding: const EdgeInsets.symmetric(horizontal: 8),
    height: 70,
    color: Colors.white,
    child: Row(
      children: <Widget>[
        Expanded(
          child: TextField(
            decoration: InputDecoration.collapsed(
              hintText: 'Message #${ChannelPageView.name}',
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
} */

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
