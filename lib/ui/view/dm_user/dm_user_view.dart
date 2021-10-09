import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:grouped_list/grouped_list.dart';
import 'package:hng/ui/shared/shared.dart';
import 'package:hng/ui/shared/zuri_appbar.dart';
import 'package:hng/ui/view/dm_user/widgets/custom_start_message.dart';
import 'package:hng/ui/view/dm_user/widgets/group_separator.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked/stacked_annotations.dart';

import '../../shared/colors.dart';
import 'dm_user_viewmodel.dart';
import 'dummy_data/models/message.dart';
import 'icons/zap_icon.dart';
import 'widgets/message_view.dart';
import 'widgets/online_indicator.dart';
import 'dm_user_view.form.dart';

//stacked forms handling
@FormView(
  fields: [
    FormTextField(name: 'messageBox'),
  ],
)
class DmUserView extends StatelessWidget with $DmUserView {
  DmUserView({Key? key}) : super(key: key);
  final _scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<DmUserViewModel>.reactive(
        //listenToFormUpdated automatically
        //syncs text from TextFields to the viewmodel
        onModelReady: (model) => listenToFormUpdated(model),
        viewModelBuilder: () => DmUserViewModel(),
        builder: (context, model, child) {
          return Scaffold(
            backgroundColor: AppColors.whiteColor,
            appBar: ZuriAppBar(
              whiteBackground: true,
              leading: Icons.arrow_back_ios_sharp,
              leadingPress: () => model.popScreen(),
              orgTitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Row(
                    children: [
                      Text(model.receiver.username,
                          style: AppTextStyles.heading7),
                      const SizedBox(width: 12.0),
                    ],
                  ),
                  const SizedBox(
                    height: 2,
                  ),
                  Text('View Details', style: AppTextStyles.subtitle)
                ],
              ),
              actions: [
                IconButton(
                  icon: const Icon(Icons.info_outline),
                  color: AppColors.darkGreyColor,
                  onPressed: () {},
                )
              ],
              onlineIndicator: true,
            ),
            body: Stack(
              children: [
                SingleChildScrollView(
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
                                          color: AppColors.darkGreyColor)),
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
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Stack(children: [
                    Material(
                      color: AppColors.whiteColor,
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          const Divider(height: 0, color: AppColors.greyColor),
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
                                      child: TextFormField(
                                        controller: messageBoxController,
                                        expands: true,
                                        maxLines: null,
                                        textAlignVertical:
                                            TextAlignVertical.center,
                                        decoration: InputDecoration.collapsed(
                                            hintText:
                                                'Message ${model.receiver.username}',
                                            hintStyle: const TextStyle(
                                                color: AppColors.greyColor,
                                                fontSize: 14.0,
                                                fontWeight: FontWeight.w400)),
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
                                          color: AppColors.greyColor,
                                        )),
                                    IconButton(
                                      onPressed: () {},
                                      icon: SvgPicture.asset(
                                        "assets/icons/fluent_camera-16-regular.svg",
                                        color: AppColors.greyColor,
                                      ),
                                      //onPressed: () {},
                                    ),
                                    IconButton(
                                      onPressed: () {},
                                      icon: SvgPicture.asset(
                                        "assets/icons/Vector.svg",
                                        color: AppColors.greyColor,
                                      ),
                                      //onPressed: () {},
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ),
                          Visibility(
                              visible: model.hasClickedMessageField,
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    children: [
                                      IconButton(
                                          onPressed: () {},
                                          icon: const Icon(
                                            AppIcons.shapezap,
                                            color: AppColors.greyColor,
                                          )),
                                      IconButton(
                                          onPressed: () {},
                                          icon: const Icon(
                                            Icons.alternate_email_outlined,
                                            color: AppColors.greyColor,
                                          )),
                                      IconButton(
                                          onPressed: () {},
                                          icon: const Icon(
                                            Icons.tag_faces_sharp,
                                            color: AppColors.greyColor,
                                          )),
                                      IconButton(
                                          onPressed: () {},
                                          icon: const Icon(
                                            Icons.camera_alt_outlined,
                                            color: AppColors.greyColor,
                                          )),
                                      IconButton(
                                          onPressed: () {},
                                          icon: const Icon(
                                            Icons.attach_file_outlined,
                                            color: AppColors.greyColor,
                                          )),
                                    ],
                                  ),
                                  GestureDetector(
                                      onTap: () async {
                                        await model.sendMessage(
                                            messageBoxController.text);
                                        FocusScope.of(context)
                                            .requestFocus(FocusNode());
                                        _scrollController.jumpTo(
                                            _scrollController
                                                .position.maxScrollExtent);
                                        messageBoxController.clear();
                                      },
                                      onLongPress: () {
                                        model.showPop();
                                      },
                                      child: const Padding(
                                        padding: EdgeInsets.all(8.0),
                                        child: Icon(
                                          Icons.send,
                                          color: AppColors.greyColor,
                                        ),
                                      )),
                                ],
                              ))
                        ],
                      ),
                    ),
                  ]),
                ),
              ],
            ),
          );
        });
  }
}
