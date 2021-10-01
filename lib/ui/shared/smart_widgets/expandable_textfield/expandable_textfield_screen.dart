import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hng/general_widgets/expandable_textfield.dart';
import 'package:hng/ui/shared/smart_widgets/expandable_textfield/expandable_textfield_screen_viewmodel.dart';
import 'package:stacked/stacked.dart';

import '../../colors.dart';
import '../../styles.dart';

class ExpandableTextFieldScreen extends HookWidget {
  ExpandableTextFieldScreen({
    Key? key,
    required this.widget,
    required this.sendMessage,
    required this.hintText,
  }) : super(key: key);
  final Widget widget;
  final Function(String message) sendMessage;
  final String hintText;
  final focusNode = FocusNode();
  double minSize = 70;

  @override
  Widget build(BuildContext context) {
    double maxSize = MediaQuery.of(context).size.height - kToolbarHeight - 100;
    double size = minSize;
    double offset = 0;
    TextEditingController textController = useTextEditingController();
    return ViewModelBuilder<ExpandableTextFieldScreenViewModel>.reactive(
        viewModelBuilder: () => ExpandableTextFieldScreenViewModel(),
        builder: (__, model, _) {
          // if (model.isExpanded) {
          //   return ExpandableTextField(
          //     focus: focusNode,
          //     hintText: hintText,
          //     controller: textController,
          //     isExpanded: model.isExpanded,
          //     isVisible: model.isVisible,
          //     sendMessage: () {
          //       sendMessage(textController.text);
          //       textController.clear();
          //       model.toggleExpanded();
          //       // model.toggleExpanded();
          //     },
          //     toggleExpanded: model.toggleExpanded,
          //     toggleVisibility: (val) => model.toggleVisibility(val),
          //   );
          // } else {
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
                      SizedBox.fromSize(size: Size.fromHeight(minSize))
                    ],
                  ),
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Column(
                    children: [
                      Expanded(child: Container()),
                      Divider(thickness: 2),
                      GestureDetector(
                        onPanUpdate: (details) {
                          offset = details.delta.dy;
                          double currentSize = minSize + offset;

                          if (currentSize > maxSize / 2) {
                            size = maxSize;
                            model.toggleExpanded(true);
                          } else {
                            size = minSize;
                            model.toggleExpanded(false);
                          }
                          // notifyListeners?
                        },
                        onPanEnd: (details) {
                          double vel = details.velocity.pixelsPerSecond.dy;
                          print(vel);

                          if (vel > 100) {
                            if (details.velocity.pixelsPerSecond.direction >
                                0) {
                              //going down
                              size = minSize;
                              model.toggleExpanded(false);
                            } else {
                              size = maxSize;
                              model.toggleExpanded(true);
                            }
                          }
                        },
                        child: SizedBox.fromSize(
                          size: Size.fromHeight(size),
                          child: Column(
                            crossAxisAlignment: model.isExpanded
                                ? CrossAxisAlignment.start
                                : CrossAxisAlignment.center,
                            children: [
                              Divider(height: 0, color: Color(0xFF999999)),
                              Container(
                                alignment: Alignment.topRight,
                                child: Visibility(
                                  visible: model.isExpanded,
                                  child: GestureDetector(
                                    onTap: () =>
                                        model.toggleExpanded(!model.isExpanded),
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
                              Row(
                                children: [
                                  Expanded(
                                    child: MyTextField(
                                      controller: textController,
                                      isExpanded: true,
                                      focus: focusNode,
                                      hintText: hintText,
                                      isVisible: model.isVisible,
                                      toggleExpanded: () => model
                                          .toggleExpanded(!model.isExpanded),
                                      toggleVisibility: model.toggleVisibility,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                      // ExpandableTextField(
                      //   focus: focusNode,
                      //   hintText: hintText,
                      //   controller: textController,
                      //   isExpanded: model.isExpanded,
                      //   isVisible: model.isVisible,
                      //   sendMessage: () => sendMessage(textController.text),
                      //   toggleExpanded: model.toggleExpanded,
                      //   toggleVisibility: model.toggleVisibility,
                      // ),
                    ],
                  ),
                ),
              ],
            ),
          );
        }
        // },
        );
  }
}
