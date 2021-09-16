import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hng/ui/shared/colors.dart';
import 'package:hng/ui/view/plugins/widgets/custom_plugin_list_tile.dart';
import 'package:stacked/stacked.dart';
import 'package:velocity_x/velocity_x.dart';
import '../shared_widgets.dart';
import 'channel_members_list_model.dart';

class ChannelMembersList extends StatelessWidget {
  const ChannelMembersList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<ChannelMembersModel>.reactive(
        viewModelBuilder: () => ChannelMembersModel(),
        builder: (context, viewModel, child) {
          return Scaffold(
            appBar: AppBar(
              title: '#teamsocrates'
                  .text
                  .textStyle(GoogleFonts.lato())
                  .color(Color(0xFF242424))
                  .bold
                  .size(20.0)
                  .make(),
              backgroundColor: Colors.white,
              elevation: 1.5,
              leading: IconButton(
                icon: Icon(
                  Icons.clear,
                  color: Color(0xFF333333),
                  // size: 24,
                ),
                padding: EdgeInsets.only(left: 18),
                onPressed: () {},
                iconSize: 25.0,
              ),
              actions: [
                InkWell(
                  child: 'Edit'
                      .text
                      .textStyle(GoogleFonts.lato())
                      .color(Color(0xFF00B87C))
                      .size(16.0)
                      .make(),
                  highlightColor: Colors.transparent,
                  splashColor: Colors.transparent,
                  onTap: () {},
                ).pLTRB(0.0, 20.0, 25.0, 0.0),
              ],
            ),
            body: Column(
              children: [
                Card(
                  shadowColor: Colors.black,
                  elevation: 4,
                  child: SearchField(
                    onChanged: viewModel.onSearchUser,
                    labelText: 'Search for people',
                    // controller: viewModel.editor,
                  ),
                ).pLTRB(25.0, 16.0, 25.0, 0),
                GestureDetector(
                  onTap: () {},
                  child: CustomPluginPageListTile(
                    leadingIcon: Icon(
                      Icons.add,
                      color: AppColors.zuriPrimaryColor,
                    ),
                    text: 'Add people',
                    textColor: AppColors.zuriPrimaryColor,
                  ),
                ).pLTRB(25.0, 24.0, 16.0, 0),
                ListView.separated(
                  physics: BouncingScrollPhysics(),
                  padding: EdgeInsets.fromLTRB(20.0, 25.0, 12.0, 25.0),
                  itemCount: viewModel.matchingUsers.length,
                  separatorBuilder: (context, index) => 24.heightBox,
                  itemBuilder: (context, index) => Row(
                    children: [
                      Row(
                        children: [
                          Stack(
                            alignment: Alignment.topRight,
                            children: [
                              Image.asset(
                                      'assets/images/${viewModel.matchingUsers[index].userimg}')
                                  .p(4.0),
                              if (viewModel.matchingUsers[index].online)
                                CircleAvatar(
                                  backgroundColor: Color(0xFF00B87C),
                                  radius: 4.0,
                                ),
                            ],
                          ),
                          20.widthBox,
                          viewModel.matchingUsers[index].userName.text
                              .textStyle(GoogleFonts.lato())
                              .color(Color(0xFF424141))
                              .make(),
                        ],
                      ).expand(),
                    ],
                  ),
                ).expand(),
              ],
            ),
          );
        });
  }
}
