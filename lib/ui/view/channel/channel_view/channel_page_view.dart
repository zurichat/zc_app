import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hng/constants/app_strings.dart';
import 'package:hng/general_widgets/no_connection_widget.dart';
import 'package:hng/models/channel_model.dart';
import 'package:hng/ui/shared/smart_widgets/expandable_textfield/expandable_textfield_screen.dart';
import 'package:hng/ui/view/channel/channel_view/widgets/channel_intro.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked/stacked_annotations.dart';
import '../../../shared/shared.dart';

import 'channel_page_viewmodel.dart';
import 'widgets/channel_chat.dart';
import 'channel_page_view.form.dart';

@FormView(
  fields: [
    FormTextField(name: 'channelMessages'),
  ],
)

class ChannelPageView extends StatelessWidget with $ChannelPageView {
  ChannelPageView({
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
        model.getDraft(channelId);
        model.initialise('$channelId');
        if(model.storedDraft.isNotEmpty){
          channelMessagesController.text = model.storedDraft;
        }
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
                  onPressed: (){
                    model.goBack(channelId, channelMessagesController.text,
                        channelName, membersCount, public);
                    },
                  icon: const Icon(Icons.arrow_back_ios)),
            ),
            centerTitle: false,
            leadingWidth: 40,
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
                  },
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
          ),
          body: ExpandableTextFieldScreen(
            textController: channelMessagesController,
            hintText: AddReply,
            sendMessage: (val) => model.sendMessage(val, channelId!),
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
