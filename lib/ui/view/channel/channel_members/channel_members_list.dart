import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:stacked/stacked.dart';
import 'package:zurichat/models/channel_members.dart';
import 'package:zurichat/models/channel_model.dart';
import 'package:zurichat/ui/shared/dumb_widgets/menu_item_tile.dart';
import 'package:zurichat/ui/shared/dumb_widgets/zuri_appbar.dart';
import 'package:zurichat/utilities/constants/app_strings.dart';
import 'package:zurichat/utilities/constants/colors.dart';
import 'package:zurichat/utilities/constants/text_styles.dart';
import 'package:zurichat/utilities/internationalization/app_localization.dart';

import '../shared_widgets.dart';
import 'channel_members_list_model.dart';

class ChannelMembersList extends StatelessWidget {
  final List<ChannelMember> channelMembers;
  final ChannelModel channelDetail;
  const ChannelMembersList(
      {required this.channelMembers, required this.channelDetail, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final local = AppLocalization.of(context);
    return ViewModelBuilder<ChannelMembersModel>.reactive(
      viewModelBuilder: () => ChannelMembersModel(),
      builder: (context, viewModel, child) {
        return Scaffold(
          appBar: ZuriAppBar(
            leading: Icons.clear,
            whiteBackground: true,
            leadingPress: () => viewModel.goBack(),
            orgTitle: Text(
              channelDetail.name,
              style: AppTextStyle.darkGreySize20Bold,
            ),
            actions: [
              Padding(
                padding: const EdgeInsets.fromLTRB(0.0, 20.0, 25.0, 0.0),
                child: InkWell(
                  highlightColor: Colors.transparent,
                  splashColor: Colors.transparent,
                  onTap: () {},
                  child: Text(
                    local!.edit,
                    style: AppTextStyle.lightGreySize16,
                  ),
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
                    labelText: local.searchPeople,
                    // controller: viewModel.editor,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(25.0, 24.0, 16.0, 0),
                child: GestureDetector(
                  onTap: () {},
                  child: MenuItemTile(
                    icon: const Icon(
                      Icons.add,
                      color: AppColors.zuriPrimaryColor,
                    ),
                    text: Text(
                      local.addPeople,
                      style: AppTextStyle.greenSize14,
                    ),
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
