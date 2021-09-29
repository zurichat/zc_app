import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hng/general_widgets/custom_textfield.dart';
import 'package:stacked/stacked.dart';

import '../../../shared/colors.dart';
import 'channel_add_people_viewmodel.dart';

class ChannelAddPeopleView extends StatelessWidget {
  const ChannelAddPeopleView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) =>
      ViewModelBuilder<ChannelAddPeopleViewModel>.reactive(
        viewModelBuilder: () => ChannelAddPeopleViewModel(),
        onModelReady: (model) => model.onFetchMembers(),
        initialiseSpecialViewModelsOnce: true,
        disposeViewModel: false,
        builder: (context, viewModel, child) => Scaffold(
          resizeToAvoidBottomInset: false,
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
              onPressed: viewModel.navigateBack(),
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
                  onTap: () => viewModel.onAddButtonTap(),
                ),
              ),
            ],
          ),
          body: Column(
            children: [
              const SizedBox(height: 24.0),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: CustomTextField(
                  keyboardType: TextInputType.text,
                  maxlines: null,
                  inputAction: TextInputAction.search,
                  autoCorrect: false,
                  obscureText: false,
                  border: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Color(0xFF7B8794),
                      width: 0.2,
                    ),
                  ),
                  onChanged:viewModel.onSearchUser,
                  contentPadding: const EdgeInsets.fromLTRB(12.0, 16.0, 12.0, 16.0),
                  labelText: 'Search people to add',
                  labelStyle: GoogleFonts.lato(color: const Color(0xFF727272)),
                  style: GoogleFonts.lato(
                    color: const Color(0xFF7B8794),
                    fontSize: 16.0,
                  ),
                ),

                 //SearchField(
                //   onChanged: viewModel.onSearchUser,
                //   labelText: 'Search people to add',
                //   // controller: viewModel.editor,
                // ),

// TextField(
//         cursorColor: const Color(0xFF7B8794),
//         decoration: InputDecoration(
//           labelStyle: GoogleFonts.lato(color: const Color(0xFF727272)),
//           contentPadding: const EdgeInsets.fromLTRB(12.0, 16.0, 12.0, 16.0),
//           alignLabelWithHint: true,
//           enabledBorder: OUTLINE,
//           focusedBorder: OUTLINE,
//           labelText: labelText,
//           border: OUTLINE,
//         ),
//         onChanged: onChanged,
//         style: GoogleFonts.lato(
//           color: const Color(0xFF7B8794),
//           fontSize: 16.0,
//         ),
//       );
              ),
              const SizedBox(height: 16.0),
              const Divider(thickness: 2.0),
              const SizedBox(height: 16.0),
              Padding(
                padding: const EdgeInsets.fromLTRB(20.0, 0.0, 12.0, 0.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Add Everyone',
                          style: GoogleFonts.lato(
                            //TODO change color to brand
                            color: const Color(0xFF242424),
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 4.0),
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
                      side: const BorderSide(width: 0.96),
                      value: viewModel.allMarked,
                    ),
                  ],
                ),
              ),

              SizedBox(height: 16.0),
              Divider(thickness: 2.0),
              Expanded(
                child: ListView.separated(
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
                                child: viewModel.matchingUsers[index].imageUrl!.startsWith("http")? Image.network(
                                  '${viewModel.matchingUsers[index].imageUrl}',
                                ):Container(

                                ),
                              ),
                              // if (viewModel.matchingUsers[index].)
                              //   CircleAvatar(
                              //     backgroundColor: AppColors.zuriPrimaryColor,
                              //     radius: 4.0,
                              //   ),
                            ],
                          ),
                          SizedBox(width: 20.0),
                          Text(
                            "${viewModel.matchingUsers[index].userName}",
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
                  )
                ),
              ),
            ],
          ),
        ),
      );
}
