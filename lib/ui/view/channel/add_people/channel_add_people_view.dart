import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
<<<<<<< HEAD
import 'package:hng/general_widgets/custom_textfield.dart';
=======
import 'package:hng/ui/shared/shared.dart';
import 'package:hng/constants/app_strings.dart';
>>>>>>> 27b220edd02f02675705eb2ffddcc00c105a592a
import 'package:stacked/stacked.dart';

import '../../../shared/colors.dart';
import 'channel_add_people_viewmodel.dart';

class ChannelAddPeopleView extends StatelessWidget {
  const ChannelAddPeopleView(
      {Key? key, required this.channelId, required this.channelName})
      : super(key: key);

  final String channelName;
  final String channelId;

  @override
  Widget build(BuildContext context) =>
      ViewModelBuilder<ChannelAddPeopleViewModel>.reactive(
        onModelReady: (model) => model.fetchOrganizationMembers(),
        viewModelBuilder: () => ChannelAddPeopleViewModel(),
        initialiseSpecialViewModelsOnce: true,
        disposeViewModel: false,
        builder: (context, viewModel, child) => Scaffold(
          resizeToAvoidBottomInset: false,
          appBar: AppBar(
            title: Text(
              viewModel.markedUsers.isNotEmpty
                  ? '${viewModel.markedUsers.length} selected'
                  : AddPeople,
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
              onPressed: viewModel.navigateBack,
              iconSize: 32.0,
            ),
            actions: [
              viewModel.isBusy
                  ? Padding(
                      padding: const EdgeInsets.fromLTRB(0.0, 12.0, 20.0, 12.0),
                      child: Transform.scale(
                        child: const CircularProgressIndicator(
                            valueColor: AlwaysStoppedAnimation(
                                AppColors.zuriPrimaryColor)),
                        scale: 0.512,
                      ),
                    )
                  : Padding(
                      padding: const EdgeInsets.fromLTRB(0.0, 16.0, 20.0, 0.0),
                      child: InkWell(
                        child: Text(
                          Add,
                          style: GoogleFonts.lato(
                              color: AppColors.zuriPrimaryColor,
                              fontSize: 16.0),
                        ),
                        highlightColor: Colors.transparent,
                        splashColor: Colors.transparent,
                        onTap: () =>
                            viewModel.addMarkedUsersToChannel(channelId),
                      ),
                    ),
            ],
          ),
          body: Column(
            children: [
<<<<<<< HEAD
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
=======
              if (viewModel.users.isNotEmpty && !viewModel.isBusy) ...[
                const SizedBox(height: 24.0),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: SearchField(
                    onChanged: viewModel.onSearchUser,
                    labelText: SearchPeople,
                  ),
                ),
                if (viewModel.matchingUsers.isNotEmpty &&
                    !viewModel.isBusy) ...[
                  const SizedBox(height: 16.0),
                  const Divider(thickness: 2.0),
                  const SizedBox(height: 16.0),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(20.0, 0.0, 12.0, 0.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
>>>>>>> 27b220edd02f02675705eb2ffddcc00c105a592a
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              AddEveryone,
                              style: GoogleFonts.lato(
                                color: AppColors.deepBlackColor,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(height: 4.0),
                            Text(
                              EveryoneWillBeAdded,
                              style: GoogleFonts.lato(
                                color: AppColors.greyishColor,
                                fontWeight: FontWeight.bold,
                                fontSize: 12.0,
                              ),
                            ),
                          ],
                        ),
                        Transform.scale(
                          child: Checkbox(
                            onChanged: viewModel.onMarkAll,
                            side: const BorderSide(width: 0.96),
                            value: viewModel.allMarked,
                          ),
                          scale: 1.512,
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 16.0),
                  const Divider(thickness: 2.0),
                ]
              ],
              Expanded(
                child: viewModel.users.isEmpty
                    ? const Center(
                        child: CircularProgressIndicator(
                            valueColor: AlwaysStoppedAnimation(
                                AppColors.zuriPrimaryColor)),
                      )
                    : viewModel.isBusy
                        ? Center(
                            child: Text(
                              'Adding Marked Users...',
                              style: GoogleFonts.lato(
                                color: AppColors.deepBlackColor,
                                fontWeight: FontWeight.bold,
                                fontSize: 16.0,
                              ),
                            ),
                          )
                        : ListView.separated(
                            physics: const BouncingScrollPhysics(),
                            shrinkWrap: true,
                            padding: const EdgeInsets.fromLTRB(
                                20.0, 25.0, 12.0, 25.0),
                            itemCount: viewModel.matchingUsers.length,
                            separatorBuilder: (context, index) =>
                                const SizedBox(height: 24.0),
                            itemBuilder: (context, index) => ListTile(
                              onTap: () => viewModel.markOne(
                                  !viewModel.markedUsers
                                      .contains(viewModel.matchingUsers[index]),
                                  index),
                              contentPadding: EdgeInsets.zero,
                              leading: CircleAvatar(
                                backgroundColor: AppColors.whiteColor,
                                backgroundImage: viewModel
                                        .matchingUsers[index].imageUrl!
                                        .startsWith("http")
                                    ? NetworkImage(
                                        '${viewModel.matchingUsers[index].imageUrl}',
                                      ) as dynamic
                                    : const AssetImage(
                                        "assets/images/user.png"),
                                radius: 20.0,
                              ),
                              trailing: Transform.scale(
                                child: Checkbox(
                                  value: viewModel.markedUsers
                                      .contains(viewModel.matchingUsers[index]),
                                  onChanged: (marked) =>
                                      viewModel.markOne(marked, index),
                                  side: const BorderSide(width: 0.96),
                                ),
                                scale: 1.512,
                              ),
                              title: Text(
                                "${viewModel.matchingUsers[index].userName}",
                                style: GoogleFonts.lato(
                                    color: AppColors.zuriTextBodyColor),
                              ),
                            ),
                          ),
              ),
            ],
          ),
        ),
      );
}
