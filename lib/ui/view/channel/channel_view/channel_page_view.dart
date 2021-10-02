import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hng/constants/app_strings.dart';
import 'package:hng/models/channel_model.dart';
import 'package:hng/ui/shared/smart_widgets/expandable_textfield/expandable_textfield_screen.dart';
import 'package:hng/ui/view/channel/channel_view/widgets/channel_intro.dart';
import 'package:stacked/stacked.dart';
import '../../../shared/shared.dart';

import 'channel_page_viewmodel.dart';
import 'widgets/channel_chat.dart';

class ChannelPageView extends StatelessWidget {
  const ChannelPageView({
    Key? key,
    required this.channelname,
    required this.channelId,
    required this.membersCount,
    required this.public,
  }) : super(key: key);
  final String? channelname;
  final String? channelId;
  final int? membersCount;
  final bool? public;

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<ChannelPageViewModel>.reactive(
      onModelReady: (model) {
        model.initialise('$channelId');
      },
      //this parameter allows us to reuse the view model to persist the state

      viewModelBuilder: () => ChannelPageViewModel(),
      builder: (context, model, child) {
        return Scaffold(
          appBar: AppBar(
            leading: Padding(
              padding: const EdgeInsets.only(left: 5),
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
                Text("#$channelname", style: AppTextStyles.body1Bold),
                Text(
                  "$membersCount members",
                  style: AppTextStyles.body2Medium,
                ),
              ],
            ),
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
                    ChannelModel(id: channelId!, name: channelname!),
                  ),
                  icon: const Icon(Icons.info_outlined),
                ),
              ),
            ],
          ),
          body: ExpandableTextFieldScreen(
            hintText: AddReply,
            sendMessage: (val) => model.sendMessage(val, channelId!),
            widget: SingleChildScrollView(
              reverse: true,
              controller: model.scrollController,
              child: Column(
                children: [
                  ChannelIntro(
                    channelName: channelname,
                  ),
                  ChannelChat(
                    channelId: channelId,
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
