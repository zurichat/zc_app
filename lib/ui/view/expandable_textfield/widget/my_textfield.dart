import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:zurichat/utilities/constants/app_strings.dart';
import 'package:zurichat/utilities/constants/colors.dart';
import 'package:zurichat/utilities/constants/text_styles.dart';

import '../expandable_textfield_screen_viewmodel.dart';

class MyTextField extends StatelessWidget {
  const MyTextField({
    Key? key,
    required this.showMembers,
    required this.toggleMembersList,
    required this.model,
    required this.toggleVisibility,
    required this.isExpanded,
    required this.controller,
    required this.focus,
    required this.hintText,
    required this.isVisible,
    required this.toggleExpanded,
  }) : super(key: key);

  final void Function(bool p1) toggleMembersList;
  final void Function(bool p1) toggleVisibility;
  final ExpandableTextFieldScreenViewModel model;
  final bool showMembers;
  final bool isExpanded;
  final TextEditingController controller;
  final FocusNode focus;
  final String hintText;
  final bool isVisible;
  final void Function() toggleExpanded;

  @override
  Widget build(BuildContext context) {
    int startIndexOfTag = 0;
    int endIndexOfTag = 0;
    bool detected = false;
    String word = '';
    var search = [];
    return Focus(
      onFocusChange: toggleVisibility,
      child: Row(
        crossAxisAlignment:
            isExpanded ? CrossAxisAlignment.start : CrossAxisAlignment.center,
        children: [
          Expanded(
            child: RawKeyboardListener(
              focusNode: focus,
              onKey: (event) {
                if (event.logicalKey == LogicalKeyboardKey.space) {
                  //toggleMembersList(false);
                }
              },
              child: TextField(
                controller: controller,
                expands: true,
                maxLines: null,
                minLines: null,
                autofocus: focus.hasFocus,
                cursorColor: AppColors.zuriPrimaryColor,
                onChanged: (value) {
                  var cursorPos = controller.selection.base.offset;
                  String prefixText = controller.text.substring(0, cursorPos);
                  if (prefixText.contains('@')) {
                    detected = true;
                  }

                  if (value.endsWith('@')) {
                    detected = true;
                    startIndexOfTag = value.length - 1;
                  }

                  if (detected == true) {
                    word = value.substring(startIndexOfTag);
                  }

                  if ((detected == true && value.endsWith(' ')) ||
                      startIndexOfTag == 1) {
                    detected = false;
                    endIndexOfTag = value.length;
                    search.clear();
                  }

                  if (value.length < endIndexOfTag) {
                    detected = true;
                    endIndexOfTag = value.length;
                    startIndexOfTag = value.indexOf('@');
                  }
                  toggleMembersList(detected);

                  if (word.contains('@')) {
                    search = word.split('@');
                    model.onSearchUser(search[1]);
                  }
                },
                textAlignVertical: isExpanded
                    ? TextAlignVertical.top
                    : TextAlignVertical.center,
                decoration: InputDecoration.collapsed(
                  hintText: hintText,
                  hintStyle: AppTextStyle.lightGreySize14,
                ).copyWith(contentPadding: const EdgeInsets.all(8)),
              ),
            ),
          ),
          Visibility(
            visible: !isExpanded && isVisible,
            child: GestureDetector(
              onTap: () => toggleExpanded(),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: SvgPicture.asset(
                  minimize,
                  color: AppColors.darkGreyColor,
                ),
              ),
            ),
          ),
          Visibility(
            visible: !isVisible,
            child: Row(
              children: [
                //TODO
                // GestureDetector(
                //   onTap: () {},
                //   child: Padding(
                //     padding: const EdgeInsets.all(8.0),
                //     child: SvgPicture.asset(
                //       zap,
                //       color: AppColors.darkGreyColor,
                //     ),
                //   ),
                // ),
                // GestureDetector(
                //   onTap: () {},
                //   child: Padding(
                //     padding: const EdgeInsets.all(8.0),
                //     child: SvgPicture.asset(
                //       Camera,
                //       height: 24,
                //       width: 24,
                //       color: AppColors.darkGreyColor,
                //     ),
                //   ),
                // ),
                GestureDetector(
                  onTap: () {},
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SvgPicture.asset(
                      Send,
                      color: AppColors.darkGreyColor,
                      height: 17.2,
                      width: 15.42,
                    ),
                  ),
                ),
                const SizedBox(width: 10),
              ],
            ),
          )
        ],
      ),
    );
  }
}
