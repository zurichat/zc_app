import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:grouped_list/grouped_list.dart';
import 'package:zurichat/models/message.dart';
import 'package:zurichat/utilities/constants/app_strings.dart';
import 'package:zurichat/ui/shared/dumb_widgets/zuri_appbar.dart';
import 'package:zurichat/ui/view/dm_user/widgets/custom_start_message.dart';
import 'package:zurichat/ui/view/dm_user/widgets/group_separator.dart';
import 'package:zurichat/ui/view/expandable_textfield/expandable_textfield_screen.dart';
import 'package:zurichat/utilities/internationalization/app_localization.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked/stacked_annotations.dart';
import '../../../utilities/constants/colors.dart';
import 'dm_user_viewmodel.dart';
import 'widgets/message_view.dart';
import 'widgets/online_indicator.dart';
import 'dm_user_view.form.dart';

@FormView(
  fields: [
    FormTextField(name: 'message'),
  ],
)
class DmUserView extends StatelessWidget with $DmUserView {
  DmUserView({Key? key}) : super(key: key);

  final _scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    final local = AppLocalization.of(context);
    //TODO remove the var below and replace with the actual id from the backend once dm's get linked to the backend
    dynamic receiverId = 'receiver';
    return ViewModelBuilder<DmUserViewModel>.reactive(
      onModelReady: (model) {
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
                channelID: '',
                hintText: '${local!.messageButton} ${model.receiver.username}',
                textController: messageController,
                sendMessage: (message, media) {
                  model.sendMessage();
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
                            Padding(
                              padding:
                                  const EdgeInsets.only(left: 16.0, top: 555),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(3),
                                    child: SizedBox(
                                      width: 70,
                                      height: 70,
                                      child: Image.asset(
                                          'assets/images/avatar.png',
                                          fit: BoxFit.fill),
                                    ),
                                  ),
                                  const SizedBox(height: 20.0),
                                  Row(
                                    children: [
                                      const OnlineIndicator(0xFF00B87C),
                                      const SizedBox(width: 16.0),
                                      Text(model.receiver.username,
                                          style: const TextStyle(
                                              fontSize: 16.0,
                                              fontWeight: FontWeight.w700)),
                                      const SizedBox(width: 8.0),
                                      Image.asset('assets/images/status.png',
                                          width: 16.67, height: 16.0)
                                    ],
                                  ),
                                  const SizedBox(height: 5),
                                  Text(model.bio,
                                      style: const TextStyle(
                                          fontSize: 14.0,
                                          fontWeight: FontWeight.w400,
                                          color: Color(0xFF3A3A3A))),
                                  const SizedBox(height: 15),
                                  StartMessage(model.receiver.username)
                                ],
                              ),
                            ),
                            GroupedListView<Message, String>(
                              shrinkWrap: true,
                              elements: model.chatMessages,
                              groupBy: (message) {
                                return message.getRelativeTime();
                              },
                              groupSeparatorBuilder: (value) {
                                return GroupSeparator(value);
                              },
                              itemBuilder: (context, message) {
                                return MessageView(message);
                              },
                              groupComparator: (groupOne, groupTwo) =>
                                  groupOne.compareTo(groupTwo),
                              itemComparator: (itemOne, itemTwo) =>
                                  itemOne.id.compareTo(itemTwo.id),
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
