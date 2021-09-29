import 'package:flutter/material.dart';
import 'package:hng/ui/view/dm_user/icons/zap_icon.dart';

import '../ui/shared/shared.dart';

class ExpandableTextField extends StatelessWidget {
  const ExpandableTextField({
    Key? key,
    required this.isExpanded,
    required this.isVisible,
    required this.toggleExpanded,
    required this.toggleVisibility,
    required this.sendMessage,
    required this.controller,
  }) : super(key: key);

  final bool isExpanded;
  final bool isVisible;
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
              child: IconButton(
                onPressed: () => toggleExpanded(),
                icon: Icon(
                  Icons.zoom_out_map,
                  color: AppColors.darkGreyColor,
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
                  IconButton(
                    onPressed: () {},
                    icon: Icon(
                      AppIcons.shapezap,
                      color: AppColors.darkGreyColor,
                    ),
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.alternate_email_outlined,
                      color: AppColors.darkGreyColor,
                    ),
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.tag_faces_sharp,
                      color: AppColors.darkGreyColor,
                    ),
                  ),
                  Spacer(),
                  IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.camera_alt_outlined,
                      color: AppColors.darkGreyColor,
                    ),
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.attach_file_outlined,
                      color: AppColors.darkGreyColor,
                    ),
                  ),
                  IconButton(
                    onPressed: () {
                      if (controller.text.toString().isNotEmpty) {
                        sendMessage();                        
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
    ;
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
              textAlignVertical:
                  isExpanded ? TextAlignVertical.top : TextAlignVertical.center,
              decoration: InputDecoration.collapsed(
                hintText: 'Add a Reply',
                hintStyle: AppTextStyles.faintBodyText,
              ).copyWith(contentPadding: EdgeInsets.all(10)),
            ),
          ),
          Visibility(
            visible: !isExpanded && isVisible,
            child: IconButton(
              onPressed: () => toggleExpanded(),
              icon: Icon(
                Icons.zoom_out_map,
                color: AppColors.darkGreyColor,
              ),
              padding: EdgeInsets.all(2),
            ),
          ),
          Visibility(
            visible: !isVisible,
            child: Row(
              children: [
                IconButton(
                  icon: Icon(
                    Icons.camera_alt_outlined,
                    color: AppColors.darkGreyColor,
                  ),
                  onPressed: () {},
                ),
                IconButton(
                  icon: Icon(
                    Icons.attach_file_outlined,
                    color: AppColors.darkGreyColor,
                  ),
                  onPressed: () {},
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
