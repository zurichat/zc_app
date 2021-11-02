import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:zurichat/utilities/constants/app_strings.dart';
import 'package:zurichat/utilities/constants/colors.dart';
import 'package:zurichat/ui/view/channel/channel_view/widgets/check_user.dart';
import 'package:zurichat/ui/view/expandable_textfield/widget/user_mentions.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked/stacked_annotations.dart';
import 'expandable_textfield_screen_viewmodel.dart';
import 'widget/my_textfield.dart';

//stacked forms handling
@FormView(
  fields: [
    FormTextField(name: 'text'),
  ],
)
class ExpandableTextFieldScreen extends HookWidget {
  ExpandableTextFieldScreen(
      {Key? key,
      required this.widget,
      required this.sendMessage,
      required this.hintText,
      this.usercheck = true,
      this.channelName,
      this.channelId,
      required this.textController,
      required this.channelID})
      : super(key: key);
  final Widget widget;
  final Function(String message, List<File> media) sendMessage;
  final String hintText;
  final bool usercheck;
  final focusNode = FocusNode();
  final TextEditingController textController;
  final String? channelName;
  final String? channelId;
  final String channelID;

  final keyboardVisibilityController = KeyboardVisibilityController();
  Stream<bool> get stream =>
      keyboardVisibilityController.onChange.asBroadcastStream();

