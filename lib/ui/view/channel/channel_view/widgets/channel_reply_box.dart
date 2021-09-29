import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hng/ui/shared/shared.dart';
import 'package:hng/ui/view/channel/channel_view/channel_page_viewmodel.dart';
import 'package:hng/ui/view/dm_user/icons/zap_icon.dart';
import 'package:stacked_hooks/stacked_hooks.dart';

class ChannelReplyBox extends HookViewModelWidget<ChannelPageViewModel> {
  const ChannelReplyBox({Key? key, this.channelId}) : super(key: key);

  final String? channelId;
  @override
  Widget buildViewModelWidget(
      BuildContext context, ChannelPageViewModel model) {
    TextEditingController _messageController = useTextEditingController();

    return Align(
      alignment: Alignment.bottomCenter,
      child: Material(
        color: Colors.white,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Divider(height: 0, color: Color(0xFF999999)),
            Flexible(
              child: Row(
                children: [
                  Expanded(
                    child: Container(
                      height: model.isExpanded ? double.maxFinite : 56,
                      margin: EdgeInsets.only(left: 13.0),
                      alignment: Alignment.centerLeft,
                      child: FocusScope(
                        child: Focus(
                          onFocusChange: (focus) {
                            if (focus) {
                              model.onMessageFieldTap();
                            } else {
                              model.onMessageFocusChanged();
                            }
                          },
                          child: TextField(
                            controller: _messageController,
                            expands: false,
                            maxLines: model.isExpanded
                                ? double.maxFinite.toInt()
                                : null,
                            minLines: model.isExpanded ? 1 : null,
                            textAlignVertical: TextAlignVertical.center,
                            decoration: InputDecoration.collapsed(
                              hintText: 'Add a Reply',
                              hintStyle: AppTextStyles.faintBodyText,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Visibility(
                    visible: !model.isVisible,
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
                    replacement: IconButton(
                      onPressed: () => model.toggleExpanded(),
                      icon: Icon(
                        Icons.zoom_out_map,
                        color: AppColors.darkGreyColor,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Visibility(
                visible: model.isVisible,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        IconButton(
                            onPressed: () {},
                            icon: Icon(
                              AppIcons.shapezap,
                              color: AppColors.darkGreyColor,
                            )),
                        IconButton(
                            onPressed: () {},
                            icon: Icon(
                              Icons.alternate_email_outlined,
                              color: AppColors.darkGreyColor,
                            )),
                        IconButton(
                            onPressed: () {},
                            icon: Icon(
                              Icons.tag_faces_sharp,
                              color: AppColors.darkGreyColor,
                            )),
                        IconButton(
                            onPressed: () {},
                            icon: Icon(
                              Icons.camera_alt_outlined,
                              color: AppColors.darkGreyColor,
                            )),
                        IconButton(
                            onPressed: () {},
                            icon: Icon(
                              Icons.attach_file_outlined,
                              color: AppColors.darkGreyColor,
                            )),
                      ],
                    ),
                    IconButton(
                        onPressed: () {
                          if (_messageController.text.toString().isNotEmpty) {
                            model.sendMessage(
                                _messageController.text, "$channelId");

                            _messageController.text = "";
                            FocusScope.of(context).requestFocus(FocusNode());
                          }
                        },
                        icon: Icon(
                          Icons.send,
                          color: AppColors.darkGreyColor,
                        ))
                  ],
                ))
          ],
        ),
      ),
    );
  }
}
