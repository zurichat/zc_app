import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:stacked/stacked.dart';
import 'package:velocity_x/velocity_x.dart';

import 'channel_add_people_viewmodel.dart';
import 'shared_widgets.dart';

class ChannelAddPeopleView extends StatelessWidget {
  const ChannelAddPeopleView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) =>
      ViewModelBuilder<ChannelAddPeopleViewModel>.reactive(
        viewModelBuilder: () => ChannelAddPeopleViewModel(),
        builder: (context, viewModel, child) => Scaffold(
          appBar: AppBar(
            title: 'Add People'
                .text
                .textStyle(GoogleFonts.lato())
                .color(Color(0xFF242424))
                .bold
                .size(20.0)
                .make(),
            backgroundColor: Colors.white,
            leading: IconButton(
              icon: const Icon(Icons.add, color: Color(0xFF333333)).rotate(45),
              padding: EdgeInsets.zero,
              onPressed: () {},
              iconSize: 32.0,
            ),
            actions: [
              InkWell(
                child: 'Add'
                    .text
                    .textStyle(GoogleFonts.lato())
                    .color(Color(0xFF00B87C))
                    .size(16.0)
                    .make(),
                highlightColor: Colors.transparent,
                splashColor: Colors.transparent,
                onTap: () {},
              ).pLTRB(0.0, 16.0, 20.0, 0.0),
            ],
          ),
          body: Column(
            children: [
              24.heightBox,
              SearchField(
                onChanged: viewModel.onSearchUser,
                labelText: 'Search people to add',
                // controller: viewModel.editor,
              ).pSymmetric(h: 20.0),
              16.heightBox,
              Divider(thickness: 2.0),
              16.heightBox,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      'Add Everyone'
                          .text
                          .bold
                          .textStyle(GoogleFonts.lato())
                          .color(Color(0xFF242424))
                          .make(),
                      4.heightBox,
                      'Everyone will be added to this channel'
                          .text
                          .textStyle(GoogleFonts.lato())
                          .color(Color(0xFF999999))
                          .size(12.0)
                          .make(),
                    ],
                  ),
                  Checkbox(
                    onChanged: viewModel.onMarkAll,
                    side: BorderSide(width: 0.96),
                    value: viewModel.allMarked,
                  ).scale(scaleValue: 1.512),
                ],
              ).pLTRB(20.0, 0.0, 12.0, 0.0),
              16.heightBox,
              Divider(thickness: 2.0),
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
                    Checkbox(
                      value: viewModel.markedUsers
                          .contains(viewModel.matchingUsers[index]),
                      onChanged: (marked) => viewModel.onMarkOne(marked, index),
                      side: BorderSide(width: 0.96),
                    ).scale(scaleValue: 1.512),
                  ],
                ),
              ).expand(),
            ],
          ),
        ),
        initialiseSpecialViewModelsOnce: true,
        disposeViewModel: false,
      );
}
