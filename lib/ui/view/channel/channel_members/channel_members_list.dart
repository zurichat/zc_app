import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hng/constants/app_strings.dart';
import 'package:hng/models/channel_members.dart';
import 'package:hng/models/channel_model.dart';
import 'package:hng/ui/shared/colors.dart';
import 'package:hng/ui/shared/styles.dart';
import 'package:hng/ui/shared/zuri_appbar.dart';
import 'package:hng/ui/view/plugins/widgets/custom_plugin_list_tile.dart';
import '../../../shared/colors.dart';
import '../../plugins/widgets/custom_plugin_list_tile.dart';
import 'package:stacked/stacked.dart';
import '../shared_widgets.dart';
import 'channel_members_list_model.dart';

class ChannelMembersList extends StatelessWidget {
  final List<ChannelMembermodel> channelMembers;
  final ChannelModel channelDetail;
  const ChannelMembersList(
      {required this.channelMembers, required this.channelDetail, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<ChannelMembersModel>.reactive(
      viewModelBuilder: () => ChannelMembersModel(),
      builder: (context, viewModel, child) {
        return Scaffold(
          appBar: ZuriTopBar(
            leading: Icons.clear,
            leadingPress: () => viewModel.goBack(),
            orgTitle: Text(
              channelDetail.name,
              style: AppTextStyles.heading7,
            ),
            actions: [
              Padding(
                padding: const EdgeInsets.fromLTRB(0.0, 20.0, 25.0, 0.0),
                child: InkWell(
                  child: Text(
                    Edit,
                    style: AppTextStyles.heading5,
                  ),
                  highlightColor: Colors.transparent,
                  splashColor: Colors.transparent,
                  onTap: () {},
                ),
              )
            ],
          ),
          body: Column(
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(25.0, 16.0, 25.0, 0),
                child: Card(
                  shadowColor: Colors.black,
                  elevation: 4,
                  child: SearchField(
                    onChanged: viewModel.onSearchUser,
                    labelText: SearchPeople,
                    // controller: viewModel.editor,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(25.0, 24.0, 16.0, 0),
                child: GestureDetector(
                  onTap: () {},
                  child: const CustomPluginPageListTile(
                    leadingIcon: Icon(
                      Icons.add,
                      color: AppColors.zuriPrimaryColor,
                    ),
                    text: AddPeople,
                    textColor: AppColors.zuriPrimaryColor,
                  ),
                ),
              ),
              Expanded(
                child: ListView.separated(
                  physics: const BouncingScrollPhysics(),
                  padding: const EdgeInsets.fromLTRB(20.0, 25.0, 12.0, 25.0),
                  itemCount: channelMembers.length,
                  separatorBuilder: (context, index) =>
                      const SizedBox(height: 24),
                  itemBuilder: (context, index) => Row(
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
                                    Chimamanda,
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
                              channelMembers[index].name,
                              style: GoogleFonts.lato(
                                //TODO change to brand colors
                                color: const Color(0xFF424141),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
