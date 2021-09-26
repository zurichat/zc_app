import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:stacked/stacked.dart';

import '../../../shared/colors.dart';
import '../shared_widgets.dart';
import 'channel_add_people_viewmodel.dart';

class ChannelAddPeopleView extends StatelessWidget {
  const ChannelAddPeopleView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) =>
      ViewModelBuilder<ChannelAddPeopleViewModel>.reactive(
        viewModelBuilder: () => ChannelAddPeopleViewModel(),
        initialiseSpecialViewModelsOnce: true,
        disposeViewModel: false,
        builder: (context, viewModel, child) => Scaffold(
          appBar: AppBar(
            title: Text(
              'Add People',
              style: GoogleFonts.lato(
                  color: AppColors.zuriTextColorHeader,
                  fontWeight: FontWeight.bold,
                  fontSize: 20.0),
            ),
            backgroundColor: Colors.white,
            leading: IconButton(
              icon: const Icon(
                Icons.clear,
                color: AppColors.deepBlackColor,
                size: 24.0,
              ),
              padding: EdgeInsets.zero,
              onPressed: () {},
              iconSize: 32.0,
            ),
            actions: [
              Padding(
                padding: const EdgeInsets.fromLTRB(0.0, 16.0, 20.0, 0.0),
                child: InkWell(
                  child: Text(
                    'Add',
                    style: GoogleFonts.lato(
                        color: AppColors.zuriPrimaryColor, fontSize: 16.0),
                  ),
                  highlightColor: Colors.transparent,
                  splashColor: Colors.transparent,
                  onTap: () {},
                ),
              ),
            ],
          ),
          body: Column(
            children: [
              SizedBox(height: 24.0),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.0),
                child: SearchField(
                  onChanged: viewModel.onSearchUser,
                  labelText: 'Search people to add',
                  // controller: viewModel.editor,
                ),
              ),
              SizedBox(height: 16.0),
              Divider(thickness: 2.0),
              SizedBox(height: 16.0),
              Padding(
                padding: EdgeInsets.fromLTRB(20.0, 0.0, 12.0, 0.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Add Everyone',
                          style: GoogleFonts.lato(
                            color: Color(0xFF242424),
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 4.0),
                        Text(
                          'Everyone will be added to this channel',
                          style: GoogleFonts.lato(
                            color: AppColors.greyishColor,
                            fontWeight: FontWeight.bold,
                            fontSize: 12.0,
                          ),
                        ),
                      ],
                    ),
                    Checkbox(
                      onChanged: viewModel.onMarkAll,
                      side: BorderSide(width: 0.96),
                      value: viewModel.allMarked,
                    ),
                  ],
                ),
              ),
              SizedBox(height: 16.0),
              Divider(thickness: 2.0),
              ListView.separated(
                physics: BouncingScrollPhysics(),
                shrinkWrap: true,
                padding: EdgeInsets.fromLTRB(20.0, 25.0, 12.0, 25.0),
                itemCount: viewModel.matchingUsers.length,
                separatorBuilder: (context, index) => SizedBox(height: 24.0),
                itemBuilder: (context, index) => Row(
                  children: [
                    Row(
                      children: [
                        Stack(
                          alignment: Alignment.topRight,
                          children: [
                            Padding(
                              padding: EdgeInsets.all(4.0),
                              child: Image.asset(
                                'assets/images/${viewModel.matchingUsers[index].userimg}',
                              ),
                            ),
                            if (viewModel.matchingUsers[index].online)
                              CircleAvatar(
                                backgroundColor: AppColors.zuriPrimaryColor,
                                radius: 4.0,
                              ),
                          ],
                        ),
                        SizedBox(width: 20.0),
                        Text(
                          viewModel.matchingUsers[index].userName,
                          style: GoogleFonts.lato(
                              color: AppColors.zuriTextBodyColor),
                        ),
                      ],
                    ),
                    Spacer(),
                    Checkbox(
                      value: viewModel.markedUsers
                          .contains(viewModel.matchingUsers[index]),
                      onChanged: (marked) => viewModel.onMarkOne(marked, index),
                      side: BorderSide(width: 0.96),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      );
}
