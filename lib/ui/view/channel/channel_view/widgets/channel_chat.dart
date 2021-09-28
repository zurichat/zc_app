import 'package:flutter/material.dart';
import 'package:hng/ui/shared/shared.dart';
import 'package:hng/ui/shared/smart_widgets/thread_card/thread_card_view.dart';
import 'package:hng/ui/view/channel/channel_view/channel_page_viewmodel.dart';
import 'package:hng/ui/view/dm_user/icons/zap_icon.dart';
import 'package:hng/utilities/utilities.dart';
import 'package:stacked/stacked.dart';

class ChannelChat extends ViewModelWidget<ChannelPageViewModel> {
  const ChannelChat({
    Key? key,
    this.channelId,
  }) : super(key: key);
  final String? channelId;

  @override
  Widget build(BuildContext context, ChannelPageViewModel viewModel) {
    TextEditingController _messageController = TextEditingController();

    return Column(
      children: [
        Expanded(
          child: !nullListChecker(viewModel.channelUserMessages)
              ? ListView.builder(
                  controller: viewModel.scrollController,
                  itemCount: viewModel.channelUserMessages!.length,
                  itemBuilder: (context, index) =>
                      ThreadCardView.threadChannelMain(
                          viewModel.channelUserMessages![index]),
                )
              : Container(),
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: Material(
            color: Colors.white,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Divider(height: 0, color: Color(0xFF999999)),
                Row(
                  children: [
                    Expanded(
                      child: Container(
                        height: 56,
                        margin: EdgeInsets.only(left: 13.0),
                        alignment: Alignment.centerLeft,
                        child: FocusScope(
                          child: Focus(
                            onFocusChange: (focus) {
                              if (focus) {
                                viewModel.onMessageFieldTap();
                              } else {
                                viewModel.onMessageFocusChanged();
                              }
                            },
                            child: TextField(
                              controller: _messageController,
                              expands: true,
                              maxLines: null,
                              textAlignVertical: TextAlignVertical.center,
                              decoration: InputDecoration.collapsed(
                                  hintText: 'Add a Reply',
                                  hintStyle: AppTextStyles.faintBodyText),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Visibility(
                      visible: !viewModel.isVisible,
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
                Visibility(
                    visible: viewModel.isVisible,
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
                              if (_messageController.text
                                  .toString()
                                  .isNotEmpty) {
                                viewModel.sendMessage(
                                    _messageController.text, "$channelId");

                                _messageController.text = "";
                                FocusScope.of(context)
                                    .requestFocus(FocusNode());
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
        )
      ],
    );
  }
}
