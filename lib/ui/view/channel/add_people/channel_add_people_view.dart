import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:zurichat/utilities/constants/app_strings.dart';
import 'package:zurichat/utilities/constants/text_styles.dart';
import 'package:zurichat/ui/shared/dumb_widgets/zuri_appbar.dart';
import 'package:zurichat/ui/shared/dumb_widgets/zuri_loader.dart';
import 'package:zurichat/utilities/internationalization/app_localization.dart';
import 'package:stacked/stacked.dart';

import '../../../../utilities/constants/colors.dart';
import '../shared_widgets.dart';
import 'channel_add_people_viewmodel.dart';

class ChannelAddPeopleView extends StatelessWidget {
  const ChannelAddPeopleView(
      {Key? key, required this.channelId, required this.channelName})
      : super(key: key);

  final String channelName;
  final String channelId;

  @override
  Widget build(BuildContext context) {
    final local = AppLocalization.of(context);
    return ViewModelBuilder<ChannelAddPeopleViewModel>.reactive(
      onModelReady: (model) => model.fetchOrganizationMembers(),
      viewModelBuilder: () => ChannelAddPeopleViewModel(),
      initialiseSpecialViewModelsOnce: true,
      disposeViewModel: false,
      builder: (context, viewModel, child) => Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: ZuriAppBar(
          orgTitle: Text(
            viewModel.markedUsers.isNotEmpty
                ? '${viewModel.markedUsers.length} ${local!.selected}'
                : AddPeople,
            style: AppTextStyle.darkGreySize20Bold,
          ),
          whiteBackground: true,
          leading: Icons.clear,
          leadingPress: () => viewModel.navigateBack(),
          actions: [
            viewModel.isBusy
                ? const ZuriLoader()
                : Padding(
                    padding: const EdgeInsets.fromLTRB(0.0, 16.0, 20.0, 0.0),
                    child: InkWell(
                      highlightColor: Colors.transparent,
                      splashColor: Colors.transparent,
                      onTap: () => viewModel.addMarkedUsersToChannel(channelId),
                      child: Text(
                        Add,
                        style: GoogleFonts.lato(
                            color: AppColors.zuriPrimaryColor, fontSize: 16.0),
                      ),
                    ),
                  ),
          ],
        ),
        body: Column(
          children: [
            if (viewModel.users.isNotEmpty && !viewModel.isBusy) ...[
              const SizedBox(height: 24.0),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: SearchField(
                  onChanged: viewModel.onSearchUser,
                  labelText: local!.searchPeople,
                ),
              ),
              if (viewModel.matchingUsers.isNotEmpty && !viewModel.isBusy) ...[
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
                            local.addEveryone,
                            style: GoogleFonts.lato(
                              color: AppColors.deepBlackColor,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 4.0),
                          Text(
                            local.everyoneWillBeAdded,
                            style: GoogleFonts.lato(
                              color: AppColors.greyishColor,
                              fontWeight: FontWeight.bold,
                              fontSize: 12.0,
                            ),
                          ),
                        ],
                      ),
                      Transform.scale(
                        scale: 1.512,
                        child: Checkbox(
                          onChanged: viewModel.onMarkAll,
                          side: const BorderSide(width: 0.96),
                          value: viewModel.allMarked,
                        ),
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
                  ? const Center(child: ZuriLoader())
                  : viewModel.isBusy
                      ? Center(
                          child: Text(
                            local!.addingMarkedUsers,
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
                          padding:
                              const EdgeInsets.fromLTRB(20.0, 25.0, 12.0, 25.0),
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
                                  : const AssetImage("assets/images/user.png"),
                              radius: 20.0,
                            ),
                            trailing: Transform.scale(
                              scale: 1.512,
                              child: Checkbox(
                                value: viewModel.markedUsers
                                    .contains(viewModel.matchingUsers[index]),
                                onChanged: (marked) =>
                                    viewModel.markOne(marked, index),
                                side: const BorderSide(width: 0.96),
                              ),
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
}
