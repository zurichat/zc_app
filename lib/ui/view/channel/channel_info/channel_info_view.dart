import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hng/models/channel_members.dart';
import 'package:hng/models/channel_model.dart';
import 'package:hng/ui/shared/colors.dart';
import '../../../shared/colors.dart';
import '../../../shared/shared.dart';
import 'widgets/seventh_section.dart';
import 'package:stacked/stacked.dart';
import 'channel_info_view_model.dart';
import 'widgets/custom_app_bar.dart';
import 'widgets/edit_button.dart';
import 'widgets/fifth_section.dart';
import 'widgets/first_section.dart';
import 'widgets/fourth_section.dart';
import 'widgets/second_section.dart';
import 'widgets/sixth_section.dart';
import 'widgets/textstyles.dart';
import 'widgets/third_section.dart';

class ChannelInfoView extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(statusBarColor: AppColors.deepBlackColor));
    return ViewModelBuilder<ChannelInfoViewModel>.reactive(
      fireOnModelReadyOnce: true,
      onModelReady: (model) {
        model.getChannelInfo();
      },
      disposeViewModel: false,
      builder: (context, model, child)
      => ScreenUtilInit(
          designSize: const Size(411, 823),
          builder: () => Scaffold(
          appBar: PreferredSize(
              preferredSize: const Size.fromHeight(56),
              child: customAppBar(model)
          ),
          // ignore: avoid_unnecessary_containers
          body: SafeArea(
            child: SingleChildScrollView(
              padding: EdgeInsets.fromLTRB(8.w, 16.h, 8.w, 0),
              scrollDirection: Axis.vertical,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                   FirstSection(model),

//                   GestureDetector(
//                     onTap: model.navigateToEditChannel,
//                     //child:  EditButton(),
//                   ),
//
//                   const SecondSection(),
//
//                   Container(
//                       margin: const EdgeInsets.symmetric(
//                           vertical: 15, horizontal: 19),
//                       child: Text(
//                         'You wont\'t  recieve any messages from a muted channel',
//                         style: faintTextStyle(),
//                       )),
// //Third Section
//
//                   ThirdSection(
//                     goToMembersListScreen:(){
// model.navigateToMembersList(widget.channelMembers,widget.channelDetail);
//                   }  ,
//                   membersNumber: widget.numberOfMembers
//                   ),
//
//                   Container(
//                     margin:
//                         const EdgeInsets.symmetric(vertical: 10, horizontal: 19),
//                     child: Text(
//                       'Bookmarks',
//                       style: faintTextStyle(),
//                     ),
//                   ),
//
//                   const FourthSection(),
//                   const FifthSection(),
//
//                   Container(
//                     margin:
//                         const EdgeInsets.symmetric(vertical: 10, horizontal: 19),
//                     child: Text(
//                       'Advanced',
//                       style: faintTextStyle(),
//                     ),
//                   ),
//
//                   const SixthSection(),
                ],
              ),
            ),
          ),
        ),
      ),
      viewModelBuilder: () => ChannelInfoViewModel(),
    );
  }
}
