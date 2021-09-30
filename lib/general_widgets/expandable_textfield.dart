import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../ui/shared/shared.dart';

class ExpandableTextField extends StatelessWidget {
  const ExpandableTextField({
    Key? key,
    required this.hintText,
    required this.isExpanded,
    required this.isVisible,
    required this.focus,
    required this.toggleExpanded,
    required this.toggleVisibility,
    required this.sendMessage,
    required this.controller,
  }) : super(key: key);

  final String hintText;
  final bool isExpanded;
  final bool isVisible;
  final FocusNode focus;
  final TextEditingController controller;
  final void Function() toggleExpanded;
  final void Function(bool) toggleVisibility;
  final void Function() sendMessage;


  @override
  Widget build(BuildContext context) {
    return Container(
      height: isExpanded
          ? MediaQuery.of(context).size.height - kToolbarHeight
          : null,
      alignment: Alignment.bottomCenter,
      color: Colors.white,
      child: Column(
        mainAxisSize: isExpanded ? MainAxisSize.max : MainAxisSize.min,
        children: [
          Divider(height: 0, color: Color(0xFF999999)),
          Container(
            alignment: Alignment.topRight,
            child: Visibility(
              visible: isExpanded,
              child: GestureDetector(
                onTap: () => toggleExpanded(),
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
          Visibility(
            visible: isExpanded,
            child: Expanded(
              child: _buildTextField(),
            ),
            replacement: Container(
              height: 56,
              child: _buildTextField(),
            ),
          ),
          Visibility(
            visible: isVisible,
            child: Container(
              width: MediaQuery.of(context).size.width,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                        'assets/icons/svg_icons/at_sign.svg',
                        color: AppColors.darkGreyColor,
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {},
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: SvgPicture.asset(
                        'assets/icons/svg_icons/smile.svg',
                        color: AppColors.darkGreyColor,
                      ),
                    ),
                  ),
                  Spacer(),
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
                  IconButton(
                    onPressed: () {
                      if (controller.text.toString().isNotEmpty) {
                        sendMessage();
                        controller.clear();
                      }
                    },
                    icon: Icon(
                      Icons.send,
                      color: AppColors.darkGreyColor,
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Focus _buildTextField() {
    return Focus(
      onFocusChange: toggleVisibility,
      child: Row(
        crossAxisAlignment:
            isExpanded ? CrossAxisAlignment.start : CrossAxisAlignment.center,
        children: [
          Expanded(
            child: TextField(
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
              ).copyWith(contentPadding: EdgeInsets.all(8)),
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
