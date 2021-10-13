import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:zurichat/constants/app_strings.dart';
import 'package:zurichat/general_widgets/no_connection_widget.dart';
import 'package:zurichat/models/channel_model.dart';
import 'package:zurichat/ui/shared/smart_widgets/expandable_textfield/expandable_textfield_screen.dart';
import 'package:zurichat/ui/shared/zuri_appbar.dart';
import 'package:zurichat/ui/view/channel/channel_view/widgets/channel_intro.dart';
import 'package:stacked/stacked.dart';
import '../../../shared/shared.dart';

import 'channel_page_viewmodel.dart';
import 'widgets/channel_chat.dart';

class ChannelPageView extends StatelessWidget {
  const ChannelPageView({
    Key? key,
    required this.channelName,
    required this.channelId,
    required this.membersCount,
    required this.public,
  }) : super(key: key);
  final String? channelName;
  final String? channelId;
  final int? membersCount;
  final bool? public;

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<ChannelPageViewModel>.reactive(
      onModelReady: (model) {
        model.initialise('$channelId');
        model.showNotificationForOtherChannels('$channelId', '$channelName');
      },
      //this parameter allows us to reuse the view model to persist the state
      viewModelBuilder: () => ChannelPageViewModel(),
      builder: (context, model, child) {
        if (model.scrollController.hasClients) {
          model.scrollController
              .jumpTo(model.scrollController.position.maxScrollExtent);
        }

        return Scaffold(
          backgroundColor: AppColors.whiteColor,
          appBar: ZuriAppBar(
            leading: Icons.arrow_back_ios,
            leadingPress: () => model.goBack(),
            whiteBackground: true,
            actions: [
              IconButton(
                onPressed: () {},
                icon: const Icon(Icons.search),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 5),
                child: IconButton(
                  onPressed: () => model.navigateToChannelInfoScreen(
                    membersCount!,
                    ChannelModel(id: channelId!, name: channelName!),
                  ),
                  icon: const Icon(Icons.info_outlined),
                ),
              ),
            ],
            title: "#$channelName",
            subtitle:
                "${model.channelMembers.length} member${model.channelMembers.length == 1 ? "" : "s"}",
          ),
          body: ExpandableTextFieldScreen(
            hintText: AddReply,
            sendMessage: model.sendMessage,
            widget: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              controller: model.scrollController,
              reverse: true,
              child: Column(
                children: [
                  ChannelIntro(
                    channelName: channelName!,
                    channelId: channelId!,
                  ),
                  ChannelChat(
                    channelId: channelId,
                  ),
                  const NoConnectionWidget(Icons.wifi),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
