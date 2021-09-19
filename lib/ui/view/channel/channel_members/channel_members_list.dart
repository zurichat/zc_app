import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hng/ui/shared/colors.dart';
import 'package:hng/ui/view/plugins/widgets/custom_plugin_list_tile.dart';
import 'package:stacked/stacked.dart';
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
            title: Text(
              '#teamsocrates',
              style: GoogleFonts.lato(
                  color: Color(0xFF242424),
                  fontWeight: FontWeight.bold,
                  fontSize: 20.0),
            ),
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
              Padding(
                padding: const EdgeInsets.fromLTRB(0.0, 20.0, 25.0, 0.0),
                child: InkWell(
                  child: Text(
                    'Edit',
                    style: GoogleFonts.lato(
                        color: Color(0xFF00B87C), fontSize: 16.0),
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
                    labelText: 'Search for people',
                    // controller: viewModel.editor,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(25.0, 24.0, 16.0, 0),
                child: GestureDetector(
                  onTap: () {},
                  child: CustomPluginPageListTile(
                    leadingIcon: Icon(
                      Icons.add,
                      color: AppColors.zuriPrimaryColor,
                    ),
                    text: 'Add people',
                    textColor: AppColors.zuriPrimaryColor,
                  ),
                ),
              ),
              Expanded(
                child: ListView.separated(
                  physics: BouncingScrollPhysics(),
                  padding: EdgeInsets.fromLTRB(20.0, 25.0, 12.0, 25.0),
                  itemCount: viewModel.matchingUsers.length,
                  separatorBuilder: (context, index) => SizedBox(height: 24),
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
                                    'assets/images/${viewModel.matchingUsers[index].userimg}',
                                  ),
                                ),
                                if (viewModel.matchingUsers[index].online)
                                  CircleAvatar(
                                    backgroundColor: Color(0xFF00B87C),
                                    radius: 4.0,
                                  ),
                              ],
                            ),
                            SizedBox(width: 20.0),
                            Text(
                              viewModel.matchingUsers[index].userName,
                              style: GoogleFonts.lato(
                                color: Color(0xFF424141),
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
