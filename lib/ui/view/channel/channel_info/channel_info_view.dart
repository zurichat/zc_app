import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:stacked/stacked.dart';
import 'package:hng/models/channel_members.dart';
import 'package:hng/models/channel_model.dart';
import 'package:hng/ui/shared/colors.dart';
import '../../../shared/shared.dart';
import 'channel_info_view_model.dart';
import 'widgets/custom_app_bar.dart';
import 'widgets/fifth_section.dart';
import 'widgets/first_section.dart';
import 'widgets/fourth_section.dart';
import 'widgets/second_section.dart';
import 'widgets/sixth_section.dart';
import 'widgets/textstyles.dart';
import 'widgets/third_section.dart';

// ignore: must_be_immutable
class ChannelInfoView extends StatelessWidget {
  final int numberOfMembers;
  List<ChannelMembermodel> channelMembers;
  ChannelModel channelDetail;
  ChannelInfoView(
      {required this.numberOfMembers,
      required this.channelMembers,
      required this.channelDetail});

 @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
        const SystemUiOverlayStyle(statusBarColor: AppColors.deepBlackColor));
    return ViewModelBuilder<ChannelInfoViewModel>.reactive(
      builder: (context, model, child) => Scaffold(
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(60),
          child: customAppBar(),
        ),
        body: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                FirstSection(channelName: channelDetail.name),
                // GestureDetector(
                //   onTap: model.navigateToEditChannel,
                //   //child:  EditButton(),
                // ),
                const SecondSection(),
                Container(
                  margin:
                      const EdgeInsets.symmetric(vertical: 15, horizontal: 19),
                  child: Text(
                    'You wont\'t  recieve any messages from a muted channel',
                    style: faintTextStyle(),
                  ),
                ),
                ThirdSection(
                  goToMembersListScreen: () {
                    model.navigateToMembersList(
                        channelMembers, channelDetail);
                  },
                  membersNumber: numberOfMembers,
                ),
                Container(
                  margin:
                      const EdgeInsets.symmetric(vertical: 10, horizontal: 19),
                  child: Text(
                    'Bookmarks',
                    style: faintTextStyle(),
                  ),
                ),
                const FourthSection(),
                const FifthSection(),
                Container(
                  margin:
                      const EdgeInsets.symmetric(vertical: 10, horizontal: 19),
                  child: Text(
                    'Advanced',
                    style: faintTextStyle(),
                  ),
                ),
                SixthSection(channelDetail: channelDetail),
              ],
            ),
          ),
        ),
      ),
      viewModelBuilder: () => ChannelInfoViewModel(),
    );
  }
}