  @override
  Widget build(BuildContext context) {
    double maxSize = MediaQuery.of(context).size.height - kToolbarHeight - 30;
    return ViewModelBuilder<ExpandableTextFieldScreenViewModel>.reactive(
      viewModelBuilder: () => ExpandableTextFieldScreenViewModel(),
      onModelReady: (model) {
        model.init(maxSize);
        keyboardVisibilityController.onChange.listen((bool visible) {
          model.notifyListeners();
        });

        model.userMentions();
      },
      builder: (__, model, _) {
        return LayoutBuilder(
          builder: (context, constraints) {
            model.maxSize = constraints.maxHeight;
            if (model.isExpanded) model.size = model.maxSize;
            return SizedBox(
              width: MediaQuery.of(context).size.width,
              child: Stack(
                fit: StackFit.expand,
                children: [
                  Align(
                    alignment: Alignment.topCenter,
                    child: Column(
                      children: [
                        Expanded(child: widget),
                        SizedBox.fromSize(
                            size: Size.fromHeight(!model.isVisible
                                ? model.minSize
                                : model.minSize + 50))
                      ],
                    ),
                  ),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Visibility(
                          visible: model.showMembers,
                          child: Container(
                            color: Colors.white,
                            child: SizedBox(
                              height: 200,
                              child: model.matchedUsers!.isNotEmpty
                                  ? ListView.builder(
                                      itemCount: model.matchedUsers!.length,
                                      itemBuilder:
                                          (BuildContext context, int index) {
                                        return GestureDetector(
                                          onTap: () {
                                            String text = (model
                                                .matchedUsers![index]
                                                .userName)!;
                                            String result = textController.text
                                                .substring(
                                                    0,
                                                    textController.text
                                                        .lastIndexOf('@'));

                                            textController.text =
                                                result + '@' + text + ' ';
                                            textController.selection =
                                                TextSelection.fromPosition(
                                                    TextPosition(
                                                        offset: textController
                                                            .text.length));
                                            model.showMembersList(false);
                                          },
                                          child: UserMentions(
                                            membersList: model
                                                .matchedUsers![index].userName!,
                                            name: model.matchedUsers?[index]
                                                    .name ??
                                                '-',
                                          ),
                                        );
                                      })
                                  : null,
                            ),
                          ),
                        ),
                        const Divider(height: 0, color: Color(0xFF999999)),
                        GestureDetector(
                          onPanUpdate: (details) {
                            if (model.isVisible) {
                              double offset = details.delta.dy;
                              double currentSize = model.size - offset;
                              model.size = currentSize;
                              if (model.size > model.maxSize) {
                                model.size = model.maxSize;
                              }
                              if (model.size < model.minSize) {
                                model.size = model.minSize + 50;
                              }
                              model.notifyListeners();
                            }
                          },
                          onPanEnd: (details) {
                            double vel = details.velocity.pixelsPerSecond.dy;
                            if (vel == 0) {
                              if (model.size > (model.maxSize / 2)) {
                                model.toggleExpanded(true);
                              } else {
                                model.toggleExpanded(false);
                              }
                            }

                            if (vel > 1000) {
                              // size = minSize;
                              model.toggleExpanded(false);
                            } else if (vel < -1000) {
                              // size = maxSize;
                              model.toggleExpanded(true);
                            } else {
                              model.toggleExpanded(model.isExpanded);
                            }
                          },
                          child: Container(
                            color:
                                Theme.of(context).brightness == Brightness.dark
                                    ? AppColors.darkThemePrimaryColor
                                    : AppColors.whiteColor,
                            child: SizedBox.fromSize(
                              size: Size.fromHeight(model.size),
                              child: Column(
                                crossAxisAlignment: model.isExpanded
                                    ? CrossAxisAlignment.start
                                    : CrossAxisAlignment.center,
                                children: [
                                  Container(
                                    alignment: Alignment.topRight,
                                    child: Visibility(
                                      visible: model.isExpanded,
                                      child: GestureDetector(
                                        onTap: () => model
                                            .toggleExpanded(!model.isExpanded),
                                        child: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: SvgPicture.asset(
                                            maximize,
                                            color: AppColors.darkGreyColor,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    // height:
                                    //     size,
                                    child: !usercheck
                                        ? CheckUser(channelId, channelName)
                                        : MyTextField(
                                            toggleMembersList:
                                                model.showMembersList,
                                            toggleVisibility:
                                                model.toggleVisibility,
                                            model: model,
                                            showMembers: model.showMembers,
                                            isExpanded: model.isExpanded,
                                            controller: textController,
                                            focus: focusNode,
                                            hintText: hintText,
                                            isVisible: model.isVisible,
                                            toggleExpanded: () {
                                              if (!model.isExpanded) {
                                                model.toggleExpanded(true);
                                              } else {
                                                model.toggleExpanded(false);
                                              }
                                            },
                                          ),
                                  ),
                                  Visibility(
                                    visible: model.isVisible,
                                    child: SizedBox(
                                      width: MediaQuery.of(context).size.width,
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          const SizedBox(width: 10),
                                          //TODO
                                          // GestureDetector(
                                          //   onTap: () {},
                                          //   child: Padding(
                                          //     padding:
                                          //         const EdgeInsets.all(8.0),
                                          //     child: SvgPicture.asset(
                                          //       zap,
                                          //     ),
                                          //   ),
                                          // ),
                                          GestureDetector(
                                            onTap: () {
                                              textController.text =
                                                  textController.text + '@';
                                              textController.selection =
                                                  TextSelection.fromPosition(
                                                      TextPosition(
                                                          offset: textController
                                                              .text.length));
                                              if (!model.showMembers) {
                                                model.showMembersList(true);
                                              } else {
                                                model.showMembersList(false);
                                              }
                                            },
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              child: SvgPicture.asset(
                                                at_sign,
                                              ),
                                            ),
                                          ),
                                          //TODO
                                          // GestureDetector(
                                          //   onTap: () {},
                                          //   child: Padding(
                                          //     padding:
                                          //         const EdgeInsets.all(8.0),
                                          //     child: SvgPicture.asset(
                                          //       Smile,
                                          //     ),
                                          //   ),
                                          // ),
                                          const Spacer(),
                                          GestureDetector(
                                            onTap: () =>
                                                model.onCameraTap("roomId"),
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              child: SvgPicture.asset(
                                                Camera,
                                                color: AppColors.darkGreyColor,
                                              ),
                                            ),
                                          ),
                                          //TODO
                                          // GestureDetector(
                                          //   onTap: () {},
                                          //   child: Padding(
                                          //     padding:
                                          //         const EdgeInsets.all(8.0),
                                          //     child: SvgPicture.asset(
                                          //       Channel_Page_Share,
                                          //     ),
                                          //   ),
                                          // ),
                                          GestureDetector(
                                            onTap: () async {
                                              if (textController.text
                                                      .toString()
                                                      .isNotEmpty /* &&
                                                  model.mediaList.isNotEmpty*/
                                                  ) {
                                                sendMessage(textController.text,
                                                    model.mediaList);
                                                model.clearMediaList();
                                                model.toggleExpanded(false);

                                                /// Send Message
                                                String textInput =
                                                    textController.text;
                                                textController.clear();
                                                var usernames = [];
                                                while (
                                                    textInput.contains('@')) {
                                                  String at = '@';
                                                  final startIndex =
                                                      textInput.indexOf('@');

                                                  int endIndex = 0;
                                                  if (textInput.contains(' ',
                                                      startIndex + at.length)) {
                                                    endIndex =
                                                        textInput.indexOf(
                                                            ' ',
                                                            startIndex +
                                                                at.length);
                                                  } else {
                                                    endIndex = textInput.length;
                                                  }

                                                  String username =
                                                      textInput.substring(
                                                          startIndex +
                                                              at.length,
                                                          endIndex);

                                                  if (textInput
                                                      .startsWith(at)) {
                                                    textInput =
                                                        textInput.substring(1);
                                                  } else {
                                                    textInput =
                                                        textInput.substring(
                                                            startIndex - 1,
                                                            startIndex);
                                                  }

                                                  usernames.add(username);
                                                }

                                                if (usernames.isNotEmpty) {
                                                  String? displayName =
                                                      model.displayName;
                                                  String message =
                                                      '$displayName invited you to join $channelName';
                                                  if (usernames.length > 1) {
                                                    for (var username
                                                        in usernames) {
                                                      bool? response =
                                                          await model
                                                              .addUserToChannel(
                                                                  channelId!,
                                                                  username);
                                                      if (response!) {
                                                        sendMessage(
                                                            '$username joined $channelName by invitation from $displayName',
                                                            model.mediaList);
                                                        model
                                                            .notifyUserOnMention(
                                                                message,
                                                                channelName!);
                                                      }
                                                    }
                                                  } else {
                                                    var username = usernames[0];
                                                    bool? response = await model
                                                        .addUserToChannel(
                                                            channelId!,
                                                            username);
                                                    if (response!) {
                                                      model.notifyUserOnMention(
                                                          message,
                                                          channelName!);
                                                    }
                                                  }
                                                }
                                                model.showMembersList(false);
                                              }
                                            },
                                            onLongPress: () {
                                              model.popDialog(
                                                  textController.text,
                                                  channelID);
                                              textController.clear();
                                            },
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              child: SvgPicture.asset(
                                                Send,
                                                color:
                                                    AppColors.zuriPrimaryColor,
                                              ),
                                            ),
                                          ),
                                          const SizedBox(width: 10),
                                        ],
                                      ),
                                    ),
                                  ),
                                  Visibility(
                                    visible: model.mediaList.isNotEmpty,
                                    child: SizedBox(
                                      height: 70,
                                      width: double.infinity,
                                      child: ListView.builder(
                                        itemCount: model.mediaList.length,
                                        scrollDirection: Axis.horizontal,
                                        itemBuilder: (__, index) {
                                          final media = model.mediaList[index];
                                          return Image.file(media);
                                        },
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            );
          },
        );
      },
    );
  }
}
