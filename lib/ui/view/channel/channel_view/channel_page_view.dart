import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hng/app/app.router.dart';
import 'package:hng/constants/app_strings.dart';
import 'package:hng/general_widgets/no_connection_widget.dart';
import 'package:hng/models/channel_model.dart';
import 'package:hng/ui/shared/smart_widgets/expandable_textfield/expandable_textfield_screen.dart';
import 'package:hng/models/channel_model.dart';
import 'package:hng/ui/view/channel/channel_view/widgets/channel_intro.dart';
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
        model.fetchChannelMembers(channelId!);
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
          appBar: AppBar(
            leading: Padding(
              padding: const EdgeInsets.only(left: 5.0, right: 20.0),
              child: IconButton(
                  onPressed: model.goBack,
                  icon: const Icon(Icons.arrow_back_ios)),
            ),
            centerTitle: false,
            leadingWidth: 20,
            title: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("#$channelName", style: AppTextStyles.body1Bold),
                Text(
                  "${model.channelMembers.length} member${model.channelMembers.length == 1 ? "" : "s"}",
                  style: AppTextStyles.body2Medium,
                ),
              ],
            ),
            actions: [
              IconButton(
                  onPressed: () {
                    Navigator.pushNamed(
                      context,
                      Routes.channelSearchPageView,
                      arguments: ChannelSearchPageViewArguments(
                          channelId: channelId!,
                          channelMembers: model.usersInChannel),
                    );
                  },
                  icon: Icon(Icons.search)),
              IconButton(
                  onPressed: () {
                    // model.navigateToChannelInfoScreen(
                    //   membersCount!,
                    //   ChannelModel(id: channelId!, name: channelName!),
                    // ),
                    Navigator.pushNamed(
                      context,
                      Routes.channelInfoView,
                      arguments: ChannelInfoViewArguments(
                        numberOfMembers: membersCount!,
                        channelMembers: model.usersInChannel,
                        channelDetail:
                            ChannelModel(id: channelId!, name: channelName!),
                      ),
                    );
                  },
                  icon: Icon(Icons.info_outlined)),
            ],
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
