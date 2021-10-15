import 'package:flutter/material.dart';
import 'package:hng/ui/shared/shared.dart';
import 'package:hng/constants/app_strings.dart';
import 'package:hng/ui/shared/text_styles.dart';
import 'package:hng/ui/shared/zuri_appbar.dart';
import 'package:hng/utilities/internalization/localization/app_localization.dart';
import 'package:stacked/stacked.dart';

import '../../../shared/colors.dart';
import 'pinned_messages_viewmodel.dart';

class PinnedMessagesView extends StatelessWidget {
  const PinnedMessagesView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final local = AppLocalization.of(context);
    return ViewModelBuilder<PinnedMessagesViewModel>.reactive(
      onModelReady: (model) => model.fetchPinnedMessages(),
      viewModelBuilder: () => PinnedMessagesViewModel(),
      initialiseSpecialViewModelsOnce: true,
      disposeViewModel: false,
      builder: (context, model, child) => Scaffold(
        appBar: ZuriAppBar(
          leadingPress: model.navigateBack,
          leading: Icons.arrow_back_ios,
          orgTitle: Text(
            local!.pinnedMessages,
            style: AppTextStyle.darkGreySize18Bold,
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
                      local.noPinnedMessages,
                      style: AppTextStyles.heading5,
                    ),
                  )
                : ListView.separated(
                    physics: const BouncingScrollPhysics(),
                    padding: const EdgeInsets.all(20.0),
                    itemCount: model.pinnedMessages.length,
                    separatorBuilder: (context, index) => const Divider(
                        height: 24.0, indent: 56.0, thickness: 1.28),
                    itemBuilder: (context, index) => ListTile(
                      leading: const ImageIcon(AssetImage(PinIcon)),
                      contentPadding: EdgeInsets.zero,
                      subtitle: Text(
                        model.pinnedMessages[index].content!,
                        style: AppTextStyles.pinnedMessageBodyStyle,
                      ),
                      title: Padding(
                        padding: const EdgeInsets.only(bottom: 8.0),
                        child: Row(
                          children: [
                            Flexible(
                              fit: FlexFit.loose,
                              child: Text(
                                model.pinnedMessages[index].displayName!,
                                style: AppTextStyles.pinnedMessageHeaderStyle,
                                maxLines: 1,
                              ),
                            ),
                            const SizedBox(width: 16.0),
                            Text(
                              model.pinnedMessages[index].moment!,
                              style: AppTextStyles.lastSeen,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
      ),
    );
  }
}
