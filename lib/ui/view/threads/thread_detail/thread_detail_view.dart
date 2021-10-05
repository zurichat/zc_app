import 'package:flutter/material.dart';
import 'package:hng/constants/app_strings.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked/stacked_annotations.dart';

import '../../../../general_widgets/channel_icon.dart';
import '../../../../general_widgets/custom_text.dart';
import '../../../../models/user_post.dart';
import '../../../shared/colors.dart';
import '../../../shared/smart_widgets/thread_card/thread_card_view.dart';
import '../../../shared/styles.dart';
import '../../dm_user/icons/zap_icon.dart';
import 'thread_detail_viewmodel.dart';
import 'thread_detail_view.form.dart';

@FormView(
  fields: [
    FormTextField(name: 'threadMessages'),
  ],
)
class ThreadDetailView extends StatelessWidget with $ThreadDetailView {
  ThreadDetailView(this.userPost, {Key? key}) : super(key: key);
  final UserPost? userPost;

  @override
  Widget build(BuildContext context) {
    final _scrollController = ScrollController();
    return ViewModelBuilder<ThreadDetailViewModel>.reactive(
      // onModelReady: (model) => model.initialise(userPost!.id!),
      onModelReady: (model) {
        model.getDraft(userPost);
        if(model.storedDraft.isNotEmpty){
          threadMessagesController.text = model.storedDraft;
        }
        model.initialise(userPost!.id!);
      },
      builder: (context, model, child) => Scaffold(
        appBar: AppBar(
          elevation: 0,
          title: const CustomText(text: 'Threads', fontWeight: FontWeight.bold),
          leading: IconButton(
            onPressed: () {
              model.exitPage(userPost, threadMessagesController.text);
            },
            icon: const Icon(
              Icons.arrow_back_ios,
            ),
          ),
        ),
        body: model.isBusy
            ? const Center(child: CircularProgressIndicator())
            : Column(
                children: [
                  Expanded(
                    child: SingleChildScrollView(
                      controller: _scrollController,
                      child: Column(children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 10, vertical: 10),
                          child: Row(
                            children: [
                              const Text(MsgIn),
                              TextButton.icon(
                                  onPressed: () {},
                                  icon: ChannelIcon(
                                      channelType: userPost!.channelType!),
                                  label: Text(
                                    '${userPost!.channelName}',
                                  ),
                                  style: TextButton.styleFrom(
                                    padding: const EdgeInsets.all(0),
                                  )),
                            ],
                          ),
                        ),
                        ThreadCardView.detail(userPost),
                        const Divider(
                          color: AppColors.borderColor,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 15),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                  '${model.channelThreadMessages.length} '
                                  '${model.channelThreadMessages.length == 1 ? "Reply" : "Replies"}',
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
                          padding: EdgeInsets.symmetric(vertical: 5),
                          child: Divider(
                            color: AppColors.borderColor,
                          ),
                        ),
                        model.channelThreadMessages.isNotEmpty
                            ? ListView.builder(
                                itemCount: model.channelThreadMessages.length,
                                physics: const NeverScrollableScrollPhysics(),
                                shrinkWrap: true,
                                itemBuilder: (context, index) =>
                                    ThreadCardView.threadPost(
                                        model.channelThreadMessages[index]),
                              )
                            : Container()
                      ]),
                    ),
                  ),
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
                                        controller: threadMessagesController,
                                        expands: true,
                                        maxLines: null,
                                        textAlignVertical:
                                            TextAlignVertical.center,
                                        decoration: InputDecoration.collapsed(
                                            hintText: 'Add a Reply',
                                            hintStyle:
                                                AppTextStyles.faintBodyText),
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
                                  onPressed: () async {
                                    if (threadMessagesController.text
                                        .toString()
                                        .isNotEmpty) {
                                      final message =
                                          threadMessagesController.text;
                                      threadMessagesController.text = "";
                                      FocusScope.of(context).requestFocus(
                                        FocusNode(),
                                      );

                                      await model.sendThreadMessage(
                                          message, userPost!.channelId);
                                      _scrollController.jumpTo(_scrollController
                                          .position.maxScrollExtent);
                                    }
                                  },
                                  icon: const Icon(
                                    Icons.send,
                                    color: AppColors.darkGreyColor,
                                  ),
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
      ),
      viewModelBuilder: () => ThreadDetailViewModel(),
    );
  }
}
