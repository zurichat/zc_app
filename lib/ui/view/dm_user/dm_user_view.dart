import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:grouped_list/grouped_list.dart';
import 'package:hng/ui/shared/colors.dart';
import 'package:hng/ui/view/dm_user/dm_user_viewmodel.dart';
import 'package:hng/ui/view/dm_user/dummy_data/models/message.dart';
import 'package:hng/ui/view/dm_user/icons/zap_icon.dart';
import 'package:hng/ui/view/dm_user/widgets/custom_start_message.dart';
import 'package:hng/ui/view/dm_user/widgets/custom_status.dart';
import 'package:hng/ui/view/dm_user/widgets/group_separator.dart';
import 'package:hng/ui/view/dm_user/widgets/message_view.dart';
import 'package:hng/ui/view/dm_user/widgets/online_indicator.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked/stacked_annotations.dart';

import 'dm_user_view.form.dart';

@FormView(
  fields: [
    FormTextField(name: 'message'),
  ],
)
class DmUserView extends StatelessWidget with $DmUserView {
  DmUserView({Key? key}) : super(key: key);

  final scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<DmUserViewModel>.reactive(
        onModelReady: (model) => listenToFormUpdated(model),
        viewModelBuilder: () => DmUserViewModel(),
        builder: (context, model, child) {
          debugPrint(model.hasClickedMessageField.toString());
          return Scaffold(
            backgroundColor: AppColors.whiteColor,
            appBar: AppBar(
              backgroundColor: AppColors.whiteColor,
              leading: IconButton(
                icon: const Icon(Icons.arrow_back_ios_sharp),
                iconSize: 18.0,
                color: AppColors.deepBlackColor,
                onPressed: () {
                  model.popScreen();
                },
              ),
              titleSpacing: 0.0,
              title: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      OnlineIndicator(),
                      const SizedBox(width: 4.0),
                      Text(model.receiver.username,
                          style: const TextStyle(
                              color: AppColors.deepBlackColor,
                              fontSize: 16.0,
                              fontWeight: FontWeight.w400)),
                    ],
                  ),
                  const Text(
                    'View Details',
                    style: TextStyle(
                        color: AppColors.greyishColor, fontSize: 12.0),
                  )
                ],
              ),
              actions: [
                IconButton(
                  icon: const Icon(Icons.info_outline),
                  color: AppColors.greyColor,
                  onPressed: () {},
                )
              ],
              elevation: 1.0,
            ),
            body: Stack(
              children: [
                SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
                  child: Padding(
                    padding: const EdgeInsets.only(top: 10, left: 5, right: 10),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Container(
                              padding: const EdgeInsets.only(bottom: 20.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        left: 20.0, top: 24.0),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(3),
                                          child: Container(
                                            width: 50,
                                            height: 50,
                                            child: Image.asset(
                                                'assets/images/avatar.png',
                                                fit: BoxFit.fill),
                                          ),
                                        ),
                                        const SizedBox(height: 20.0),
                                        Row(
                                          children: [
                                            OnlineIndicator(),
                                            const SizedBox(width: 7.0),
                                            Text(model.receiver.username,
                                                style: const TextStyle(
                                                    fontSize: 16.0,
                                                    fontWeight:
                                                        FontWeight.w700)),
                                            const SizedBox(width: 7.0),
                                            const CustomStatus(
                                              isActive: true,
                                              data: '5',
                                            ),
                                          ],
                                        ),
                                        const SizedBox(height: 5),
                                        Text(model.bio,
                                            style: const TextStyle(
                                                fontSize: 14.0,
                                                fontWeight: FontWeight.w400,
                                                color: AppColors.greyColor)),
                                        const SizedBox(height: 10),
                                        const StartMessage(),
                                        const SizedBox(height: 20)
                                      ],
                                    ),
                                  ),
                                  GroupedListView<Message, String>(
                                    controller: scrollController,
                                    shrinkWrap: true,
                                    elements: model.chatMessages,
                                    groupBy: (message) {
                                      return message.getRelativeTime();
                                    },
                                    groupSeparatorBuilder: (value) {
                                      return GroupSeparator(value);
                                    },
                                    itemBuilder: (context, msg) {
                                      return InkWell(
                                          onLongPress: () =>
                                              model.showButtonSheet(msg),
                                          child: MessageView(msg));
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
                      ],
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Material(
                    color: AppColors.whiteColor,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const Divider(height: 0, color: AppColors.greyishColor),
                        Row(
                          children: [
                            Expanded(
                              child: Container(
                                height: 56,
                                margin: const EdgeInsets.only(left: 13.0),
                                alignment: Alignment.centerLeft,
                                child: FocusScope(
                                  child: Focus(
                                    onFocusChange: (focus) {
                                      if (focus) {
                                        model.onTapMessageField();
                                      } else {
                                        model.onUnfocusMessageField();
                                      }
                                    },
                                    child: Flexible(
                                      fit: FlexFit.loose,
                                      child: TextField(
                                        controller: messageController,
                                        expands: true,
                                        maxLines: null,
                                        textAlignVertical:
                                            TextAlignVertical.center,
                                        decoration: InputDecoration(
                                          hintText:
                                              'Message ${model.receiver.username}',
                                          // suffixIcon: CustomStatus(isActive: true,
                                          //   data: '5'),

                                          hintStyle: const TextStyle(
                                            color: AppColors.faintTextColor,
                                            fontSize: 14.0,
                                            fontWeight: FontWeight.w400,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Visibility(
                              visible: !model.hasClickedMessageField,
                              child: Row(
                                children: [
                                  IconButton(
                                      onPressed: () {},
                                      icon: const Icon(
                                        AppIcons.shapezap,
                                        color: AppColors.zuriTextBodyColor,
                                      )),
                                  IconButton(
                                    icon: const Icon(
                                      Icons.camera_alt_outlined,
                                      color: AppColors.zuriTextBodyColor,
                                    ),
                                    onPressed: () {},
                                  ),
                                  IconButton(
                                    icon: const Icon(
                                      Icons.attach_file_sharp,
                                      color: AppColors.zuriTextBodyColor,
                                    ),
                                    onPressed: () {},
                                  )
                                ],
                              ),
                            )
                          ],
                        ),
                        Visibility(
                            visible: model.hasClickedMessageField,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    IconButton(
                                        onPressed: () {},
                                        icon: const Icon(
                                          AppIcons.shapezap,
                                          color: AppColors.zuriTextBodyColor,
                                        )),
                                    IconButton(
                                        onPressed: () {},
                                        icon: const Icon(
                                          Icons.alternate_email_outlined,
                                          color: AppColors.zuriTextBodyColor,
                                        )),
                                    IconButton(
                                        onPressed: () {},
                                        icon: const Icon(
                                          Icons.tag_faces_sharp,
                                          color: AppColors.zuriTextBodyColor,
                                        )),
                                    IconButton(
                                        onPressed: () {},
                                        icon: const Icon(
                                          Icons.camera_alt_outlined,
                                          color: AppColors.zuriTextBodyColor,
                                        )),
                                    IconButton(
                                        onPressed: () {},
                                        icon: const Icon(
                                          Icons.attach_file_outlined,
                                          color: AppColors.zuriTextBodyColor,
                                        )),
                                  ],
                                ),
                                IconButton(
                                    onPressed: () {
                                      model.sendMessage();
                                      FocusScope.of(context)
                                          .requestFocus(FocusNode());
                                      scrollController.jumpTo(scrollController
                                          .position.maxScrollExtent);
                                      // duration: Duration(milliseconds: 500),
                                      // curve: Curves.fastOutSlowIn);
                                    },
                                    icon: const Icon(
                                      Icons.send,
                                      color: AppColors.faintTextColor,
                                    ))
                              ],
                            )),
                      ],
                    ),
                  ),
                )
              ],
            ),
          );
        });
  }
}
