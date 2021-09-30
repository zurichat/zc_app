import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import '../../../../general_widgets/channel_icon.dart';
import '../../../../general_widgets/custom_text.dart';
import '../../../../models/user_post.dart';
import '../../../shared/colors.dart';
import '../../../shared/smart_widgets/thread_card/thread_card_view.dart';
import '../../../shared/styles.dart';
import '../../dm_user/icons/zap_icon.dart';
import 'thread_detail_viewmodel.dart';

class ThreadDetailView extends StatelessWidget {
  const ThreadDetailView(this.userPost, {Key? key}) : super(key: key);
  final UserPost? userPost;

  @override
  Widget build(BuildContext context) {
    // var _scrollController = useScrollController();
    // var _messageController = useTextEditingController();
    final _scrollController = ScrollController();
    final _messageController = TextEditingController();
    return ViewModelBuilder<ThreadDetailViewModel>.reactive(
      builder: (context, model, child) => Scaffold(
          appBar: AppBar(
            elevation: 0,
            title:
                const CustomText(text: 'Threads', fontWeight: FontWeight.bold),
            leading: IconButton(
                onPressed: model.exitPage,
                icon: const Icon(
                  Icons.arrow_back_ios,
                )),
          ),
          body: SafeArea(
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                child: Row(
                  children: [
                    const Text('Message in'),
                    TextButton.icon(
                        onPressed: () {},
                        icon: ChannelIcon(channelType: userPost!.channelType!),
                        label: Text(
                          '${userPost!.channelName}',
                        ),
                        style: TextButton.styleFrom(
                          padding: const EdgeInsets.all(0),
                        )),
                  ],
                ),
              ),

              ThreadCardView.detail(userPost!),

              const Divider(
                color: AppColors.borderColor,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('${userPost!.userThreadPosts!.length} Replies',
                        style: AppTextStyles.body2Bold),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        IconButton(
                            onPressed: () {},
                            icon: const Icon(
                              Icons.forward_outlined,
                              color: AppColors.greyishColor,
                            )),
                        IconButton(
                            onPressed: model.showThreadOptions,
                            icon: const Icon(Icons.more_vert_rounded,
                                color: AppColors.greyishColor)),
                      ],
                    )
                  ],
                ),
              ),
              const Padding(
                padding: const EdgeInsets.symmetric(vertical: 5),
                child: Divider(
                  color: AppColors.borderColor,
                ),
              ),
              Expanded(
                child: userPost!.userThreadPosts != null
                    ? ListView.builder(
                        controller: _scrollController,
                        itemCount: userPost!.userThreadPosts!.length,
                        itemBuilder: (context, index) =>
                            ThreadCardView.threadPost(
                                userPost!.userThreadPosts![index]),
                      )
                    : Container(),
              ),
              //message starts here
              Align(
                alignment: Alignment.bottomCenter,
                child: Material(
                  color: Colors.white,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      // ignore: todo
                      //TODO Change to brand colors
                      const Divider(height: 0, color: Color(0xFF999999)),
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
                                      model.onMessageFieldTap();
                                    } else {
                                      model.onMessageFocusChanged();
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
                            visible: !model.isVisible,
                            child: Row(
                              children: [
                                IconButton(
                                  icon: const Icon(
                                    Icons.camera_alt_outlined,
                                    color: AppColors.darkGreyColor,
                                  ),
                                  onPressed: () {},
                                ),
                                IconButton(
                                  icon: const Icon(
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
                          visible: model.isVisible,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  IconButton(
                                    onPressed: () {},
                                    icon: const Icon(
                                      AppIcons.shapezap,
                                      color: AppColors.darkGreyColor,
                                    ),
                                  ),
                                  IconButton(
                                    onPressed: () {},
                                    icon: const Icon(
                                      Icons.alternate_email_outlined,
                                      color: AppColors.darkGreyColor,
                                    ),
                                  ),
                                  IconButton(
                                      onPressed: () {},
                                      icon: const Icon(
                                        Icons.tag_faces_sharp,
                                        color: AppColors.darkGreyColor,
                                      )),
                                  IconButton(
                                      onPressed: () {},
                                      icon: const Icon(
                                        Icons.camera_alt_outlined,
                                        color: AppColors.darkGreyColor,
                                      )),
                                  IconButton(
                                      onPressed: () {},
                                      icon: const Icon(
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
                                      model.addReply(
                                        userPost!,
                                        _messageController.text,
                                      );

                                      _messageController.text = '';
                                      FocusScope.of(context)
                                          .requestFocus(FocusNode());
                                      _scrollController.jumpTo(_scrollController
                                          .position.maxScrollExtent);
                                    }
                                  },
                                  icon: const Icon(
                                    Icons.send,
                                    color: AppColors.darkGreyColor,
                                  ))
                            ],
                          ))
                    ],
                  ),
                ),
              )
            ]),
          )),
      viewModelBuilder: () => ThreadDetailViewModel(),
    );
  }
}
