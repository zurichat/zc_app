import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hng/constants/app_strings.dart';
import 'package:hng/models/channel_members.dart';
import 'package:hng/models/channel_model.dart';
import 'package:hng/models/user_search_model.dart';
import 'package:hng/ui/shared/colors.dart';
import 'package:hng/ui/shared/shared.dart';
import 'package:hng/ui/shared/styles.dart';
import '../../../shared/colors.dart';
import 'package:stacked/stacked.dart';
import '../shared_widgets.dart';
import 'channel_members_list_model.dart';

class ChannelMembersList extends StatefulWidget {
  final ChannelModel channelDetail;
  final List<ChannelMemberModel> channelMembersIdentifications;

  ChannelMembersList(
      {required this.channelMembersIdentifications,
      required this.channelDetail,
      Key? key})
      : super(key: key);

  @override
  _ChannelMembersListState createState() => _ChannelMembersListState();
}

class _ChannelMembersListState extends State<ChannelMembersList> {
  @override
  Widget build(BuildContext context) {
    ModalRoute.of(context)!.didPush().then(
          (value) => SystemChrome.setSystemUIOverlayStyle(
            SystemUiOverlayStyle(
              statusBarColor: Color(0xFF00B87C),
            ),
          ),
        );
    return ViewModelBuilder<ChannelMembersListModel>.reactive(
      viewModelBuilder: () => ChannelMembersListModel(),
      onModelReady: (ChannelMembersListModel model) async {
        for (int i = 0; i < widget.channelMembersIdentifications.length; i++) {
          print(
              'Member [$i] deets:: ${widget.channelMembersIdentifications[i].id}');
        }
        await model.fetchOrganisationMembers(
            channelMembersId: widget.channelMembersIdentifications);
      },
      builder: (context, viewModel, child) {
        return Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            title: Container(
              color: Colors.white,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("#${widget.channelDetail.name}",
                      style: AppTextStyles.body1Bold),
                  Text(
                    "${widget.channelMembersIdentifications.length} members",
                    style: AppTextStyles.faintBodyText,
                  ),
                ],
              ),
            ),
            backgroundColor: Colors.white,
            leading: IconButton(
              icon: const Icon(
                Icons.arrow_back_ios_outlined,
                color: AppColors.deepGreyColor,
                size: 24,
              ),
              padding: const EdgeInsets.only(left: 18),
              onPressed: () {
                viewModel.goBack();
              },
              iconSize: 25.0,
            ),
            elevation: 0,
          ),
          body: Column(
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(25.0, 16.0, 25.0, 0),
                child: Card(
                  shadowColor: Colors.black,
                  elevation: 0,
                  child: SearchField(
                    onChanged: (pattern) {
                      viewModel.onSearchUser(pattern);
                    },
                    labelText: 'Search for people',
                  ),
                ),
              ),
              Expanded(
                child: ListView.separated(
                  physics: const BouncingScrollPhysics(),
                  padding: const EdgeInsets.fromLTRB(20.0, 25.0, 12.0, 25.0),
                  itemCount: widget.channelMembersIdentifications.length,
                  separatorBuilder: (context, index) =>
                      const SizedBox(height: 24),
                  itemBuilder: (context, index) {
                    viewModel.fetchOrganisationMembers(
                        channelMembersId: widget.channelMembersIdentifications);

                    return Row(
                      children: [
                        Expanded(
                          child: Row(
                            children: [
                              Stack(
                                alignment: Alignment.topRight,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(4.0),
                                    child: Image.asset(
                                      'assets/images/chimamanda.png',
                                    ),
                                  ),
                                  //if (viewModel.matchingUsers[index].online)
                                  const CircleAvatar(
                                    backgroundColor: Color(0xFF00B87C),
                                    radius: 4.0,
                                  ),
                                ],
                              ),
                              const SizedBox(width: 20.0),
                              Text(
                                viewModel.channelMembers[index].userName!,
                                style: GoogleFonts.lato(
                                  color: AppColors.deepGreyColor,
                                ),
                              ),
                              Text(
                                '${viewModel.channelMembers[index].firstName} ${viewModel.channelMembers[index].lastName}',
                                style: GoogleFonts.lato(
                                  color: AppColors.darkGreyColor,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    );
                  },
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
