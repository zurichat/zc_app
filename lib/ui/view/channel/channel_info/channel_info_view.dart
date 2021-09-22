import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hng/models/channel_members.dart';
import 'package:hng/models/channel_model.dart';
import 'package:hng/ui/shared/colors.dart';
import 'package:stacked/stacked.dart';
import 'channel_info_view_model.dart';
import 'widgets/custom_app_bar.dart';
import 'widgets/edit_button.dart';
import 'widgets/fifth_section.dart';
import 'widgets/first_section.dart';
import 'widgets/fourth_section.dart';
import 'widgets/second_section.dart';
import 'widgets/seventh_section.dart';
import 'widgets/sixth_section.dart';
import 'widgets/textstyles.dart';
import 'widgets/third_section.dart';

class ChannelInfoView extends StatefulWidget {
  final int numberOfMembers;
  List <ChannelMembermodel>channelMembers;
  ChannelModel channelDetail;
  ChannelInfoView({required this.numberOfMembers,required this.channelMembers,required this.channelDetail});

  @override
  _ChannelInfoViewState createState() => _ChannelInfoViewState();
}

class _ChannelInfoViewState extends State<ChannelInfoView> {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
        const SystemUiOverlayStyle(statusBarColor: AppColors.deepBlackColor));
    return ViewModelBuilder<ChannelInfoViewModel>.reactive(
      builder: (context, model, child) => Scaffold(
        appBar: PreferredSize(
            preferredSize: const Size.fromHeight(60), child: customAppBar()),
        // ignore: avoid_unnecessary_containers
        body: SafeArea(
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                 FirstSection(channelName: widget.channelDetail.name),

                GestureDetector(
                  //onTap: model.navigateToEditChannel,
                  child: const EditButton(),
                ),

                const SecondSection(),

                Container(
                    margin: const EdgeInsets.symmetric(
                        vertical: 15, horizontal: 19),
                    child: Text(
                      'You wont\'t  recieve any messages from a muted channel',
                      style: faintTextStyle(),
                    )
                ),
                //Third Section

                ThirdSection(
                  goToMembersListScreen:(){
model.navigateToMembersList(widget.channelMembers,widget.channelDetail);
                }  ,
                membersNumber: widget.numberOfMembers
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

                const SixthSection(),
                const SeventhSection()

              ],
            ),
          ),
        ),
      ),
      viewModelBuilder: () => ChannelInfoViewModel(),
    );
  }
}
