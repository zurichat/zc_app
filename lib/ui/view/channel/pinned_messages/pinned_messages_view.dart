import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:zurichat/constants/app_strings.dart';
import 'package:zurichat/ui/shared/shared.dart';
import 'package:zurichat/ui/shared/zuri_appbar.dart';
import 'package:stacked/stacked.dart';

import '../../../shared/colors.dart';
import 'pinned_messages_viewmodel.dart';

class PinnedMessagesView extends StatelessWidget {
  const PinnedMessagesView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) =>
      ViewModelBuilder<PinnedMessagesViewModel>.reactive(
        onModelReady: (model) => model.fetchPinnedMessages(),
        viewModelBuilder: () => PinnedMessagesViewModel(),
        initialiseSpecialViewModelsOnce: true,
        disposeViewModel: false,
        builder: (context, model, child) => Scaffold(
          appBar: ZuriAppBar(
            leadingPress: model.navigateBack,
            leading: Icons.arrow_back_ios,
            orgTitle: Text(
              PinnedMessages,
              style: AppTextStyles.heading7,
            ),
            whiteBackground: true,
          ),
          body: model.isBusy
              ? const Center(
                  child: CircularProgressIndicator(
                      valueColor:
                          AlwaysStoppedAnimation(AppColors.zuriPrimaryColor)),
                )
              : model.pinnedMessages.isEmpty
                  ? Center(
                      child: Text(
                        NoPinnedMessagesYet,
                        style: GoogleFonts.lato(
                          color: AppColors.deepBlackColor,
                          fontSize: 16.0,
                        ),
                      ),
                    )
                  : ListView.separated(
                      physics: const BouncingScrollPhysics(),
                      padding: const EdgeInsets.all(20.0),
                      itemCount: model.pinnedMessages.length,
                      separatorBuilder: (context, index) => const Divider(
                          height: 24.0, indent: 56.0, thickness: 1.28),
                      itemBuilder: (context, index) => ListTile(
                        leading:
                            const ImageIcon(AssetImage(PinIcon), size: 24.0),
                        contentPadding: EdgeInsets.zero,
                        subtitle: Text(
                          model.pinnedMessages[index].content!,
                          style: GoogleFonts.lato(
                              color: AppColors.zuriTextColorHeader,
                              fontSize: 14.0),
                        ),
                        title: SingleChildScrollView(
                          physics: const BouncingScrollPhysics(),
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            children: [
                              Text(
                                model.pinnedMessages[index].displayName!,
                                style: GoogleFonts.lato(
                                    color: AppColors.deepGreyColor,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16.0),
                              ),
                              const SizedBox(width: 24.0),
                              Text(
                                model.pinnedMessages[index].moment!,
                                style: GoogleFonts.lato(
                                    color: AppColors.greyColor, fontSize: 12.0),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
        ),
      );
}
