import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:hng/ui/shared/shared.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked/stacked_annotations.dart';

import 'expandable_textfield_screen_viewmodel.dart';

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
      required this.textController,
      required this.channelID})
      : super(key: key);
  final Widget widget;
  final Function(String? message) sendMessage;
  final String hintText;
  final focusNode = FocusNode();
  final TextEditingController textController;

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
                      children: [
                        const Divider(height: 0, color: Color(0xFF999999)),
                        GestureDetector(
                          onPanUpdate: (details) {
                            if (model.isVisible) {
                              double offset = details.delta.dy;
                              double currentSize = model.size - offset;
                              // print("moving");
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
                            color: AppColors.whiteColor,
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
                                            'assets/icons/svg_icons/minimize.svg',
                                            color: AppColors.darkGreyColor,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    // height:
                                    //     size,
                                    child: MyTextField(
                                      toggleVisibility: model.toggleVisibility,
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
                                          GestureDetector(
                                            onTap: () {},
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              child: SvgPicture.asset(
                                                'assets/icons/svg_icons/zap.svg',
                                                color: AppColors.darkGreyColor,
                                              ),
                                            ),
                                          ),
                                          GestureDetector(
                                            onTap: () {},
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              child: SvgPicture.asset(
                                                'assets/icons/svg_icons/at_sign.svg',
                                                color: AppColors.darkGreyColor,
                                              ),
                                            ),
                                          ),
                                          GestureDetector(
                                            onTap: () {},
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              child: SvgPicture.asset(
                                                'assets/icons/svg_icons/smile.svg',
                                                color: AppColors.darkGreyColor,
                                              ),
                                            ),
                                          ),
                                          const Spacer(),
                                          GestureDetector(
                                            onTap: () {},
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              child: SvgPicture.asset(
                                                'assets/icons/svg_icons/camera.svg',
                                                color: AppColors.darkGreyColor,
                                              ),
                                            ),
                                          ),
                                          GestureDetector(
                                            onTap: () {},
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              child: SvgPicture.asset(
                                                'assets/icons/svg_icons/paperclip.svg',
                                                color: AppColors.darkGreyColor,
                                              ),
                                            ),
                                          ),
                                          GestureDetector(
                                            onTap: () {
                                              if (textController.text
                                                  .toString()
                                                  .isNotEmpty) {
                                                sendMessage(
                                                    textController.text);
                                                textController.clear();
                                              }
                                            },
                                            onLongPress: () {
                                              model.popDialog(
                                                  textController.text,
                                                  channelID);
                                              textController.clear();
                                            },
                                            child: const Padding(
                                              padding: EdgeInsets.all(8.0),
                                              child: Icon(
                                                Icons.send,
                                                color: AppColors.greyColor,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
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

class MyTextField extends StatelessWidget {
  const MyTextField({
    Key? key,
    required this.toggleVisibility,
    required this.isExpanded,
    required this.controller,
    required this.focus,
    required this.hintText,
    required this.isVisible,
    required this.toggleExpanded,
  }) : super(key: key);

  final void Function(bool p1) toggleVisibility;
  final bool isExpanded;
  final TextEditingController controller;
  final FocusNode focus;
  final String hintText;
  final bool isVisible;
  final void Function() toggleExpanded;

  @override
  Widget build(BuildContext context) {
    return Focus(
      onFocusChange: toggleVisibility,
      child: Row(
        crossAxisAlignment:
            isExpanded ? CrossAxisAlignment.start : CrossAxisAlignment.center,
        children: [
          Expanded(
            child: TextFormField(
              controller: controller,
              expands: true,
              maxLines: null,
              minLines: null,
              focusNode: focus,
              autofocus: focus.hasFocus,
              cursorColor: AppColors.zuriPrimaryColor,
              textAlignVertical:
                  isExpanded ? TextAlignVertical.top : TextAlignVertical.center,
              decoration: InputDecoration.collapsed(
                hintText: hintText,
                hintStyle: AppTextStyles.faintBodyText,
              ).copyWith(contentPadding: const EdgeInsets.all(8)),
            ),
          ),
          Visibility(
            visible: !isExpanded && isVisible,
            child: GestureDetector(
              onTap: () => toggleExpanded(),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: SvgPicture.asset(
                  'assets/icons/svg_icons/maximize.svg',
                  color: AppColors.darkGreyColor,
                ),
              ),
            ),
          ),
          Visibility(
            visible: !isVisible,
            child: Row(
              children: [
                GestureDetector(
                  onTap: () {},
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SvgPicture.asset(
                      'assets/icons/svg_icons/zap.svg',
                      color: AppColors.darkGreyColor,
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {},
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SvgPicture.asset(
                      'assets/icons/svg_icons/camera.svg',
                      color: AppColors.darkGreyColor,
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {},
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SvgPicture.asset(
                      'assets/icons/svg_icons/paperclip.svg',
                      color: AppColors.darkGreyColor,
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
