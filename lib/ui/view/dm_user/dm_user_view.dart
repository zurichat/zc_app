import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:zurichat/models/user_post.dart';
import 'package:zurichat/ui/shared/smart_widgets/thread_card/thread_card_view.dart';
import 'package:zurichat/utilities/constants/app_strings.dart';
import 'package:zurichat/ui/shared/dumb_widgets/zuri_appbar.dart';
import 'package:zurichat/ui/view/expandable_textfield/expandable_textfield_screen.dart';
import 'package:zurichat/utilities/constants/text_styles.dart';
import 'package:zurichat/utilities/internationalization/app_localization.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked/stacked_annotations.dart';
import '../../../utilities/constants/colors.dart';
import 'dm_user_viewmodel.dart';
import 'package:zurichat/app/app.logger.dart';
import 'widgets/dm_top_bar.dart';
import 'dm_user_view.form.dart';

@FormView(
  fields: [
    FormTextField(name: 'message'),
  ],
)
class DmUserView extends StatelessWidget with $DmUserView {
  DmUserView({Key? key, required this.friendID}) : super(key: key);
  final String friendID;

  final _scrollController = ScrollController();

  final log = getLogger("DmUserView");
  @override
  Widget build(BuildContext context) {
    final bool _dark = Theme.of(context).brightness == Brightness.dark;
    final local = AppLocalization.of(context);
    //TODO remove the var below and replace with the actual id from the backend once dm's get linked to the backend
    dynamic receiverId = 'receiver';
    return ViewModelBuilder<DmUserViewModel>.reactive(
      onModelReady: (model) {
        model.initialiseRoom(friendID);
        model.getDraft(receiverId);
        if (model.storedDraft.isNotEmpty) {
          messageController.text = model.storedDraft;
        }
        return listenToFormUpdated(model);
      },
      viewModelBuilder: () => DmUserViewModel(),
      builder: (context, model, child) {
        return Scaffold(
          appBar: ZuriAppBar(
              leading: Icons.arrow_back_ios,
              leadingPress: () =>
                  model.popScreens(receiverId, messageController.text),
              title: model.receiver.username,
              subtitle: ViewDetails,
              actions: [
                IconButton(
                  icon: const Icon(Icons.info_outline,
                      color: AppColors.greyColor),
                  onPressed: () {},
                ),
              ],
              isDarkMode: Theme.of(context).brightness == Brightness.dark,
              onlineIndicator: true,
              whiteBackground: true),
          body: Stack(
            children: [
              ExpandableTextFieldScreen(
                channelID: DmTitle,
                hintText: '${local!.messageButton} ${model.receiver.username}',
                textController: messageController,
                sendMessage: (message, media) {
                  model.sendMessage(message);
                  FocusScope.of(context).requestFocus(FocusNode());
                  _scrollController
                      .jumpTo(_scrollController.position.maxScrollExtent);
                },
                widget: SingleChildScrollView(
                  controller: _scrollController,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const Divider(height: 0, color: AppColors.greyishColor),
                      Container(
                        padding: const EdgeInsets.only(bottom: 80.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const DMTopBar(),
                            ListView.builder(
                              physics: const NeverScrollableScrollPhysics(),
                              shrinkWrap: true,
                              itemCount: model.dmUserMessage.length,
                              itemBuilder: (context, index) {
                                final message = model.dmUserMessage[index];
                                UserPost userPost = UserPost(
                                    displayName: message.senderID,
                                    message: message.message,
                                    channelId: message.roomID.toString(),
                                    id: message.messageID,
                                    postEmojis: []);
                                return InkWell(
                                  child: Container(
                                    padding: const EdgeInsets.only(top: 20.0),
                                    child: Column(
                                      children: [
                                        if (userPost.pinned) ...[
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                left: 40.0),
                                            child: Row(
                                              children: [
                                                const Icon(Icons.push_pin,
                                                    size: 16.0,
                                                    color: Colors.orange),
                                                const SizedBox(width: 12.0),
                                                Text(
                                                  local.pinned,
                                                  style: AppTextStyle
                                                      .lightGreySize14,
                                                ),
                                              ],
                                            ),
                                          ),
                                          const SizedBox(height: 8.0),
                                        ],
                                        ThreadCardView.threadChannelMain(
                                            userPost),
                                      ],
                                    ),
                                    color: userPost.pinned
                                        ? _dark
                                            ? AppColors.deepBlackColor
                                            : AppColors.lightYellow
                                        : Colors.transparent,
                                  ),
                                  onLongPress: () => log.i('Long Pressesd'),
                                  onTap: () {
                                    log.i('Tap');
                                  },
                                );
                              },
                            ),
                            const SizedBox(height: 40)
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
